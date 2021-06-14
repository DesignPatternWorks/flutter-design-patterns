import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../data/models/design_pattern_category.dart';

class MainMenuCard extends StatelessWidget {
  final DesignPatternCategory category;

  const MainMenuCard({
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.all(0),
      color: Color(category.color),
      elevation: 8.0,
      clipBehavior: Clip.antiAlias,
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(
            horizontal: LayoutConstants.paddingL,
            vertical: LayoutConstants.paddingM,
          ),
          iconColor: Colors.white,
          collapsedIconColor: Colors.white,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category.title,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontSize: 26.0,
                      color: Colors.white,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: LayoutConstants.spaceL,
              ),
              Text(
                category.patterns.length == 1
                    ? '${category.patterns.length} pattern'
                    : '${category.patterns.length} patterns',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
          children: [
            ...category.patterns
                .map<Widget>(
                  (designPattern) => Material(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          designPattern.route,
                          arguments: designPattern,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: LayoutConstants.paddingM,
                          left: LayoutConstants.paddingL,
                          right: LayoutConstants.paddingL,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              designPattern.title,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            const SizedBox(height: LayoutConstants.spaceM),
                            Text(
                              designPattern.description,
                              style: Theme.of(context).textTheme.bodyText2,
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: LayoutConstants.spaceM),
                            Divider(
                              color: Color(category.color),
                              height: 1,
                              thickness: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
