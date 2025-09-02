"use client";
import { useAbstraxionAccount } from "@burnt-labs/abstraxion";
import { useEffect, useState, Suspense } from "react";
import { useSearchParams } from "next/navigation";

function CallbackContent() {
    const { data: account, isConnected } = useAbstraxionAccount();
    const searchParams = useSearchParams();
    const [processing, setProcessing] = useState(true);

    const redirectToFlutter = (address: string, success: boolean) => {
        const deeplink = searchParams.get('deeplink');
        const callbackScheme = searchParams.get('callback_scheme') || 'yourapp'; // 默认scheme

        if (deeplink) {
            // 使用提供的 deeplink
            const redirectUrl = `${deeplink}?address=${encodeURIComponent(address)}&success=${success}`;
            console.log('Redirecting to deeplink:', redirectUrl);
            window.location.href = redirectUrl;
        } else {
            // 使用默认的 app scheme
            const redirectUrl = `${callbackScheme}://auth/callback?address=${encodeURIComponent(address)}&success=${success}`;
            console.log('Redirecting to app:', redirectUrl);
            window.location.href = redirectUrl;
        }
    };

    const sendToFlutterWebView = (data: { address: string; status: string; success: boolean }) => {
        console.log('Sending to Flutter WebView:', data);

        // 发送到父窗口 (Flutter WebView)
        if (window.flutter_inappwebview) {
            window.flutter_inappwebview.callHandler('FlutterChannel', JSON.stringify(data));
        } else {
            // 备用方式，使用 postMessage
            window.parent.postMessage({ type: "ABSTRAXION_RESULT", data }, "*");
        }
    };

    useEffect(() => {
        let timeoutId: NodeJS.Timeout;

        if (isConnected && account?.bech32Address) {
            console.log('Authentication successful, account:', account.bech32Address);

            const data = {
                address: account.bech32Address,
                status: 'connected',
                success: true
            };

            // 发送到 Flutter WebView (如果在 WebView 中)
            sendToFlutterWebView(data);

            // 等待一下然后跳转到 Flutter app
            timeoutId = setTimeout(() => {
                redirectToFlutter(account.bech32Address, true);
                setProcessing(false);
            }, 1000);
        } else {
            // 如果5秒后还没有连接成功，认为失败
            timeoutId = setTimeout(() => {
                console.log('Authentication timeout or failed');

                const data = {
                    address: '',
                    status: 'failed',
                    success: false
                };

                sendToFlutterWebView(data);
                redirectToFlutter('', false);
                setProcessing(false);
            }, 5000);
        }

        return () => {
            if (timeoutId) {
                clearTimeout(timeoutId);
            }
        };
    }, [isConnected, account?.bech32Address]);

    return (
        <main className="m-auto flex min-h-screen max-w-xs flex-col items-center justify-center gap-4 p-4">
            <div className="text-center">
                <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-white mx-auto mb-4"></div>
                <h1 className="text-2xl font-bold tracking-tighter text-white mb-2">
                    {processing ? 'Processing Authentication...' : 'Authentication Complete'}
                </h1>
                {account?.bech32Address && (
                    <p className="text-white text-sm">
                        Connected: {account.bech32Address.slice(0, 10)}...
                    </p>
                )}
                <p className="text-gray-300 text-sm mt-2">
                    Redirecting to app...
                </p>
            </div>
        </main>
    );
}

export default function CallbackPage() {
    return (
        <Suspense fallback={
            <main className="m-auto flex min-h-screen max-w-xs flex-col items-center justify-center gap-4 p-4">
                <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-white mx-auto mb-4"></div>
                <h1 className="text-2xl font-bold tracking-tighter text-white">Loading...</h1>
            </main>
        }>
            <CallbackContent />
        </Suspense>
    );
}
