# Flutter 国际化设置指南

## 概述

本项目已成功集成 Flutter 国际化功能，支持中文和英文两种语言。

## 文件结构

```
lib/
├── l10n/                           # 国际化资源文件目录
│   ├── intl_en.arb                # 英文翻译文件
│   └── intl_zh.arb                # 中文翻译文件
├── generated/                      # 自动生成的国际化代码
│   ├── intl/                      # 国际化消息文件
│   └── l10n.dart                  # 主要的国际化类
└── shared/utils/
    └── localization_helper.dart   # 国际化帮助工具类
```

## 核心配置

### 1. pubspec.yaml 配置

```yaml
dependencies:
  flutter_localizations:
    sdk: flutter
  intl: ^0.20.2

dev_dependencies:
  intl_utils: ^2.8.7

flutter:
  generate: true

flutter_intl:
  enabled: true
  class_name: S
  main_locale: en
  arb_dir: lib/l10n
  output_dir: lib/generated
```

### 2. main.dart 配置

```dart
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:blur/generated/l10n.dart';

MaterialApp.router(
  localizationsDelegates: const [
    S.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: S.delegate.supportedLocales,
  locale: _locale, // 支持动态语言切换
)
```

## 使用方法

### 1. 在 Widget 中使用国际化文本

```dart
import 'package:blur/shared/utils/localization_helper.dart';

class ExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 方法1：使用扩展方法（推荐）
        Text(context.l10n.login),
        
        // 方法2：使用生成的类
        Text(S.of(context).login),
        
        // 方法3：使用帮助类
        Text(LocalizationHelper.of(context).login),
      ],
    );
  }
}
```

### 2. 添加新的翻译文本

#### 在 `lib/l10n/intl_en.arb` 中添加英文文本

```json
{
  "newKey": "New Text",
  "@newKey": {
    "description": "Description of the new text"
  }
}
```

#### 在 `lib/l10n/intl_zh.arb` 中添加中文文本

```json
{
  "newKey": "新文本",
  "@newKey": {
    "description": "新文本的描述"
  }
}
```

#### 重新生成代码

```bash
dart run intl_utils:generate
```

### 3. 语言切换功能

项目包含了语言设置屏幕，用户可以在应用内切换语言：

```dart
// 导航到语言设置屏幕
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const LanguageSettingsScreen(),
  ),
);
```

### 4. 检查当前语言

```dart
// 使用扩展方法
String currentLang = context.currentLanguage;
bool isZh = context.isZhChinese;
bool isEn = context.isEnglish;

// 使用帮助类
String currentLang = LocalizationHelper.getCurrentLanguage(context);
bool isZh = LocalizationHelper.isZhChinese(context);
bool isEn = LocalizationHelper.isEnglish(context);
```

## 已国际化的组件

### 1. 认证相关

- 登录屏幕 (`LoginScreen`)
- 注册相关文本
- 验证相关文本

### 2. 导航相关

- 底部导航栏标签
- 主要页面标题

### 3. 通用组件

- 按钮文本（确认、取消、保存等）
- 状态消息（成功、错误、加载等）
- 表单字段标签

## 最佳实践

### 1. 命名约定

- 使用驼峰命名法：`loginButton`、`confirmPassword`
- 使用描述性名称，避免缩写
- 相关功能使用相同前缀：`dating*`、`chat*`

### 2. 组织结构

- 按功能模块组织翻译键
- 在 ARB 文件中添加有意义的描述
- 保持英文和中文文件结构一致

### 3. 开发流程

1. 在设计阶段就考虑国际化
2. 避免硬编码文本
3. 定期检查未翻译的文本
4. 测试不同语言下的UI布局

## 扩展支持更多语言

如需支持更多语言，按以下步骤操作：

1. 创建新的 ARB 文件（如 `intl_fr.arb` 用于法语）
2. 添加所有必要的翻译键
3. 重新生成代码：`dart run intl_utils:generate`
4. 在语言设置屏幕中添加新语言选项

## 注意事项

1. **文本长度**：不同语言的文本长度可能差异很大，需要确保UI能适应
2. **RTL 支持**：如需支持阿拉伯语等从右到左的语言，需要额外配置
3. **日期格式**：使用 `DateFormat` 来处理不同地区的日期格式
4. **数字格式**：使用 `NumberFormat` 来处理不同地区的数字格式

## 调试技巧

1. 使用 `flutter inspector` 检查当前语言设置
2. 在设备上测试不同语言的显示效果
3. 使用设备的语言设置来测试应用的响应
4. 检查生成的代码中是否包含所有翻译键

通过以上设置和最佳实践，您的 Flutter 应用现在已经完全支持国际化，可以为不同语言的用户提供本地化体验。
