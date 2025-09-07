# Blur - Meet First, Unblur Love 💕

<div align="center">
  <img src="logo.png" alt="Blur Logo" width="200"/>
  
  **The first dating app that guarantees real meetups instead of endless chatting**
  
  [![Flutter](https://img.shields.io/badge/Flutter-3.0+-blue.svg)](https://flutter.dev)
  [![Dart](https://img.shields.io/badge/Dart-3.0+-green.svg)](https://dart.dev)
  [![XION](https://img.shields.io/badge/XION-Integration-purple.svg)](https://xion.io)
  [![License](https://img.shields.io/badge/license-MIT-orange.svg)](LICENSE)
</div>

## 🎯 Overview

Blur revolutionizes online dating by prioritizing real-world meetings over endless messaging. Through refundable deposits and interest-based activity matching, we guarantee authentic face-to-face connections. In the age of AI, let's keep romance real.

## ✨ Key Features

### 🤝 Meet First Philosophy
- **Immediate Connections**: Match and meet within the same week
- **Interest-Based Matching**: AI-powered algorithm matches users based on genuine shared hobbies
- **Deposit System**: Both parties pay refundable deposits to ensure commitment and eliminate no-shows

### 🔐 Web3 Integration
- **Chain Abstraction**: Seamless login via XION's technology - no crypto knowledge required
- **Multiple Auth Methods**: Email, facial recognition, or traditional login
- **Crypto & Fiat Support**: Accept deposits in cryptocurrency (including XION tokens) or traditional currency

### 🛡️ Safety First
- **AI-Selected Venues**: All dates occur at safe, public locations chosen by our AI
- **Location-Based Matching**: Venues selected based on both parties' locations
- **Check-in System**: Both users confirm arrival for deposit refund

### 📱 Post-Date Features
- **AI Dating Journal**: Generate shareable dating stories with AI assistance
- **Social Integration**: One-click sharing to Instagram, Twitter, Xiaohongshu
- **UGC Rewards**: Earn points and benefits through content creation

## 🏆 Membership Tiers

| Tier | Features | Access |
|------|----------|---------|
| **Free** | 3 daily matches, earn more through UGC | Open to all |
| **Premium** | More daily matches, priority features | Monthly subscription |
| **XION VIP Club** | Luxury dating experiences, exclusive events | 50K+ XION token holders (ZK verified) |

## 🛠️ Tech Stack

- **Frontend**: Flutter/Dart for cross-platform mobile development
- **Development Tools**: Dave Kit
- **Blockchain**: XION Chain SDK for Web3 integration
- **Authentication**: Chain abstraction, facial recognition, email auth
- **AI Services**: Advanced matching algorithms and chat features
- **Payments**: Multi-gateway support for crypto (XION tokens) and fiat
- **Location Services**: GPS and map integration for venue selection

## 📱 Getting Started

### Prerequisites
- Flutter SDK (3.0+)
- Dart SDK (3.0+)
- Android Studio / Xcode
- Dave Kit

### Installation

1. Clone the repository
```bash
git clone https://github.com/JavHou/Blur.git
cd Blur
```

2. Install dependencies
```bash
flutter pub get
```

3. Configure environment variables
```bash
cp .env.example .env
# Edit .env with your API keys
```

4. Run the app
```bash
flutter run
```

## 🔧 Configuration

### XION Integration
Configure your XION Chain credentials in `lib/config/xion_config.dart`

### AI Services
Set up AI API keys in `lib/config/ai_config.dart`

### Payment Gateways
Configure payment providers in `lib/config/payment_config.dart`

## 📁 Project Structure

```
blur/
├── lib/
│   ├── screens/        # UI screens
│   ├── widgets/        # Reusable components
│   ├── services/       # API and business logic
│   ├── models/         # Data models
│   ├── providers/      # State management
│   ├── utils/          # Helper functions
│   └── config/         # Configuration files
├── assets/             # Images, fonts, etc.
├── test/              # Unit and widget tests
└── pubspec.yaml       # Dependencies
```

## 🚀 Deployment

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

## 🤝 Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for details.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see [LICENSE](LICENSE) file for details.


## 🙏 Acknowledgments

- XION Chain for blockchain infrastructure
- Flutter team for the amazing framework
- Our early adopters and beta testers

---

<div align="center">
  <b>Blur - Because real love happens face-to-face</b>
  
  Made with ❤️ by the Blur Team
</div>
