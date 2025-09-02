import { NextRequest, NextResponse } from 'next/server';

export async function GET(request: NextRequest) {
    const searchParams = request.nextUrl.searchParams;
    const deeplink = searchParams.get('deeplink');
    const callbackScheme = searchParams.get('callback_scheme') || 'yourapp';
    const address = searchParams.get('address');
    const success = searchParams.get('success') === 'true';

    // 构建重定向 URL
    let redirectUrl: string;

    if (deeplink) {
        // 使用提供的 deeplink
        redirectUrl = `${deeplink}?address=${encodeURIComponent(address || '')}&success=${success}&timestamp=${Date.now()}`;
    } else {
        // 使用默认的 app scheme
        redirectUrl = `${callbackScheme}://auth/callback?address=${encodeURIComponent(address || '')}&success=${success}&timestamp=${Date.now()}`;
    }

    console.log('API Redirect URL:', redirectUrl);

    // 返回一个自动跳转的 HTML 页面
    const html = `
    <!DOCTYPE html>
    <html>
      <head>
        <title>Redirecting...</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
          body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background: #000;
            color: #fff;
          }
          .container {
            text-align: center;
            padding: 20px;
          }
          .spinner {
            border: 2px solid #333;
            border-top: 2px solid #fff;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            animation: spin 1s linear infinite;
            margin: 0 auto 20px;
          }
          @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
          }
        </style>
      </head>
      <body>
        <div class="container">
          <div class="spinner"></div>
          <h2>Redirecting to App...</h2>
          <p>${success ? 'Authentication successful!' : 'Authentication failed.'}</p>
          ${address ? `<p>Address: ${address.slice(0, 10)}...</p>` : ''}
          <p>If you are not redirected automatically, <a href="${redirectUrl}" style="color: #4285f4;">click here</a>.</p>
        </div>
        <script>
          // 立即尝试跳转
          window.location.href = '${redirectUrl}';
          
          // 备用方案：延迟后再次尝试
          setTimeout(() => {
            window.location.href = '${redirectUrl}';
          }, 1000);
          
          // 如果还是无法跳转，显示手动链接
          setTimeout(() => {
            document.querySelector('.container').innerHTML += 
              '<br><button onclick="window.location.href=\\'${redirectUrl}\\'" style="padding: 10px 20px; background: #4285f4; color: white; border: none; border-radius: 5px; cursor: pointer;">Manual Redirect</button>';
          }, 3000);
        </script>
      </body>
    </html>
  `;

    return new NextResponse(html, {
        headers: {
            'Content-Type': 'text/html',
        },
    });
}

export async function POST(request: NextRequest) {
    const body = await request.json();
    const { address, success, deeplink, callbackScheme } = body;

    // 这里可以添加更复杂的逻辑，比如保存到数据库等
    console.log('Callback API called:', { address, success, deeplink, callbackScheme });

    return NextResponse.json({
        success: true,
        redirectUrl: deeplink || `${callbackScheme || 'yourapp'}://auth/callback?address=${encodeURIComponent(address || '')}&success=${success}&timestamp=${Date.now()}`
    });
}
