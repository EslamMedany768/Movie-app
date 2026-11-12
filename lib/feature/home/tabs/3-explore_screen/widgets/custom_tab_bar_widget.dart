import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/feature/home/tabs/3-explore_screen/widgets/tab_name_widget.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../domain/entity/GenreListEntity.dart';
import '../../../../../providers/default_tab_bar_provider.dart';
import '../cubit/browse_screen_view_model.dart';

class CustomTabBarWidget extends StatefulWidget {
  List<GenresEntity> genreList;

  CustomTabBarWidget({super.key, required this.genreList});

  @override
  State<CustomTabBarWidget> createState() => _CustomTabBarWidgetState();
}

class _CustomTabBarWidgetState extends State<CustomTabBarWidget> {
  late DefaultTabBarProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider=Provider.of<DefaultTabBarProvider>(context,listen: false);
    provider.selectedIndex=0;
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<BrowseScreenViewModel>(context);
    provider=Provider.of<DefaultTabBarProvider>(context);

    return DefaultTabController(
      initialIndex: provider.selectedIndex,
      length: widget.genreList.length,
      child: TabBar(
        tabAlignment: TabAlignment.start,
        onTap: (value) {
          provider.updateIndex(value);
          print(provider.selectedIndex);
        },
        labelPadding: EdgeInsets.only(right: 8),
        padding: EdgeInsets.symmetric(horizontal: 8),
        overlayColor: WidgetStateColor.transparent,
        indicatorColor: Colors.transparent,
        dividerColor: Colors.transparent,
        isScrollable: true,
        tabs: viewModel.genreList!.map((e) {
          return TabNameWidget(
            isSelected: provider.selectedIndex == widget.genreList.indexOf(e),
            item: e,
          );
        }).toList(),
      ),
    );
  }
}
