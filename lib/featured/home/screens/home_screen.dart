import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../common/common_path.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uira'),
        actions: [
          AppIconButton(
            onTap: () {},
            icon: PhosphorIcons.magnifyingGlass(),
          ),
          SizedBox(width: 10.0,),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: AppTitle(
                title: 'Favorite',
              ),
            ),

            Divider(
              thickness: 1.8,
              endIndent: 15.0,
            ),

            const SizedBox(height: 15.0,),

            CarouselSlider.builder(
              itemCount: 4,
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: .65,
                aspectRatio: 2.5,
                onPageChanged: (context, reason) {}
              ),
              itemBuilder: (context, index, pageIndex) => AppCardItem(
                onTap: () {},
                padding: EdgeInsets.zero,
                content: Stack(
                  fit: StackFit.expand,
                  children: [
                    AppImage(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    AppScrim(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ],
                ),
              ),
            ),

            GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(15.0),
              itemCount: 4,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3.0,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0
              ),
              itemBuilder: (BuildContext context, int index) {
                if(index == 3) {
                  return AppCardItem(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(5.0),
                  content: Center(
                    child: AppTitle(
                      title: 'See all',
                      size: 14.0,
                      maxLines: 1,
                    ),
                  ),
                );
                }
                return AppCardItem(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(5.0),
                  content: Row(
                    spacing: 15.0,
                    children: [
                      AspectRatio(
                        aspectRatio: 1.0,
                        child: AppImage(borderRadius: BorderRadius.circular(3.0),),
                      ),

                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppTitle(
                              title: 'Roman Picisan',
                              size: 14.0,
                              maxLines: 1,
                            ),

                            Row(
                              children: [
                                AppDescription(
                                  title: 'Bintang Lima',
                                  size: 13.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppTitle(
                    title: 'Latest',
                  ),

                  AppDescription(title: 'See all',),
                ],
              ),
            ),

            Divider(
              thickness: 1.8,
              endIndent: 15.0,
            ),

            AppListBuilder(
              count: 10,
              builder: (context, index) {
                return AspectRatio(
                  aspectRatio: 7.0,
                  child: AppCardItem(
                    onTap: () {},
                    borderRadius: BorderRadius.zero,
                    color: Colors.transparent,
                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                    content: Row(
                      spacing: 15.0,
                      children: [
                        AspectRatio(
                          aspectRatio: 1.0,
                          child: AppImage(borderRadius: BorderRadius.circular(3.0),),
                        ),

                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppTitle(
                                title: 'Roman Picisan',
                                size: 16.0,
                                maxLines: 1,
                              ),

                              Row(
                                spacing: 5.0,
                                children: [
                                  AppDescription(
                                    title: 'Bintang Lima',
                                  ),

                                  AppDescription(
                                    title: '·',
                                  ),

                                  AppDescription(
                                    title: 'Dewa 19',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
