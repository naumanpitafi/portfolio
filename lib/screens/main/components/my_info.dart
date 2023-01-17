import 'package:flutter/material.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        color: Color(0xFF242430),
        child: Column(
          children: [
            Spacer(flex: 2),
            CircleAvatar(
              radius: 60,

              backgroundImage: AssetImage("assets/images/profile.png"),
              // child: Image.network(
              //     'https://firebasestorage.googleapis.com/v0/b/portfolio-25aa0.appspot.com/o/profile%2Fprofile.png?alt=media&token=f1e82c33-afdc-46b7-adf3-c1dce99f3984'),
            ),
            Spacer(),
            Text(
              "Nauman Aziz",
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Text(
              "Flutter Developer - UI/UX Designer",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w200,
                height: 1.5,
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
