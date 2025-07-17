import 'package:flutter/material.dart';
import 'package:blur/features/onboarding/data/models/user_profile_model.dart';
import 'package:blur/shared/buttons/full_width_button.dart';

class PhotosStepScreen extends StatefulWidget {
  final UserProfileModel userProfile;

  const PhotosStepScreen({
    super.key,
    required this.userProfile,
  });

  @override
  State<PhotosStepScreen> createState() => _PhotosStepScreenState();
}

class _PhotosStepScreenState extends State<PhotosStepScreen> {
  List<String> _photos = [];

  @override
  void initState() {
    super.initState();
    _photos = List.from(widget.userProfile.photos ?? []);
  }

  void _addPhoto() {
    // 模拟添加照片
    setState(() {
      _photos.add('https://mighty.tools/mockmind-api/content/human/96.jpg');
      widget.userProfile.photos = _photos;
    });
  }

  void _removePhoto(int index) {
    setState(() {
      _photos.removeAt(index);
      widget.userProfile.photos = _photos;
    });
  }

  bool get canContinue => _photos.length >= 3;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),

              // 标题
              Text(
                '添加你的照片',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),

              // 副标题
              Text(
                '请上传至少3张照片，最多9张。包含不同表情和生活场景的照片，让 AI 更好地认识你',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 32),

              // 照片网格
              Expanded(
                child: Column(
                  children: [
                    // 照片计数器
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${_photos.length} / 9 张照片 (最少需要3张)',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color:
                              _photos.length >= 3
                                  ? Colors.green
                                  : Colors.orange,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 16),

                    // 照片网格
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.8,
                        ),
                        itemCount:
                            _photos.length + (_photos.length < 9 ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index < _photos.length) {
                            return _buildPhotoTile(index);
                          } else {
                            return _buildAddPhotoTile();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoTile(int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              _photos[index],
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: () => _removePhoto(index),
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.red.withValues(alpha: 0.8),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.close, color: Colors.white, size: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddPhotoTile() {
    return GestureDetector(
      onTap: _addPhoto,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey.shade300,
            style: BorderStyle.solid,
          ),
          color: Colors.grey.shade100,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_photo_alternate,
              size: 32,
              color: Colors.grey.shade600,
            ),
            SizedBox(height: 8),
            Text(
              '添加照片',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
