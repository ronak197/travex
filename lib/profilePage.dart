import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  void _showToast() {
    Fluttertoast.showToast(
        msg: "Yet to be implemented!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0);
  }
  _launchURL(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:10.0),
                      child: Text(
                        "Jon Doe",
                        style: Theme.of(context).textTheme.title,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:10.0),
                      child: Text(
                        "31, Mumbai, India",
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: ClipOval(
                        child: Image.network(
                  'https://thumbs.dreamstime.com/b/vector-icon-user-avatar-web-site-mobile-app-man-face-flat-style-social-network-profile-45837377.jpg',
                  fit: BoxFit.cover,
                )))
              ],
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Text("Application Settings", style: Theme.of(context).textTheme.subtitle),
            ),
            ListTile(
              title: Text(
                "Personal Information",
                style: Theme.of(context).textTheme.body1,
              ),
              onTap: () {
                _showToast();
              },
              trailing: Icon(Icons.navigate_next),
            ),
            ListTile(
              title: Text(
                "Notifications",
                style: Theme.of(context).textTheme.body1,
              ),
              onTap: () {
                _showToast();
              },
              trailing: Icon(Icons.navigate_next),
            ),
            ListTile(
              title: Text(
                "Trips Defaults",
                style: Theme.of(context).textTheme.body1,
              ),
              onTap: () {
                _showToast();
              },
              trailing: Icon(Icons.navigate_next),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Text("Account Settings", style: Theme.of(context).textTheme.subtitle),
            ),
            ListTile(
              title: Text(
                "Change Password",
                style: Theme.of(context).textTheme.body1,
              ),
              onTap: () {
                _showToast();
              },
              trailing: Icon(Icons.navigate_next),
            ),
            ListTile(
              title: Text(
                "Edit Profile",
                style: Theme.of(context).textTheme.body1,
              ),
              onTap: () {
                _showToast();
              },
              trailing: Icon(Icons.navigate_next),
            ),
            ListTile(
              title: Text(
                "Log Out",
                style: Theme.of(context).textTheme.body1,
              ),
              onTap: () {
                _showToast();
              },
              trailing: Icon(Icons.navigate_next),
            ),
            Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Text("Help & lots more!", style: Theme.of(context).textTheme.subtitle),
        ),
            ListTile(
              title: Text(
                "How to ...",
                style: Theme.of(context).textTheme.body1,
              ),
              onTap: () {
                _showToast();
              },
              trailing: Icon(Icons.help_outline),
            ),
            ListTile(
              title: Text(
                "About this application",
                style: Theme.of(context).textTheme.body1,
              ),
              onTap: () {
                _showToast();
              },
              trailing: Icon(Icons.info_outline),
            ),
            ListTile(
              title: Text(
                "Something we can do better?",
                style: Theme.of(context).textTheme.body1,
              ),
              onTap: () {
                _launchURL('yashbhalodi.daiict@gmail.com','Something_to_say_about_travex','We_look_forward_to_hearing_from_you.');
                _showToast();
              },
              subtitle: Text('You can always email us your suggestions, complaints or just drop a \'Hi\'.'),
              trailing: Icon(Icons.lightbulb_outline),
            )
          ],
        ),
      ),
    );
  }
}
