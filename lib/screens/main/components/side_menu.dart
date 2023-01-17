import 'package:flutter/material.dart';
import 'package:flutter_profile/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'area_info_text.dart';
import 'coding.dart';
import 'knowledges.dart';
import 'my_info.dart';
import 'skills.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            MyInfo(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    AreaInfoText(
                      title: "Residence",
                      text: "Pakistan",
                    ),
                    AreaInfoText(
                      title: "City",
                      text: "Lahore",
                    ),
                    AreaInfoText(
                      title: "Age",
                      text: "36",
                    ),
                    Skills(),
                    SizedBox(height: defaultPadding),
                    Coding(),
                    Knowledges(),
                    Divider(),
                    SizedBox(height: defaultPadding / 2),
                    // TextButton(
                    //   onPressed: () {},
                    //   child: FittedBox(
                    //     child: Row(
                    //       children: [
                    //         Text(
                    //           "DOWNLOAD CV",
                    //           style: TextStyle(
                    //             color: Theme.of(context)
                    //                 .textTheme
                    //                 .bodyText1!
                    //                 .color,
                    //           ),
                    //         ),
                    //         SizedBox(width: defaultPadding / 2),
                    //         SvgPicture.asset("assets/icons/download.svg")
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Container(
                      margin: EdgeInsets.only(top: defaultPadding),
                      color: Color(0xFF24242E),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Uri url = Uri.parse(
                                  "https://www.linkedin.com/in/nauman-aziz-pitafi-34994115/");
                              _launchInBrowser(url);
                            },
                            icon: SvgPicture.asset("assets/icons/linkedin.svg"),
                          ),
                          IconButton(
                            onPressed: () {
                              Uri url =
                                  Uri.parse("https://github.com/naumanpitafi");
                              _launchInBrowser(url);
                            },
                            icon: SvgPicture.asset("assets/icons/github.svg"),
                          ),
                          IconButton(
                            onPressed: () {
                              Uri url =
                                  Uri.parse("https://dribbble.com/napitafi1");
                              _launchInBrowser(url);
                            },
                            icon: SvgPicture.asset("assets/icons/dribble.svg"),
                          ),
                          IconButton(
                            onPressed: () {
                              Uri url = Uri.parse(
                                  "https://www.behance.net/nauman3998");
                              _launchInBrowser(url);
                            },
                            icon: SvgPicture.asset("assets/icons/beh.svg"),
                          ),
                          IconButton(
                              onPressed: () {
                                Uri url = Uri.parse(
                                    "https://www.fiverr.com/naumanaziz3998?up_rollout=true");
                                _launchInBrowser(url);
                              },
                              icon: SvgPicture.asset("assets/icons/fiver.svg")),
                          IconButton(
                            onPressed: () {
                              Uri url = Uri.parse(
                                  "https://www.upwork.com/freelancers/naumanaziz");
                              _launchInBrowser(url);
                            },
                            icon: SvgPicture.asset("assets/icons/up.svg"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
