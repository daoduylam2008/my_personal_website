import 'package:flutter/material.dart';
import 'package:my_personal_website/Pages/about.dart';
import 'package:my_personal_website/Pages/activities.dart';
import 'package:my_personal_website/Pages/contact_me.dart';
import 'package:my_personal_website/Pages/education.dart';
import 'package:my_personal_website/Pages/portfolio.dart';

// Tabs constants
const tabs = [
  "about",
  "portfolio",
  "education",
  "activities",
  "contact me",
];

const tab_children = [
  AboutPage(),
  PortfolioPage(),
  EducationPage(),
  ActivitiesPage(),
  ContactMePage()
];

// Preferences constants
const my_info_json_file = "data/my_info.json";
const my_passion_json_file = "data/my_passion.json";
const my_favorite_json_file = "data/my_favorite.json";
const my_wards_json_file = "data/my_awaeds.json";

// Colors constants
const tabBackgroundColor = Color(0xFF004080);
const viewBackgroundColor = Color(0xFFc6def1);

const cardShadowColor1 = Color.fromARGB(255, 109, 179, 249);
const cardShadowColor2 = Color.fromARGB(255, 40, 40, 40);
const cardColor = Color(0xff6eb5ff);
