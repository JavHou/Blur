"use client";
import { AbstraxionProvider } from "@burnt-labs/abstraxion";
import "@burnt-labs/abstraxion/dist/index.css";
import "@burnt-labs/ui/dist/index.css";
import "./globals.css";

const config = {
  treasury: "xion1pvcmey4ml8m50ew0c23wwdx0t0veqlzcr7j7d6d29q35asfrwlhshtf4hx", // 从 Developer Portal 获取
  rpcUrl: "https://rpc.xion-testnet-2.burnt.com:443",
  restUrl: "https://api.xion-testnet-2.burnt.com:443",
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta name="theme-color" content="#000000" />
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
      </head>
      <body>
        <AbstraxionProvider config={config}>
          {children}
        </AbstraxionProvider>
      </body>
    </html>
  );
}