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
                    'B???n ???? nh??n ???????c 1.000.000.000?? t??? ????u ????.',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: highSize),
                  ),
                  Text(
                    '5 th??ng gi??n c??ch: B???n ch??m ch??? th???c hi???n 5T, kh??ng ra kh???i nh??, kh??ng x??i ti???n m???t? Ch??ng t??i ch???ng nh???n cho s??? nghi??m t??c c???a b???n ????y. Click li???n tay l???y ngay th??? ?????!',
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
                  'Thanh to??n h??a ????n',
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
            'Th??? hai, 04/10',
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
