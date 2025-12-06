import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  String? _selectedImagePath;
  String? _imageAnalysisResult;

  String? get selectedImagePath => _selectedImagePath;
  String? get imageAnalysisResult => _imageAnalysisResult;

  void setSelectedImage(String? path) {
    _selectedImagePath = path;
    notifyListeners();
  }

  Future<void> analyzeImage(String imagePath) async {
    _selectedImagePath = imagePath;
    _isAnalyzing = true;
    notifyListeners();

    // Simulate AI image analysis (replace with actual API call)
    await Future.delayed(const Duration(seconds: 2));

    _imageAnalysisResult = _generateImageAnalysis();
    _isAnalyzing = false;
    notifyListeners();
  }

  bool _isAnalyzing = false;
  bool get isAnalyzing => _isAnalyzing;

  String _generateImageAnalysis() {
    // Simulated analysis results
    return '''Image Analysis Results:

🔍 Detected Elements:
- Wall structure visible
- Surface condition: Good
- No major cracks detected

💡 Recommendations:
1. Surface appears ready for painting
2. Consider applying primer before final coat
3. Recommended paint type: Weather-resistant exterior paint
4. Color suggestions: Light shades for better heat reflection

⚠️ Notes:
- Ensure proper surface preparation
- Check for any hidden moisture issues
- Allow adequate curing time between coats''';
  }

  void clearImageAnalysis() {
    _selectedImagePath = null;
    _imageAnalysisResult = null;
    notifyListeners();
  }
}

