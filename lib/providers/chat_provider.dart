import 'package:flutter/material.dart';

class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    required this.isUser,
    required this.timestamp,
  });
}

class ChatProvider with ChangeNotifier {
  List<ChatMessage> _messages = [];
  bool _isLoading = false;

  List<ChatMessage> get messages => _messages;
  bool get isLoading => _isLoading;

  void addMessage(String text, bool isUser) {
    _messages.add(ChatMessage(
      text: text,
      isUser: isUser,
      timestamp: DateTime.now(),
    ));
    notifyListeners();
  }

  Future<void> sendMessage(String userMessage) async {
    addMessage(userMessage, true);
    _isLoading = true;
    notifyListeners();

    // Simulate AI response (replace with actual API call)
    await Future.delayed(const Duration(seconds: 1));

    final response = _generateAIResponse(userMessage);
    addMessage(response, false);
    _isLoading = false;
    notifyListeners();
  }

  String _generateAIResponse(String userMessage) {
    final lowerMessage = userMessage.toLowerCase();
    
    if (lowerMessage.contains('powder') || lowerMessage.contains('material') || lowerMessage.contains('cement')) {
      return 'For construction projects, I recommend using high-quality cement powder. For general construction, use OPC 43 grade. For high-strength applications, use OPC 53 grade. Mix ratio: 1 part cement, 2 parts sand, 4 parts aggregate for standard concrete.';
    } else if (lowerMessage.contains('waterproofing') || lowerMessage.contains('seepage')) {
      return 'For waterproofing, follow these steps:\n1. Clean the surface thoroughly\n2. Apply primer coat\n3. Apply waterproofing membrane in 2-3 coats\n4. Allow proper curing time\n5. Test for leaks before final finishing';
    } else if (lowerMessage.contains('crack') || lowerMessage.contains('repair')) {
      return 'For crack repair:\n1. Clean the crack area\n2. Widen the crack slightly (V-groove)\n3. Apply bonding agent\n4. Fill with appropriate repair material\n5. Smooth and cure properly';
    } else if (lowerMessage.contains('paint') || lowerMessage.contains('color')) {
      return 'For painting:\n1. Surface preparation is crucial - clean, sand, and prime\n2. Use weather-resistant paint for exterior\n3. Apply 2-3 coats with proper drying time between\n4. Choose colors that complement your architecture';
    } else {
      return 'I can help you with construction, renovation, material selection, waterproofing, structural queries, and design ideas. Please ask me a specific question about your construction project.';
    }
  }

  void clearMessages() {
    _messages.clear();
    notifyListeners();
  }
}

