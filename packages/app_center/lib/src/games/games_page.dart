import 'package:app_center/games.dart';
import 'package:app_center/l10n.dart';
import 'package:app_center/layout.dart';
import 'package:app_center/snapd.dart';
import 'package:app_center/store.dart';
import 'package:app_center/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GamesPage extends ConsumerWidget {
  const GamesPage({super.key});

  static IconData icon(bool selected) => SnapCategoryEnum.games.icon(selected);
  static String label(BuildContext context) =>
      AppLocalizations.of(context).gamesPageLabel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return ResponsiveLayoutScrollView(
      slivers: [
        SliverList.list(children: [
          const SizedBox(height: kPagePadding),
          _Title(text: SnapCategoryEnum.games.localize(l10n)),
        ]),
        SliverList.list(children: const [
          SizedBox(height: kPagePadding),
          GamesPageFeatured(),
          SizedBox(height: kPagePadding),
        ]),
        SliverList.list(children: const [
          SizedBox(height: 200, width: 700, child: DinoGame())
        ]),
        const CategorySnapList(category: SnapCategoryEnum.games),
        SliverList.list(
          children: [
            const SizedBox(height: kPagePadding),
            Row(
              children: [
                const Expanded(
                    flex: 306 - 160,
                    child: CategoryBanner(
                      category: SnapCategoryEnum.gameDev,
                      padding: _CategoryBannerProperties.padding,
                      height: _CategoryBannerProperties.height,
                      kMaxSize: _CategoryBannerProperties.kMaxSize,
                      kIconSize: _CategoryBannerProperties.kIconSize,
                    )),
                Container(width: 12),
                const Expanded(
                    flex: 306 - 160,
                    child: CategoryBanner(
                      category: SnapCategoryEnum.gameEmulators,
                      padding: _CategoryBannerProperties.padding,
                      height: _CategoryBannerProperties.height,
                      kMaxSize: _CategoryBannerProperties.kMaxSize,
                      kIconSize: _CategoryBannerProperties.kIconSize,
                    ))
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Expanded(
                    flex: 306 - 160,
                    child: CategoryBanner(
                      category: SnapCategoryEnum.gnomeGames,
                      padding: _CategoryBannerProperties.padding,
                      height: _CategoryBannerProperties.height,
                      kMaxSize: _CategoryBannerProperties.kMaxSize,
                      kIconSize: _CategoryBannerProperties.kIconSize,
                    )),
                Container(width: 12),
                const Expanded(
                    flex: 306 - 160,
                    child: CategoryBanner(
                      category: SnapCategoryEnum.kdeGames,
                      padding: _CategoryBannerProperties.padding,
                      height: _CategoryBannerProperties.height,
                      kMaxSize: _CategoryBannerProperties.kMaxSize,
                      kIconSize: _CategoryBannerProperties.kIconSize,
                    ))
              ],
            ),
            const SizedBox(
              height: kPagePadding,
            )
          ],
        ),
        SliverList.list(children: [
          ToolsBanner(
              summary: 'External references', //TODO: l10n
              buttonText: 'Discover resources',
              bannerApps: tools),
          const SizedBox(height: kPagePadding),
        ]),
        SliverList.list(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: Container(),
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: OutlinedButton(
                    onPressed: () {
                      StoreNavigator.pushSearch(context,
                          category: SnapCategoryEnum.games.categoryName);
                    },
                    child: const Text('All games'), //TODO: l10n
                  ),
                ),
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: Container(),
                ),
              ],
            ),
            const SizedBox(height: kPagePadding),
          ],
        )
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.headlineSmall);
  }
}

class _CategoryBannerProperties {
  static const double padding = 24;
  static const double height = 150;
  static const double kMaxSize = 60;
  static const double kIconSize = 32;
}
