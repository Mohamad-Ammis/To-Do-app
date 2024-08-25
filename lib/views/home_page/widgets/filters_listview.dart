
import 'package:flutter/material.dart';
import 'package:to_do_app/views/home_page/widgets/filter_card.dart';

class FiltersListView extends StatelessWidget {
  const FiltersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return FilterCard();
      },
      scrollDirection: Axis.horizontal,
    );
  }
}
