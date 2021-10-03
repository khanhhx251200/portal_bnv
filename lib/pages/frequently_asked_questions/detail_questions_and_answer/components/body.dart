import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  bool isComments = false;

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Container(
        padding: EdgeInsets.all(defaultPadding),
        child: ListView(
          children: [
            Text(
              'Tôi quyên góp thành công nhưng không nhận được lượt quay Vong quay tri ân',
              style: TextStyle(
                  color: kBlackColors,
                  fontSize: bigSize,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: mediumSize),
            Text(
              'Có thể gián đoạn trong quá trình cập nhật số lượt quay, mong bạn thông cảm và trở lại màn hình chính của Portal và vào lại Portal bằng cách bạn có thể tìm Portal Wow ở thanh tìm kiếm, vui lòng nhập "Portal Wow-Vòng quay tri ân" và nhấn vào biểu tượng tương ứng để kiểm tra lại số lượt quay giúp Portal.',
              style: TextStyle(
                  color: kBlackColors,
                  fontSize: highSize,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(height: mediumSize),
            Text(
              'Có thể gián đoạn trong quá trình cập nhật số lượt quay, mong bạn thông cảm và trở lại màn hình chính của Portal và vào lại Portal bằng cách bạn có thể tìm Portal Wow ở thanh tìm kiếm, vui lòng nhập "Portal Wow-Vòng quay tri ân" và nhấn vào biểu tượng tương ứng để kiểm tra lại số lượt quay giúp Portal.',
              style: TextStyle(
                  color: kBlackColors,
                  fontSize: highSize,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(height: mediumSize),
            Text(
              'Có thể gián đoạn trong quá trình cập nhật số lượt quay, mong bạn thông cảm và trở lại màn hình chính của Portal và vào lại Portal bằng cách bạn có thể tìm Portal Wow ở thanh tìm kiếm, vui lòng nhập "Portal Wow-Vòng quay tri ân" và nhấn vào biểu tượng tương ứng để kiểm tra lại số lượt quay giúp Portal.',
              style: TextStyle(
                  color: kBlackColors,
                  fontSize: highSize,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(height: mediumSize),
            Divider(
              color: kGreyColors,
            ),
            SizedBox(height: mediumSize),
            isComments ? Text(kThankYouForComment, style: TextStyle(
              color: kSuccessColor,
              fontSize: highSize,
            )) : Row(
                children: [
                Text(kWasTheInformationUsefulToYou,
                style: TextStyle(
                    color: kBlackColors,
                    fontSize: highSize,
                    fontWeight: FontWeight.w300)),
            SizedBox(width: defaultPadding / 2),
            Expanded(child: GestureDetector(
                onTap: () {
                  context.loaderOverlay.show();
                  Future.delayed(defaultDuration, () {
                    context.loaderOverlay.hide();
                    setState(() {
                      isComments = !isComments;
                    });
                  });
                },
                child: buildComments()))
          ],
        ),
        ],
      ),
    ),);
  }

  Row buildComments() {
    return Row(
      children: [
        Image.asset(
          'assets/icons/like.png',
          height: highSize,
          width: highSize,
        ),
        SizedBox(width: defaultPadding / 2),
        Text(kYes,
            style: TextStyle(
                color: kBlackColors,
                fontSize: highSize,
                fontWeight: FontWeight.w500)),
        SizedBox(width: defaultPadding / 2),
        Image.asset(
          'assets/icons/dislike.png',
          height: highSize,
          width: highSize,
        ),
        SizedBox(width: defaultPadding / 2),
        Text(kNo,
            style: TextStyle(
                color: kBlackColors,
                fontSize: highSize,
                fontWeight: FontWeight.w500)),
      ],
    );
  }
}
