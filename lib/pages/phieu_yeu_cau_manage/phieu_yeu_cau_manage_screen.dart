import 'dart:async';

import 'package:app_mobile/components/empty_data_widget.dart';
import 'package:app_mobile/components/loading_widget.dart';
import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/core/providers/file_provider.dart';
import 'package:app_mobile/pages/phieu_yeu_cau_manage/components/app_bar_phieu_yeu_cau.dart';
import 'package:app_mobile/pages/phieu_yeu_cau_manage/components/item_phieu_yeu_cau.dart';
import 'package:app_mobile/pages/phieu_yeu_cau_manage/components/phieu_yeu_cau_provider.dart';
import 'package:app_mobile/pages/phieu_yeu_cau_manage/form_phieu_yeu_cau/form_phieu_yeu_cau.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class PhieuYeuCauManageScreen extends StatefulWidget {
  const PhieuYeuCauManageScreen({Key key}) : super(key: key);

  @override
  _PhieuYeuCauManageScreenState createState() =>
      _PhieuYeuCauManageScreenState();
}

class _PhieuYeuCauManageScreenState extends State<PhieuYeuCauManageScreen> {
  bool isLoading = false;
  int pageCount = 1;
  String query = '';
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getAllPhieuYeuCau(20125, 20100, '');
    _scrollController.addListener(_scrollListener);
  }

  //// ADDING THE SCROLL LISTINER
  _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        int total = context.read<PhieuYeuCauProvider>().totalSize;
        if (context.read<PhieuYeuCauProvider>().phieuYeuCauList.length <
            total) {
          isLoading = true;
          if (isLoading) {
            print("RUNNING LOAD MORE");
            //// CALL YOUR API HERE FOR THE NEXT FUNCTIONALITY
            Future.delayed(
                defaultDuration,
                () => context
                    .read<PhieuYeuCauProvider>()
                    .loadMorePhieuYeuCau(20125, 20100, query));
            isLoading = false;
          }
        } else {
          Toast.show(kDataEmpty, context,
              duration: Toast.LENGTH_LONG,
              backgroundColor: kWarningColor,
              gravity: Toast.BOTTOM);
        }
      });
    }
  }

  getAllPhieuYeuCau(int groupId, int companyId, String query) {
    context
        .read<PhieuYeuCauProvider>()
        .getAllInitPhieuYeuCau(groupId, companyId, query);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder:
          (BuildContext context, PhieuYeuCauProvider provider, Widget child) {
        return Scaffold(
          appBar: appBarPhieuYeuCau(),
          body: SafeArea(
              child: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      Text(kPhieuYeuCauList.toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Divider(color: kBlackColors),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 40,
                              child: TextField(
                                onChanged: (value) {
                                  pageCount = 1;
                                  query = value;
                                  provider.getAllInitPhieuYeuCau(
                                      20125, 20100, query);
                                },
                                decoration: InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: kGreyColors)),
                                    prefixIcon: Icon(Icons.search),
                                    hintText: kKeyword,
                                    contentPadding:
                                        EdgeInsets.all(defaultPadding)),
                              ),
                            ),
                          ),
                          SizedBox(width: defaultPadding),
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FormPhieuYeuCau()));
                            },
                            label: Text(
                              kAddNew,
                              style: TextStyle(color: kWhiteColors),
                            ),
                            icon: Icon(Icons.add, color: kWhiteColors),
                          )
                        ],
                      ),
                      provider.status == EventLoadingStatus.Loading
                          ? LoadingWidget()
                          : provider.phieuYeuCauList.isEmpty
                              ? EmptyDataWidget()
                              : listPhieuYeuCau(provider)
                    ],
                  ))),
        );
      },
    );
  }

  Widget listPhieuYeuCau(PhieuYeuCauProvider provider) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          query = '';
          pageCount = 1;
          provider.getAllInitPhieuYeuCau(20125, 20100, query);
        },
        child: ListView.builder(
          controller: _scrollController,
          itemCount: provider.phieuYeuCauList.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == provider.phieuYeuCauList.length) {
              return isLoading
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LoadingWidget(),
                    )
                  : SizedBox.shrink();
            }
            return ItemPhieuYeuCau(
                phieuYeuCau: provider.phieuYeuCauList[index]);
          },
        ),
      ),
    );
  }
}
