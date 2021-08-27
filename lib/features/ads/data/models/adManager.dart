import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:test_ads/fireStoreServices.dart';

class AdsManager {
  static String get bannerAdUnitId => Platform.isAndroid
      ? "ca-app-pub-5405398781671156/9225564152"
      : "ca-app-pub-5405398781671156/9225564152";

  static String get interAdUnitId => Platform.isAndroid
      ? "ca-app-pub-5405398781671156/5894492105"
      : "ca-app-pub-5405398781671156/5894492105";

  static initialize() {
    
    
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
  }

  static bool display = true;

  static InterstitialAd interstitialAd;

  static BannerAd createBannerAd(Function x) {
    BannerAd ad = new BannerAd(
        size: AdSize.largeBanner,
        adUnitId:
            BannerAd.testAdUnitId,
        listener: BannerAdListener(onAdLoaded: (Ad ad) {
          print("hawaaa");
          print(ad.responseInfo.responseId);

          // x();RequestConfiguration.Builder().setTestDeviceIds(Arrays.asList("30C6D7F8CB16681B30480D3F3A9DC37E"))

          // FireStoreServices.addAdId({"id": ad.responseInfo.responseId});
        }, onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print("FAIIIIIIILED =>" + error.message);

          ad.dispose();
        }, onAdOpened: (Ad ad) {
          print("add opened");
        }, onAdClosed: (Ad ad) {
          print("ad closed");
        }),
        request: AdRequest());

    return ad;
  }

  static Future createInterAd() async {
    await InterstitialAd.load(
        adUnitId: "ca-app-pub-2590043858470635/4556773948", // interAdUnitId,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            print('$ad loaded');
            interstitialAd = ad;
            print(interstitialAd.responseInfo.responseId);
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('WALUUUUUUUUUUUUUUUUUUUUU =>' + error.message);
          },
        ));
  }

  static InterstitialAd showInter() {
    // if (interstitialAd == null) {
    //   print('Warning: attempt to show interstitial before loaded.');
    //   return;

    interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        createInterAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        createInterAd();
      },
    );
    interstitialAd.show();
    interstitialAd = null;
  }
}
