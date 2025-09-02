import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  // 不使用静态导出，保持SSR模式
  trailingSlash: true,
  images: {
    unoptimized: true
  },
  // Allow cross-origin requests from local network IPs
  allowedDevOrigins: ['192.168.1.*'],
};

export default nextConfig;