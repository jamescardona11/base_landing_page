/// [def]

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// [loc]
import 'package:base_web_landing/app/presenter/index_page_provider.dart';
import 'package:base_web_landing/app/ui/pages/about_view.dart';
import 'package:base_web_landing/app/ui/pages/home_view.dart';
import 'package:base_web_landing/app/ui/pages/contact_view.dart';
import 'package:base_web_landing/app/ui/pages/location_view.dart';
import 'package:base_web_landing/app/ui/pages/other_view.dart';

import 'widgets/header_widget.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({
    Key? key,
    required this.page,
  }) : super(key: key);

  final String page;

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    final indexPageProvider = context.read<IndexPageProvider>();
    return Scaffold(
      body: Container(
        decoration: buildBoxDecoration(),
        child: Stack(
          children: [
            PageView(
              controller: indexPageProvider.controller,
              scrollDirection: Axis.vertical,
              children: const [
                HomeView(),
                AboutView(),
                ContactView(),
                LocationView(),
                OtherView(),
              ],
            ),
            const HeaderContainerWidget(),
          ],
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.pink,
            Colors.deepPurple,
          ],
          stops: [
            0.5,
            0.5,
          ],
        ),
      );
}