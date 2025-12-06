import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ask_abc/providers/app_provider.dart';
import 'package:ask_abc/utils/app_localizations.dart';

class VisualIntelligenceScreen extends StatefulWidget {
  const VisualIntelligenceScreen({super.key});

  @override
  State<VisualIntelligenceScreen> createState() =>
      _VisualIntelligenceScreenState();
}

class _VisualIntelligenceScreenState extends State<VisualIntelligenceScreen> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        final appProvider = Provider.of<AppProvider>(context, listen: false);
        await appProvider.analyzeImage(image.path);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error picking image: $e')),
        );
      }
    }
  }

  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.visualIntelligence),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (appProvider.selectedImagePath == null)
              _ImageUploadPlaceholder(
                onTap: _showImageSourceDialog,
                uploadText: localizations.uploadPhoto,
              )
            else
              _ImagePreview(
                imagePath: appProvider.selectedImagePath!,
                onRetake: _showImageSourceDialog,
              ),
            const SizedBox(height: 24),
            if (appProvider.isAnalyzing)
              const Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Analyzing image...'),
                  ],
                ),
              )
            else if (appProvider.imageAnalysisResult != null)
              _AnalysisResults(
                result: appProvider.imageAnalysisResult!,
                recommendationsText: localizations.recommendations,
                resultsText: localizations.analysisResults,
              ),
            const SizedBox(height: 16),
            if (appProvider.selectedImagePath != null &&
                !appProvider.isAnalyzing &&
                appProvider.imageAnalysisResult == null)
              ElevatedButton.icon(
                onPressed: () {
                  appProvider.analyzeImage(appProvider.selectedImagePath!);
                },
                icon: const Icon(Icons.analytics_outlined),
                label: Text(localizations.analyze),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ImageUploadPlaceholder extends StatelessWidget {
  final VoidCallback onTap;
  final String uploadText;

  const _ImageUploadPlaceholder({
    required this.onTap,
    required this.uploadText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey.shade300,
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_photo_alternate_outlined,
              size: 64,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              uploadText,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tap to select from camera or gallery',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImagePreview extends StatelessWidget {
  final String imagePath;
  final VoidCallback onRetake;

  const _ImagePreview({
    required this.imagePath,
    required this.onRetake,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.file(
            File(imagePath),
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: FloatingActionButton.small(
            onPressed: onRetake,
            backgroundColor: Colors.white,
            child: const Icon(Icons.camera_alt, color: Colors.black87),
          ),
        ),
      ],
    );
  }
}

class _AnalysisResults extends StatelessWidget {
  final String result;
  final String resultsText;
  final String recommendationsText;

  const _AnalysisResults({
    required this.result,
    required this.resultsText,
    required this.recommendationsText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.analytics, color: Colors.purple.shade600),
                const SizedBox(width: 8),
                Text(
                  resultsText,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              result,
              style: const TextStyle(
                fontSize: 15,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

