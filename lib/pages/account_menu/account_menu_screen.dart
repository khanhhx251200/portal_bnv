import 'package:app_mobile/components/bottom_sheet_shape.dart';
import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/core/services/share_preferences_service.dart';
import 'package:app_mobile/pages/account_menu/components/item_menu.dart';
import 'package:app_mobile/pages/auth/auth_screen.dart';
import 'package:app_mobile/pages/auth/password_manager/password_manager_screen.dart';
import 'package:app_mobile/pages/auth/verify_email/verify_email_screen.dart';
import 'package:app_mobile/pages/frequently_asked_questions/frequently_asked_questions_screen.dart';
import 'package:app_mobile/pages/update_account/update_screen.dart';
import 'package:flutter/material.dart';

class AccountMenu extends StatefulWidget {
  const AccountMenu({Key key}) : super(key: key);

  @override
  _AccountMenuState createState() => _AccountMenuState();
}

class _AccountMenuState extends State<AccountMenu> {
  final _preferences = PreferencesService();

  @override
  void initState() {
    super.initState();
  }

  pushToPasswordManage(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PasswordManagerScreen()));
  }

  pushToAccountManage(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => UpdateAccountScreen()));
  }
  pushToAskAndQuestion(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => FrequentlyAskedQuestionScreen()));
  }

  logout() async {
    await _preferences.logout();
    Navigator.of(context).pushNamedAndRemoveUntil(
        AuthScreen.routeName,
            (Route<dynamic> route) => false);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: defaultPadding),
            color: kPrimaryColors,
            child: ListTile(
              onTap: () {
                pushToAccountManage(context);
              },
              leading: CircleAvatar(
                radius: 24.0,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/images/avatar_empty.png'),
              ),
              title: Text(
                'Hoàng Xuân Khánh',
                style:
                TextStyle(color: kWhiteColors, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: defaultPadding),
          ListView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              ItemMenu(text: kAccountManage, icon: Icons.person, onPress: () {
                pushToAccountManage(context);
              }),
              ItemMenu(text: kFileManage, icon: Icons.folder, onPress: () {}),
              ItemMenu(
                  text: kDocumentManage,
                  icon: Icons.insert_drive_file,
                  onPress: () {}),
              ItemMenu(
                  text: kProcedureManage,
                  icon: Icons.settings_applications_sharp,
                  onPress: () {}),
              ItemMenu(
                  text: kRequestManage,
                  icon: Icons.request_page,
                  onPress: () {}),
              ItemMenu(
                  text: kPayManage,
                  icon: Icons.payment,
                  onPress: () {}),
              ItemMenu(
                  text: kPostsManage, icon: Icons.assignment, onPress: () {}),
              ItemMenu(
                  text: kPasswordManage,
                  icon: Icons.vpn_key_sharp,
                  onPress: () {
                    pushToPasswordManage(context);
                  }),
              ItemMenu(
                  text: kFrequentlyAskedQuestions,
                  icon: Icons.question_answer,
                  onPress: () {
                    pushToAskAndQuestion(context);
                  }),
              ItemMenu(text: kLogout, icon: Icons.logout, onPress: () {
                _openSignOutDrawer(context);
              }),
            ],
          )
        ],
      ),
    );
  }

  void _openSignOutDrawer(BuildContext context) {
    showModalBottomSheet(
        shape: BottomSheetShape(),
        backgroundColor: kPrimaryColors,
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.only(
              top: 24,
              bottom: 0,
              left: 48,
              right: 48,
            ),
            height: 180,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RichText(text: TextSpan(
                    children: [
                      TextSpan(text: "Hoàng Xuân Khánh", style: TextStyle(
                          color: Theme
                              .of(context)
                              .scaffoldBackgroundColor,
                          fontSize: veryHighSize,
                          fontWeight: FontWeight.w600)),
                      TextSpan(text: ", bạn có chắc chắn muốn đăng xuất không?",

                        style: TextStyle(
                            color: Theme
                                .of(context)
                                .scaffoldBackgroundColor,
                            fontSize: highSize,
                            fontWeight: FontWeight.w300),
                      )
                    ]
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {
                          logout();
                        },
                        color: Colors.white,
                        child: Text(
                          "Đăng xuất",
                          style: TextStyle(
                            color: kPrimaryColors,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: OutlineButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        borderSide: BorderSide(
                          color: Theme
                              .of(context)
                              .scaffoldBackgroundColor,
                        ),
                        color: Theme
                            .of(context)
                            .primaryColor,
                        child: Text(
                          "Ở lại",
                          style: TextStyle(
                            color: Theme
                                .of(context)
                                .scaffoldBackgroundColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

}
