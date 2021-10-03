import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SlidePosts extends StatefulWidget {
  const SlidePosts({Key key}) : super(key: key);

  @override
  _SlidePostsState createState() => _SlidePostsState();
}

class _SlidePostsState extends State<SlidePosts> {
  final List<String> imageList = [
    "http://i.imgur.com/zuG2bGQ.jpg",
    "http://i.imgur.com/ovr0NAF.jpg",
    "http://i.imgur.com/pSHXfu5.jpg",
    "http://i.imgur.com/3wQcZey.jpg",
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
                height: 180,
                scrollPhysics: BouncingScrollPhysics(),
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
                autoPlay: true),
            itemCount: imageList.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              final element = imageList[index];
              return itemSlide(element, size);
            },
          ),
          SizedBox(height: defaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                List.generate(imageList.length, (index) => buildDot(index)),
          )
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: activeIndex == index ? 20 : 6,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: activeIndex == index ? kPrimaryColors : Color(0xFFD8D8D8)),
      duration: defaultDuration,
    );
  }

  Widget itemSlide(String element, Size size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(xSmallSize),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            element,
            fit: BoxFit.cover,
            height: 350,
            width: size.width,
          ),
          GestureDetector(
            onTap: () {
              print('detail posts');
            },
            child: Container(
              width: size.width,
              height: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(xSmallSize)),
                  gradient: LinearGradient(
                      colors: [
                        kBlackColors.withOpacity(0.8),
                        kBlackColors.withOpacity(0.0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0.0, 0.8])),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: defaultPadding / 2,
                    left: smallSize,
                    right: smallSize),
                child: Text(
                  'Note: this page is built with flutter-web. For a better user experience, please use a mobile device to open this link.',
                  style: TextStyle(
                      color: kWhiteColors, fontWeight: FontWeight.w600),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: smallSize, bottom: 4.0, right: smallSize),
                child: Wrap(
                  children: [
                    Icon(Icons.launch,
                        color: kWhiteColors.withOpacity(0.8), size: smallSize),
                    SizedBox(width: defaultPadding / 2),
                    Text(
                      'ecoit.com.vn',
                      style: TextStyle(
                          color: kWhiteColors.withOpacity(0.8),
                          fontSize: xSmallSize),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
