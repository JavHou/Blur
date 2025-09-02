"use client";
import { useAbstraxionAccount, useModal } from "@burnt-labs/abstraxion";
import { Abstraxion } from "@burnt-labs/abstraxion";
import { Button } from "@burnt-labs/ui";
import { useEffect, useState, Suspense } from "react";
import { useSearchParams } from "next/navigation";

function HomeContent() {
  const { data: account, isConnected } = useAbstraxionAccount();
  const [, setShow] = useModal();
  const searchParams = useSearchParams();
  const [isConnecting, setIsConnecting] = useState(false);

  const sendToFlutter = (data: { address: string; status: string; success: boolean }) => {
    console.log('Sending to Flutter:', data);

    // 发送到父窗口 (Flutter WebView)
    if (window.flutter_inappwebview) {
      window.flutter_inappwebview.callHandler('FlutterChannel', JSON.stringify(data));
    } else {
      // 备用方式，使用 postMessage
      window.parent.postMessage({ type: "ABSTRAXION_RESULT", data }, "*");
    }
  };

  const redirectToFlutterApp = (address: string, success: boolean) => {
    const deeplink = searchParams.get('deeplink');
    const callback = searchParams.get('callback'); // 添加对 callback 参数的支持
    const callbackScheme = searchParams.get('callback_scheme') || callback || 'blur';

    if (deeplink) {
      // 使用提供的 deeplink
      const redirectUrl = `${deeplink}?address=${encodeURIComponent(address)}&success=${success}&timestamp=${Date.now()}`;
      console.log('Redirecting to deeplink:', redirectUrl);
      window.location.href = redirectUrl;
    } else {
      // 使用 callback 参数或默认的 app scheme  
      const redirectUrl = `${callbackScheme}://auth/callback?address=${encodeURIComponent(address)}&success=${success}&timestamp=${Date.now()}`;
      console.log('Redirecting to app:', redirectUrl);
      window.location.href = redirectUrl;
    }
  };

  // 监听账户变化和连接状态
  useEffect(() => {
    if (isConnected && account?.bech32Address) {
      console.log('Account connected:', account.bech32Address);

      const data = {
        address: account.bech32Address,
        status: 'connected',
        success: true
      };

      sendToFlutter(data);

      // 检查是否需要自动跳转回 Flutter app
      const hasCallback = searchParams.get('callback');
      const hasDeeplink = searchParams.get('deeplink');
      const autoRedirect = searchParams.get('auto_redirect') === 'true';
      const granted = searchParams.get('granted') === 'true';

      if (hasCallback || hasDeeplink || autoRedirect || granted) {
        console.log('Auto-redirecting to Flutter app...');
        setTimeout(() => {
          redirectToFlutterApp(account.bech32Address, true);
        }, 1500); // 延迟1.5秒让用户看到连接成功
      }

      setIsConnecting(false);
    } else if (isConnecting && !isConnected) {
      // 连接失败
      setTimeout(() => {
        setIsConnecting(false);
      }, 3000);
    }
  }, [account?.bech32Address, isConnected, isConnecting]);

  // 让 setShow 函数在全局可用，以便 WebView 可以调用
  useEffect(() => {
    window.setShow = setShow;
    console.log('setShow function exposed to window');
  }, [setShow]);

  const handleConnect = () => {
    console.log('Connect button clicked');
    if (!isConnected) {
      setIsConnecting(true);
      setShow(true);
    } else {
      // 如果已经连接，显示账户信息
      setShow(true);
    }
  };

  const handleSendToFlutter = () => {
    if (account?.bech32Address) {
      const data = {
        address: account.bech32Address,
        status: 'connected',
        success: true
      };
      sendToFlutter(data);

      // 也可以触发 deeplink 跳转
      redirectToFlutterApp(account.bech32Address, true);
    }
  };

  return (
    <main className="m-auto flex min-h-screen max-w-xs flex-col items-center justify-center gap-4 p-4">
      <h1 className="text-2xl font-bold tracking-tighter text-white">ABSTRAXION</h1>

      <Button
        fullWidth
        onClick={handleConnect}
        structure="base"
        disabled={isConnecting}
      >
        {isConnecting ? (
          <div className="flex items-center justify-center gap-2">
            <div className="animate-spin rounded-full h-4 w-4 border-b-2 border-white"></div>
            CONNECTING...
          </div>
        ) : account?.bech32Address ? (
          <div className="flex items-center justify-center">VIEW ACCOUNT</div>
        ) : (
          "CONNECT"
        )}
      </Button>

      {account?.bech32Address && (
        <div className="text-white text-sm mt-2 text-center">
          <div>Connected: {account.bech32Address.slice(0, 10)}...</div>
          {(searchParams.get('callback') || searchParams.get('deeplink') || searchParams.get('auto_redirect') || searchParams.get('granted')) && (
            <div className="text-green-400 text-xs mt-1">
              Auto-redirecting to app...
            </div>
          )}
        </div>
      )}

      {account?.bech32Address && (
        <Button
          fullWidth
          onClick={handleSendToFlutter}
          structure="base"
        >
          Send to Flutter
        </Button>
      )}

      <Abstraxion onClose={() => {
        setShow(false);
        setIsConnecting(false);
      }} />
    </main>
  );
}

export default function Home() {
  return (
    <Suspense fallback={
      <main className="m-auto flex min-h-screen max-w-xs flex-col items-center justify-center gap-4 p-4">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-white mx-auto mb-4"></div>
        <h1 className="text-2xl font-bold tracking-tighter text-white">Loading...</h1>
      </main>
    }>
      <HomeContent />
    </Suspense>
  );
}