import 'dart:io';

import 'package:fapp/features/ads/data/utils/ads_global_utils.dart';
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
  static int attemptSaver = 0;

  static InterstitialAd interstitialAd;

  static BannerAd createBannerAd() {
    BannerAd ad = new BannerAd(
        size: AdSize.largeBanner,
        adUnitId: BannerAd.testAdUnitId,
        listener: BannerAdListener(
            onAdLoaded: (Ad ad) {},
            onAdFailedToLoad: (Ad ad, LoadAdError error) {
              print("FAIIIIIIILED =>" + error.message);
            },
            onAdOpened: (Ad ad) {
              print("add opened");
            },
            onAdClosed: (Ad ad) {
              print("ad closed");
            }),
        request: AdRequest());

    return ad;
  }

  static Future createInterAd(int creatingInterAttempt) async {
    attemptSaver = creatingInterAttempt;
    await InterstitialAd.load(
        adUnitId: "ca-app-pub-3940256099942544/1033173712", // interAdUnitId,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) async {
            interstitialAd = ad;
            // if (await AdsGlobalUtils.isAdDisplayable("12345", 'interstitial')) {
            //   print("INTER HAS BEEN APPROVED");
            //   interstitialAd = ad;
            // } else {
            //   await ad.dispose();
            //   interstitialAd = null;
            //   print("INTER NOT APPROVED");
            // }
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('INTER LOAD ERROR =>' + error.message);
            creatingInterAttempt++;
            if (creatingInterAttempt <= 2) {
              createInterAd(creatingInterAttempt);
            }
          },
        ));
  }

  static void showInter() {
    if (interstitialAd == null) {
      {
        print('Warning: attempt to show interstitial before loaded.');
        return;
      }

      print("IIIIIIIIINNNNNNTTTEERRRR ==> " + interstitialAd.responseInfo.responseId);
     
      interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (InterstitialAd ad) =>
            print('ad onAdShowedFullScreenContent.'),
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          print('$ad onAdDismissedFullScreenContent.');
          ad.dispose();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          print('$ad onAdFailedToShowFullScreenContent: $error');
          ad.dispose();
          createInterAd(attemptSaver);
        },
      );
      interstitialAd.show();
      interstitialAd = null;
    }
  }
}
