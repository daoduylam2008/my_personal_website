import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_personal_website/LoadingCircle.dart';
import 'package:my_personal_website/constant.dart';
import 'package:my_personal_website/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPage();
}

class _AboutPage extends State<AboutPage> {
  late Future<Map<String, dynamic>> my_info;
  late Future<Map<String, dynamic>> my_passion;

  @override
  void initState() {
    super.initState();
    // Read my_info.json file to get my information and contacts
    my_info = readFile(my_info_json_file);
    my_passion = readFile(my_passion_json_file);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(5),
      child: Center(
          child: Column(
        children: [
          SizedBox(height: 20),
          introductionCard(),
          SizedBox(height: 20),

          // Display the contacts, such as gmail, facebook account
          FutureBuilder(
              future: my_info,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List contacts = snapshot.data!["contact_info"].keys.toList();
                  return SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(contacts.length, (index) {
                        return contactButton(
                            contacts[index], snapshot.data!["contact_info"]);
                      }),
                    ),
                  );
                }
                return LoadingCircle();
              }),
          FutureBuilder(future: future, builder: builder)
        ],
      )),
    );
  }

  // My nature interest section
  Widget exploreSection() {
    return Container(
      child: Column(
        children: [
          Text(
            "Let's go!!! Let's explore!!!",
            style: GoogleFonts.satisfy(fontSize: 40),
          )
        ],
      ),
    );
  }

  // Button to link my contact information, when you press it will bring you to a new tab on your web browser
  Widget contactButton(String platform, Map<String, dynamic> contact) {
    Future<void> onPressed() async {
      if (platform == "gmail") {
        await launchUrl(Uri(scheme: "mailto", path: contact[platform]));
      } else if (platform == "phone_number") {
        await launchUrl(Uri(scheme: "tel", path: contact[platform]));
      } else {
        await launchUrl(Uri.parse(contact[platform]));
      }
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: CircleBorder(), backgroundColor: cardColor),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 10,
          top: 10,
        ),
        child: SizedBox(
            width: 50,
            height: 50,
            child: Image(
              image: AssetImage("icon/${platform.toLowerCase()}_icon.png"),
              fit: BoxFit.contain,
            )),
      ),
    );
  }

  // The first card which displays on your screen when you open About tab
  Widget introductionCard() {
    return Container(
      padding: EdgeInsets.all(10),
      width: 1100,
      height: 500,
      // Create shadow for the card to make it more "card"!!
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: cardShadowColor1,
          blurRadius: 20,
        ),
        BoxShadow(color: cardShadowColor2, blurRadius: 10)
      ], borderRadius: BorderRadius.circular(5), color: cardColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // My personal image for introduction, it is added into a oval shape to make it more beautiful!
          ClipOval(
              child: Image(
            image: AssetImage("assets/my_photo.JPG"),
          )),

          SizedBox(width: 20),

          // Myself introduction
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("About me",
                      style: GoogleFonts.satisfy(
                        color: Colors.white,
                        fontSize: 30,
                      )),
                  FutureBuilder<Map<String, dynamic>>(
                      future: my_info,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text("${snapshot.data!["about"]}",
                              style: GoogleFonts.raleway(
                                  fontSize: 20, fontStyle: FontStyle.italic));
                        }
                        return LoadingCircle();
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
