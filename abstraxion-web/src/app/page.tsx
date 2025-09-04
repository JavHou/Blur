"use client";
import { useAbstraxionAccount, useModal } from "@burnt-labs/abstraxion";
import { Abstraxion } from "@burnt-labs/abstraxion";
import { useEffect, useState, Suspense } from "react";
import { useSearchParams } from "next/navigation";

function HomeContent() {
  const { data: account, isConnected } = useAbstraxionAccount();
  const [, setShow] = useModal();
  const searchParams = useSearchParams();
  const [isConnecting, setIsConnecting] = useState(false);
  const [isHoveringConnect, setIsHoveringConnect] = useState(false);
  const [isHoveringFlutter, setIsHoveringFlutter] = useState(false);

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
    <main className="min-h-screen bg-black flex flex-col relative overflow-hidden">
      {/* 背景装饰 */}
      <div className="absolute inset-0 bg-gradient-to-br from-blue-900/20 via-purple-900/20 to-black pointer-events-none"></div>
      <div className="absolute top-1/4 left-1/4 w-32 h-32 bg-blue-500/10 rounded-full blur-xl"></div>
      <div className="absolute bottom-1/4 right-1/4 w-24 h-24 bg-purple-500/10 rounded-full blur-xl"></div>

      {/* 主要内容区域 */}
      <div className="flex-1 flex items-center justify-center p-4">
        <div className="relative z-10 w-full max-w-sm mx-auto">
          {/* Logo 区域 */}
          <div className="text-center mb-12">
            {/* <div className="inline-flex items-center justify-center w-16 h-16 bg-gradient-to-br from-blue-500 to-purple-600 rounded-2xl mb-6 shadow-lg">
              <span className="text-2xl font-bold text-white">A</span>
            </div> */}
            {/* <h1 className="text-3xl font-bold tracking-tight text-white mb-2">
              ABSTRAXION
            </h1>
            <p className="text-gray-400 text-sm">
              Connect your wallet securely
            </p> */}
          </div>

          {/* 连接按钮 */}
          <div className="space-y-6">
            <button
              onClick={handleConnect}
              disabled={isConnecting}
              className={`
                  w-full py-4 px-6 rounded-2xl font-semibold text-lg transition-all duration-200
                  border-2 border-white
                  bg-white text-black hover:bg-gray-100 shadow-lg hover:shadow-gray-500/25
                  transform hover:scale-[1.02] active:scale-[0.98] shadow-xl
                  ${isConnecting ? 'bg-gray-300 cursor-not-allowed' : ''}
                  ${account?.bech32Address ? 'bg-white text-black hover:bg-gray-100 shadow-lg hover:shadow-gray-500/25' : ''}
                `}
              style={{ boxSizing: 'border-box' }}
            >
              {isConnecting ? (
                <div className="flex items-center justify-center gap-3">
                  <div className="spinner"></div>
                  <span>CONNECTING...</span>
                </div>
              ) : account?.bech32Address ? (
                <div className="flex items-center justify-center gap-2">
                  <div className="status-indicator status-connected"></div>
                  <span>VIEW ACCOUNT</span>
                </div>
              ) : (
                <span>CONNECT</span>
              )}
            </button>

            {/* 账户信息卡片 */}
            {account?.bech32Address && (
              <div className="card mt-8">
                <div className="flex items-center gap-3 mb-3">
                  <div className="status-indicator status-connected"></div>
                  <span className="text-sm font-medium text-green-400">Connected</span>
                </div>

                <div className="bg-gray-700/50 rounded-xl p-4 mb-4">
                  <div className="text-xs text-gray-400 mb-1">Wallet Address</div>
                  <div className="text-white font-mono text-sm break-all">
                    {account.bech32Address}
                  </div>
                </div>

                {(searchParams.get('callback') || searchParams.get('deeplink') || searchParams.get('auto_redirect') || searchParams.get('granted')) && (
                  <div className="flex items-center gap-2 text-green-400 text-sm">
                    <div className="spinner" style={{ width: '16px', height: '16px' }}></div>
                    <span>Redirecting to app...</span>
                  </div>
                )}
              </div>
            )}

            {/* Flutter 发送按钮 */}
            {/* {account?.bech32Address && (
              <button
                onClick={handleSendToFlutter}
                className="w-full py-3 px-6 rounded-xl font-medium text-white bg-gray-700 hover:bg-gray-600 transition-all duration-200 border-2 border-white shadow-lg transform hover:scale-[1.02] active:scale-[0.98]"
                style={{ boxSizing: 'border-box' }}
              >
                Send to Flutter
              </button>
            )} */}
          </div>
        </div>
      </div>

      {/* 安全提示 - 放置在页面中下部分 */}
      <div className="relative z-10 pb-8 px-4 flex justify-center">
        <div className="inline-flex items-center gap-2 text-xs text-gray-500 bg-gray-800/50 px-3 py-2 rounded-lg">
          <svg className="w-3 h-3" fill="currentColor" viewBox="0 0 20 20">
            <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clipRule="evenodd" />
          </svg>
          <span>Secured by Xion Abstraxion</span>
        </div>
      </div>

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
      <main className="min-h-screen bg-black flex flex-col relative overflow-hidden">
        {/* 背景装饰 */}
        <div className="absolute inset-0 bg-gradient-to-br from-blue-900/20 via-purple-900/20 to-black pointer-events-none"></div>

        {/* 主要内容区域 */}
        <div className="flex-1 flex items-center justify-center p-4">
          <div className="relative z-10 flex flex-col items-center">
            <div className="inline-flex items-center justify-center w-16 h-16 bg-gradient-to-br from-blue-500 to-purple-600 rounded-2xl mb-6 shadow-lg">
              <span className="text-2xl font-bold text-white">A</span>
            </div>

            <div className="spinner mb-4" style={{ width: '32px', height: '32px' }}></div>

            <h1 className="text-2xl font-bold tracking-tight text-white">
              Loading...
            </h1>
          </div>
        </div>

        {/* 安全提示 - 放置在页面中下部分 */}
        <div className="relative z-10 pb-8 px-4 flex justify-center">
          <div className="inline-flex items-center gap-2 text-xs text-gray-500 bg-gray-800/50 px-3 py-2 rounded-lg">
            <svg className="w-3 h-3" fill="currentColor" viewBox="0 0 20 20">
              <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clipRule="evenodd" />
            </svg>
            <span>Secured by Abstraxion</span>
          </div>
        </div>
      </main>
    }>
      <HomeContent />
    </Suspense>
  );
}