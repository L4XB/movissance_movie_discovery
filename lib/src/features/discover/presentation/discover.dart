import 'package:flutter/material.dart';
import 'package:red_line/src/features/discover/presentation/widgets/discover_page_content.dart';
import 'package:red_line/src/features/discover/presentation/widgets/swiper_favourit_foating_action_button.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DiscoverPageContent(),
      floatingActionButton: SwiperFavouritFoatingActionButton(),
    );
  }
}
