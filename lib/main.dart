import 'package:flutter/material.dart';
import 'package:my_personal_website/constant.dart';
import 'package:my_personal_website/utils.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainApp();
}

class _MainApp extends State<MainApp> with TickerProviderStateMixin {
  late final TabController _controller;

  int tab_index = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        TabController(length: tabs.length, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _tap(BuildContext context, int i) {
    tab_index = i;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lam Dao website",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: viewBackgroundColor,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [SliverAppBar(
              expandedHeight: 500,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: [
                  StretchMode.zoomBackground
                ],
                background: ClipRect(
                  child: Image(image: AssetImage("backgrounds/rocky_mountain_5.jpeg"),fit: BoxFit.cover,)
                ),
              ),
              stretch: true,
              centerTitle: true,
              toolbarHeight: 150,
              title: Padding(
                padding: const EdgeInsets.only(
                  top: 70
                ),
                child: Text(
                  "Hi! I'm Lam",
                  style: GoogleFonts.pacifico(fontSize: 60),
                ),
              ),
              // The big screen background color
              backgroundColor: tabBackgroundColor,
              foregroundColor: Colors.white,
              bottom: TabBar(
                isScrollable: false,
                // Indicator edition
                indicator: UnderlineTabIndicator(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      width: 4,
                      color: Colors.white,
                    )),
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 5,
                // Create tabbar with text from tabs label
                tabs: [for (final f in tabs) tabLabel(f)],
                controller: _controller,
                onTap: (index) => _tap(context, index),
            ),
            )];
          },
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller, children: tab_children),
        ),
      ),
    );
  }

  // text on the tab widget
  Widget tabLabel(String label) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      width: 150,
      height: 40,
      child: Center(
          child: Text(capitalizeString(label)!,
              style: GoogleFonts.oleoScript(
                color: Colors.white,
                fontSize: 20,
              ))),
    );
  }

  // My name widget which places on the leading of the AppBar
}
