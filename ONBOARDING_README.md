# Blur 用户资料收集功能

## 功能概述

根据PRD文档实现了完整的用户资料收集（Onboarding）功能，包含13个步骤的表单填写流程。

## 功能特性

### 1. 进度条显示

- 页面顶部显示当前进度条和步骤数（如：5/13）
- 实时更新进度状态

### 2. 分步骤表单

每个步骤包含一个特定的信息收集：

1. **姓名/昵称** - 文本输入
2. **性别** - 单选（男/女/其他）
3. **性取向** - 单选（寻找男性/寻找女性/均可）
4. **年龄** - 日期选择器
5. **位置** - 城市和区域输入
6. **照片** - 图片上传（最少3张，最多9张）
7. **MBTI类型** - 网格选择
8. **伴侣期望** - 多选标签 + 补充文本
9. **不能接受的点** - 多选标签 + 补充文本
10. **职业** - 职业和行业选择
11. **作息时间** - 单选（早睡早起/晚睡晚起/不规律）
12. **兴趣爱好** - 多选网格
13. **饮食习惯** - 多选网格

### 3. 导航控制

- 每个页面都有返回按钮
- 底部有"继续"按钮，只有在满足条件时才可点击
- 最后一步显示"完成设置"按钮

### 4. 数据模型

使用 `UserProfileModel` 类来存储所有收集的用户信息，包含：

- 基础信息（姓名、性别、年龄、位置、照片）
- 心理画像（MBTI类型）
- 恋爱偏好（伴侣期望、不能接受的点）
- 生活方式（职业、作息、兴趣爱好、饮食习惯）

## 文件结构

```
lib/features/onboarding/
├── data/
│   └── models/
│       └── user_profile_model.dart
├── presentation/
│   ├── screens/
│   │   ├── user_profile_onboarding_screen.dart
│   │   └── steps/
│   │       ├── name_step_screen.dart
│   │       ├── gender_step_screen.dart
│   │       ├── sexual_orientation_step_screen.dart
│   │       ├── age_step_screen.dart
│   │       ├── location_step_screen.dart
│   │       ├── photos_step_screen.dart
│   │       ├── mbti_step_screen.dart
│   │       ├── partner_expectations_step_screen.dart
│   │       ├── unacceptable_traits_step_screen.dart
│   │       ├── profession_step_screen.dart
│   │       ├── sleep_schedule_step_screen.dart
│   │       ├── hobbies_step_screen.dart
│   │       └── dietary_habits_step_screen.dart
│   └── widgets/
│       └── onboarding_progress_bar.dart
```

## 使用方法

### 1. 导入和路由配置

在 `app_router.dart` 中已配置路由：

```dart
GoRoute(
  path: '/profile/setup',
  builder: (context, state) => UserProfileOnboardingScreen(),
),
```

### 2. 从注册成功页面跳转

注册成功后，用户将被导航到用户资料设置页面：

```dart
context.go("/profile/setup");
```

### 3. 完成后跳转

完成所有步骤后，用户将被导航到首页：

```dart
context.go('/home');
```

## 设计特色

### 1. 符合整体UI风格

- 使用统一的主题色彩和字体
- 保持与应用整体风格一致的设计语言
- 响应式布局适配不同屏幕尺寸

### 2. 用户友好的交互

- 清晰的步骤指示和进度反馈
- 直观的选择界面（单选、多选、网格选择）
- 实时的输入验证和反馈

### 3. 数据完整性

- 必填字段验证
- 数据类型检查
- 合理的默认值设置

## 技术实现

### 1. 状态管理

使用 `StatefulWidget` 管理每个步骤的状态，通过回调函数实现页面间的数据传递。

### 2. 数据持久化

数据存储在 `UserProfileModel` 对象中，完成后可以发送到服务器或本地存储。

### 3. 页面导航

使用 `PageView` 实现页面间的平滑切换，禁用手势滑动以确保用户按步骤完成。

## 未来扩展

1. **数据验证** - 增加更严格的输入验证
2. **数据存储** - 集成数据库或API调用
3. **个性化推荐** - 根据收集的数据提供个性化建议
4. **多语言支持** - 支持多种语言界面
5. **无障碍访问** - 增强无障碍功能支持

## 注意事项

1. 图片上传功能目前使用模拟数据，需要集成真实的图片选择和上传功能
2. 位置信息可以考虑集成地理位置API
3. MBTI测试可以考虑集成在线测试功能
4. 数据安全和隐私保护需要在生产环境中实现
