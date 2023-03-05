import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:party_bomb/const.dart';
import 'package:party_bomb/components/right_top_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:party_bomb/providers/language_provider.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  static final Uri _urlTicking = Uri.parse(
      'https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=music&amp;utm_content=25480');
  static final Uri _urlExplosion = Uri.parse(
      'https://pixabay.com/sound-effects/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=music&amp;utm_content=6801');

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var providerLanguage = Provider.of<SetLanguage>(context);
    return SafeArea(
      child: Material(
        color: Colors.white,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 30.0),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: FaIcon(
                          FontAwesomeIcons.bomb,
                          size: 50.0,
                        ),
                      ),
                      Text(providerLanguage.getLanguage()[5],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 45.0)),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, bottom: 15.0, right: 15.0),
                        child: Column(
                          children: [
                            Text(
                              providerLanguage.getLanguage()[6],
                              style: kTextInfoBigStyle,
                              textAlign: TextAlign.center,
                            ),
                            Text(providerLanguage.getLanguage()[7],
                                textAlign: TextAlign.justify,
                                style: kTextInfoNormalStyle),
                            Text(
                              providerLanguage.getLanguage()[8],
                              style: kTextInfoBigStyle,
                              textAlign: TextAlign.center,
                            ),
                            Text(providerLanguage.getLanguage()[9],
                                textAlign: TextAlign.justify,
                                style: kTextInfoNormalStyle),
                            Text(
                              providerLanguage.getLanguage()[10],
                              style: kTextInfoBigStyle,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              providerLanguage.getLanguage()[11],
                              textAlign: TextAlign.justify,
                              style: kTextInfoNormalStyle,
                            ),
                            RichText(
                              text: TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => _launchUrl(_urlTicking),
                                text: providerLanguage.getLanguage()[12],
                                style: kTextInfoNormalStyle,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => _launchUrl(_urlExplosion),
                                text: providerLanguage.getLanguage()[13],
                                style: kTextInfoNormalStyle,
                              ),
                            ),
                            Text(
                              providerLanguage.getLanguage()[14],
                              style: kTextInfoBigStyle,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              providerLanguage.getLanguage()[15],
                              textAlign: TextAlign.justify,
                              style: kTextInfoNormalStyle,
                            ),
                            Text(
                              providerLanguage.getLanguage()[16],
                              style: kTextInfoBigStyle,
                              textAlign: TextAlign.center,
                            ),
                            Text(providerLanguage.getLanguage()[17],
                                textAlign: TextAlign.justify,
                                style: kTextInfoNormalStyle),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            RightTopButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                buttonIcon: Icons.close),
          ],
        ),
      ),
    );
  }
}
