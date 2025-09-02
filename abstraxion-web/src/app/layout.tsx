"use client";
import { AbstraxionProvider } from "@burnt-labs/abstraxion";
import "@burnt-labs/abstraxion/dist/index.css";
import "@burnt-labs/ui/dist/index.css";

const config = {
  treasury: "xion1pvcmey4ml8m50ew0c23wwdx0t0veqlzcr7j7d6d29q35asfrwlhshtf4hx", // 从 Developer Portal 获取
  rpcUrl: "https://rpc.xion-testnet-2.burnt.com:443",
  restUrl: "https://api.xion-testnet-2.burnt.com:443",
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body>
        <AbstraxionProvider config={config}>
          {children}
        </AbstraxionProvider>
      </body>
    </html>
  );
}