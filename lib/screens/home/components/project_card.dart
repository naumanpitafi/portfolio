import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile/models/Project.dart';
import 'package:flutter_profile/responsive.dart';

import '../../../constants.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
    required this.project,
  }) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      color: secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.title!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Spacer(),
          Text(
            project.description!,
            maxLines: Responsive.isMobileLarge(context) ? 3 : 4,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(height: 1.5),
          ),
          Spacer(),
          TextButton(
            onPressed: () {
              showAlertDialog(context, project);
            },
            child: Text(
              "Read More >>",
              style: TextStyle(color: primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context, Project project) {
    // Create button
    Widget okButton = ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
      ),
      child: Text(
        "Back",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      title: Text(
        project.title.toString(),
        style: TextStyle(
          color: primaryColor,
        ),
      ),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.7,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        project.description.toString(),
                        style: TextStyle(wordSpacing: 1),
                      )),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                  child: CarouselSlider(
                options: CarouselOptions(),
                items: project.images!
                    .map((item) => Padding(
                          padding: EdgeInsets.only(
                              top: 10.0, bottom: 10.0, right: 7, left: 7),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Image.asset(
                              item.toString(),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ))
                    .toList(),
              )),
            ],
          ),
        ),
      ),
      actions: [
        Center(
            child: Padding(
          padding: EdgeInsets.all(10.0),
          child: okButton,
        )),
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
