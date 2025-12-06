import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'app_title': 'Ask ABC',
      'construction_guru': 'Construction Guru',
      'ai_chat': 'AI Chat',
      'visual_intelligence': 'Visual Intelligence',
      'tools': 'Tools',
      'dealer_support': 'Dealer & Support',
      'bag_calculator': 'Bag Calculator',
      'curing_planner': 'Curing Planner',
      'cost_estimator': 'Cost Estimator',
      'chat_hint': 'Ask anything about construction...',
      'send': 'Send',
      'upload_photo': 'Upload Photo',
      'analyze': 'Analyze',
      'analysis_results': 'Analysis Results',
      'recommendations': 'Recommendations',
      'area': 'Area (sq ft)',
      'calculate': 'Calculate',
      'bags_needed': 'Bags Needed',
      'find_dealers': 'Find Dealers',
      'contact_support': 'Contact Support',
      'call': 'Call',
      'whatsapp': 'WhatsApp',
      'email': 'Email',
      'language': 'Language',
      'english': 'English',
      'urdu': 'Urdu',
    },
    'ur': {
      'app_title': 'پوچھیں ABC',
      'construction_guru': 'تعمیرات کا گرو',
      'ai_chat': 'AI چیٹ',
      'visual_intelligence': 'ویژول انٹیلی جنس',
      'tools': 'ٹولز',
      'dealer_support': 'ڈیلر اور سپورٹ',
      'bag_calculator': 'بیگ کیلکولیٹر',
      'curing_planner': 'کیورنگ پلانر',
      'cost_estimator': 'لاگت کا تخمینہ',
      'chat_hint': 'تعمیرات کے بارے میں کچھ بھی پوچھیں...',
      'send': 'بھیجیں',
      'upload_photo': 'تصویر اپ لوڈ کریں',
      'analyze': 'تجزیہ کریں',
      'analysis_results': 'تجزیہ کے نتائج',
      'recommendations': 'تجاویز',
      'area': 'رقبہ (مربع فٹ)',
      'calculate': 'حساب کریں',
      'bags_needed': 'بیگز کی ضرورت',
      'find_dealers': 'ڈیلرز تلاش کریں',
      'contact_support': 'سپورٹ سے رابطہ کریں',
      'call': 'کال',
      'whatsapp': 'واٹس ایپ',
      'email': 'ای میل',
      'language': 'زبان',
      'english': 'انگریزی',
      'urdu': 'اردو',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }

  String get appTitle => translate('app_title');
  String get constructionGuru => translate('construction_guru');
  String get aiChat => translate('ai_chat');
  String get visualIntelligence => translate('visual_intelligence');
  String get tools => translate('tools');
  String get dealerSupport => translate('dealer_support');
  String get bagCalculator => translate('bag_calculator');
  String get curingPlanner => translate('curing_planner');
  String get costEstimator => translate('cost_estimator');
  String get chatHint => translate('chat_hint');
  String get send => translate('send');
  String get uploadPhoto => translate('upload_photo');
  String get analyze => translate('analyze');
  String get analysisResults => translate('analysis_results');
  String get recommendations => translate('recommendations');
  String get area => translate('area');
  String get calculate => translate('calculate');
  String get bagsNeeded => translate('bags_needed');
  String get findDealers => translate('find_dealers');
  String get contactSupport => translate('contact_support');
  String get call => translate('call');
  String get whatsapp => translate('whatsapp');
  String get email => translate('email');
  String get language => translate('language');
  String get english => translate('english');
  String get urdu => translate('urdu');
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ur'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

