import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/core/constants/color_constants.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
          child: Container(
        color: kWhiteColors,
        padding: EdgeInsets.symmetric(vertical: defaultPadding),
        child: ListView.builder(
          itemCount: 12,
          itemBuilder: (context, index) {
            return cardNotification();
          },
        ),
      )),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: kPrimaryColors,
        actions: [
          IconButton(
            icon: Icon(
              Icons.done_all,
              color: kWhiteColors,
            ),
            onPressed: () {},
          )
        ],
        title: Text(
          kNotification + " (12)",
          style: TextStyle(color: kWhiteColors, fontSize: highSize),
        ));
  }

  Card cardNotification() {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: smallSize,
        horizontal: smallSize,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(defaultPadding),
      )),
      elevation: 4,
      child: Container(
        padding: EdgeInsets.only(bottom: defaultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerNotification(),
            Divider(color: kGreyColors),
            Container(
              padding: EdgeInsets.symmetric(horizontal: mediumSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bạn đã nhân được 1.000.000.000đ từ Đâu đó.',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: highSize),
                  ),
                  Text(
                    '5 tháng giãn cách: Bạn chăm chỉ thực hiện 5T, không ra khỏi nhà, không xài tiền mặt? Chúng tôi chứng nhận cho sự nghiêm túc của bạn đây. Click liền tay lấy ngay thẻ đỏ!',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: highSize),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container headerNotification() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: defaultPadding),
          Image.asset(
            'assets/images/wallet.png',
            height: bigSize,
            width: bigSize,
          ),
          SizedBox(width: defaultPadding),
          Expanded(
            child: Row(
              children: [
                Text(
                  'Thanh toán hóa đơn',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 4),
                Icon(Icons.circle, color: kErrorColor, size: xSmallSize),
              ],
            ),
          ),
          Text(
            'Thứ hai, 04/10',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: Icon(
              Icons.more_horiz,
              color: kBlackColors,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
