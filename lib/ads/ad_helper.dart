import 'package:universal_io/io.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ad_unit_ids.dart';

class AdHelper {
  BannerAd? _bannerAd;
  InterstitialAd? _interstitialAd;

  BannerAd? get getBannerAd {
    return _bannerAd;
  }

  InterstitialAd? get getInterstitialAd {
    return _interstitialAd;
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return bannerAdId;
    } else if (Platform.isIOS) {
      return '<YOUR_IOS_BANNER_AD_UNIT_ID>';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return interstitialAdId;
    } else if (Platform.isIOS) {
      return '<YOUR_IOS_INTERSTITIAL_AD_UNIT_ID>';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  void loadBannerAd() {
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          _bannerAd = ad as BannerAd;
        },
        onAdFailedToLoad: (ad, err) {
          if (kDebugMode) {
            print('Failed to load a banner ad: ${err.message}');
          }
          ad.dispose();
        },
      ),
    ).load();
  }

  void bannerAdDispose() {
    _bannerAd?.dispose();
  }

  void loadPersonalGoogleAdsConsentForm() {
    ConsentForm.loadConsentForm(
      (ConsentForm consentForm) async {
        var status = await ConsentInformation.instance.getConsentStatus();
        if (status == ConsentStatus.required) {
          consentForm.show(
            (FormError? formError) {
              // Handle dismissal by reloading form
              loadPersonalGoogleAdsConsentForm();
            },
          );
        }
      },
      (formError) {
        throw (formError);
      },
    );
  }

  void loadInterstitialAd() {
    if (kIsWeb) {
    } else {
      InterstitialAd.load(
        adUnitId: AdHelper.interstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            _interstitialAd = ad;
          },
          onAdFailedToLoad: (err) {
            if (kDebugMode) {
              print('Failed to load an interstitial ad: ${err.message}');
            }
          },
        ),
      );
    }
  }

  Future<InitializationStatus> initGoogleMobileAds() {
    return MobileAds.instance.initialize();
  }
}
