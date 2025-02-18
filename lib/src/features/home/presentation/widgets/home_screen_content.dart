import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/common/extensions/sized_box_extension.dart';
import 'package:red_line/src/features/auth/data/auth_repository.dart';
import 'package:red_line/src/features/home/presentation/widgets/discover_more_button.dart';
import 'package:red_line/src/features/home/presentation/widgets/genre/genre_chips_widget.dart';
import 'package:red_line/src/features/home/presentation/widgets/greeting_widget.dart';
import 'package:red_line/src/features/home/presentation/widgets/movie/movie_grid_widget.dart';
import 'package:red_line/src/features/home/presentation/widgets/search/searchfield_widget.dart';

class HomeScreenContent extends StatefulWidget {
  final PersistentTabController controller;
  final AuthRepository authRepository;

  const HomeScreenContent(
      {super.key, required this.controller, required this.authRepository});

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBoxExtension.height(60),
              GreetingWidget(
                controller: widget.controller,
                authRepository: widget.authRepository,
              ),
              SizedBoxExtension.height(20),
              SearchFieldWidget(),
              SizedBoxExtension.height(20),
              Stack(children: [
                MovieGridWidget(),
                GenreChipsWidget(),
              ]),
              DiscoverMoreButton(
                controller: widget.controller,
              ),
              SizedBoxExtension.height(25),
            ],
          ),
        ),
      ],
    );
  }
}
