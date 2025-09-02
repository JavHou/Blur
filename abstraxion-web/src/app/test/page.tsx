"use client";
import { useState } from "react";

export default function TestPage() {
    const [testUrl, setTestUrl] = useState('');
    const [results, setResults] = useState<Array<{ timestamp: string; data: unknown }>>([]);

    const generateTestUrl = (params: { deeplink?: string; autoRedirect?: boolean; callbackScheme?: string }) => {
        const baseUrl = typeof window !== 'undefined' ? window.location.origin : 'https://your-domain.com';
        const searchParams = new URLSearchParams();

        if (params.deeplink) {
            searchParams.set('deeplink', params.deeplink);
        }
        if (params.autoRedirect) {
            searchParams.set('auto_redirect', 'true');
        }
        if (params.callbackScheme) {
            searchParams.set('callback_scheme', params.callbackScheme);
        }

        return `${baseUrl}/?${searchParams.toString()}`;
    };

    const testScenarios = [
        {
            name: "基本 Deeplink 测试",
            params: { deeplink: "yourapp://auth/callback", autoRedirect: true }
        },
        {
            name: "自定义 Scheme 测试",
            params: { callbackScheme: "myapp", autoRedirect: true }
        },
        {
            name: "手动模式测试",
            params: { deeplink: "yourapp://auth/callback", autoRedirect: false }
        },
        {
            name: "WebView 模式测试",
            params: { autoRedirect: false }
        }
    ];

    const runTest = (scenario: { name: string; params: { deeplink?: string; autoRedirect?: boolean; callbackScheme?: string } }) => {
        const url = generateTestUrl(scenario.params);
        setTestUrl(url);

        // 在新窗口中打开测试
        window.open(url, '_blank', 'width=400,height=600');
    };

    // 监听来自其他窗口的消息
    if (typeof window !== 'undefined') {
        window.addEventListener('message', (event) => {
            if (event.data.type === 'ABSTRAXION_RESULT') {
                setResults(prev => [...prev, {
                    timestamp: new Date().toLocaleTimeString(),
                    data: event.data.data
                }]);
            }
        });
    }

    return (
        <div className="max-w-4xl mx-auto p-6 bg-gray-900 text-white min-h-screen">
            <h1 className="text-3xl font-bold mb-6">Abstraxion Deep Link 测试页面</h1>

            <div className="grid md:grid-cols-2 gap-6">
                {/* 测试场景 */}
                <div className="space-y-4">
                    <h2 className="text-xl font-semibold mb-4">测试场景</h2>
                    {testScenarios.map((scenario, index) => (
                        <div key={index} className="bg-gray-800 p-4 rounded-lg">
                            <h3 className="font-medium mb-2">{scenario.name}</h3>
                            <div className="text-sm text-gray-400 mb-3">
                                参数: {JSON.stringify(scenario.params, null, 2)}
                            </div>
                            <button
                                onClick={() => runTest(scenario)}
                                className="bg-blue-600 hover:bg-blue-700 px-4 py-2 rounded text-sm"
                            >
                                运行测试
                            </button>
                        </div>
                    ))}
                </div>

                {/* 测试结果 */}
                <div>
                    <h2 className="text-xl font-semibold mb-4">测试结果</h2>
                    <div className="bg-gray-800 p-4 rounded-lg h-96 overflow-y-auto">
                        {results.length === 0 ? (
                            <p className="text-gray-400">等待测试结果...</p>
                        ) : (
                            <div className="space-y-2">
                                {results.map((result, index) => (
                                    <div key={index} className="border-b border-gray-700 pb-2">
                                        <div className="text-xs text-gray-400">{result.timestamp}</div>
                                        <pre className="text-sm text-green-400 whitespace-pre-wrap">
                                            {JSON.stringify(result.data, null, 2)}
                                        </pre>
                                    </div>
                                ))}
                            </div>
                        )}
                    </div>
                    <button
                        onClick={() => setResults([])}
                        className="mt-2 bg-red-600 hover:bg-red-700 px-3 py-1 rounded text-sm"
                    >
                        清除结果
                    </button>
                </div>
            </div>

            {/* 当前测试 URL */}
            {testUrl && (
                <div className="mt-6 bg-gray-800 p-4 rounded-lg">
                    <h3 className="font-medium mb-2">当前测试 URL:</h3>
                    <div className="bg-gray-700 p-2 rounded text-sm break-all">
                        {testUrl}
                    </div>
                </div>
            )}

            {/* 说明文档 */}
            <div className="mt-8 bg-gray-800 p-4 rounded-lg">
                <h3 className="font-medium mb-2">测试说明:</h3>
                <ul className="text-sm text-gray-300 space-y-1">
                    <li>• 点击测试按钮会在新窗口打开认证页面</li>
                    <li>• 完成认证后，结果会显示在右侧面板</li>
                    <li>• Deeplink 测试需要在移动设备或配置了 URL scheme 的环境中进行</li>
                    <li>• WebView 模式测试会通过 postMessage 返回结果</li>
                </ul>
            </div>

            {/* Flutter 集成代码示例 */}
            <div className="mt-8 bg-gray-800 p-4 rounded-lg">
                <h3 className="font-medium mb-2">Flutter 集成示例:</h3>
                <pre className="text-sm text-gray-300 whitespace-pre-wrap overflow-x-auto">
                    {`// Flutter WebView 示例
InAppWebView(
  initialUrlRequest: URLRequest(
    url: Uri.parse('${typeof window !== 'undefined' ? window.location.origin : 'https://your-domain.com'}/?deeplink=yourapp://auth/callback&auto_redirect=true'),
  ),
  onWebViewCreated: (controller) {
    controller.addJavaScriptHandler(
      handlerName: 'FlutterChannel',
      callback: (data) {
        final result = jsonDecode(data[0]);
        print('收到认证结果: \$result');
      },
    );
  },
)`}
                </pre>
            </div>
        </div>
    );
}
