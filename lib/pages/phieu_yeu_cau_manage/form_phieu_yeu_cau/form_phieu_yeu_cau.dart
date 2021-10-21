import 'dart:io';
import 'package:app_mobile/components/snackbar_utils.dart';
import 'package:app_mobile/core/models/response/phieu_yeu_cau_response.dart';
import 'package:app_mobile/core/utils/keyboard_utils.dart';
import 'package:app_mobile/pages/phieu_yeu_cau_manage/components/phieu_yeu_cau_provider.dart';
import 'package:app_mobile/pages/phieu_yeu_cau_manage/form_phieu_yeu_cau/components/edit_file_selected.dart';
import 'package:app_mobile/pages/phieu_yeu_cau_manage/form_phieu_yeu_cau/components/view_files.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/core/models/request/phieu_yeu_cau_request.dart';
import 'package:app_mobile/pages/phieu_yeu_cau_manage/form_phieu_yeu_cau/components/app_bar_add_new_pyc.dart';
import 'package:app_mobile/pages/phieu_yeu_cau_manage/form_phieu_yeu_cau/components/edit_file_selected_create_new.dart';
import 'package:app_mobile/pages/phieu_yeu_cau_manage/form_phieu_yeu_cau/components/input_area.dart';
import 'package:app_mobile/pages/phieu_yeu_cau_manage/form_phieu_yeu_cau/components/input_no_required.dart';
import 'package:app_mobile/pages/phieu_yeu_cau_manage/form_phieu_yeu_cau/components/input_number.dart';
import 'package:app_mobile/pages/phieu_yeu_cau_manage/form_phieu_yeu_cau/components/input_required.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormPhieuYeuCau extends StatefulWidget {
  const FormPhieuYeuCau({Key key, this.phieuYeuCau}) : super(key: key);
  final PhieuYeuCau phieuYeuCau;

  @override
  _FormPhieuYeuCauState createState() => _FormPhieuYeuCauState();
}

class _FormPhieuYeuCauState extends State<FormPhieuYeuCau> {
  TextEditingController nameController = TextEditingController();
  TextEditingController intendTimeController = TextEditingController();
  TextEditingController depositSourceController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController numberOfElectronicDocumentController =
      TextEditingController();
  TextEditingController totalNumberOfFilingsController =
      TextEditingController();
  TextEditingController totalPagesController = TextEditingController();
  TextEditingController totalCapacityController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  List<String> depositsMethod = ['Trực tuyến', 'Trực tiếp', 'Chưa xác định'];
  List<String> depositsSource = [
    'Trung tâm LTQG II',
    'Trung tâm LTQG III',
    'Trung tâm LTQG IV',
    'Nộp lưu tài liệu giấy'
  ];

  List<File> _filesIndex = [];
  List<File> _filesAttach = [];

  int lengthFilesIndex = 0;
  int lengthFilesAttach = 0;

  String depositsMethodValue = '';
  String depositsSourceValue = '';
  String errorInput = '';

  PhieuYeuCau _phieuYeuCau;

  bool isEnableInput = true;

  var _openResult = 'Unknown';


  @override
  void initState() {
    super.initState();
    depositsMethodValue = depositsMethod[0];
    depositsSourceValue = depositsSource[0];
    if (widget.phieuYeuCau != null) {
      _populateFields();
      print('status: ${widget.phieuYeuCau.status}');
      int status = widget.phieuYeuCau.status;
      if (status == 2 || status == 4 || status == 5) {
        setState(() => isEnableInput = false);
      } else {
        setState(() => isEnableInput = true);
      }
    }
    print('isEnableInput: $isEnableInput');
  }

  _populateFields() async {
    await context
        .read<PhieuYeuCauProvider>()
        .getDetailPhieuYeuCau(20125, 20100, widget.phieuYeuCau.phieuId);
    setState(() {
      _phieuYeuCau = context.read<PhieuYeuCauProvider>().phieuYeuCau;
      nameController.text = _phieuYeuCau.tenPhieu;
      intendTimeController.text = convertDate(
        _phieuYeuCau.thoiGianNopLuu,
      );
      addressController.text = _phieuYeuCau.diaChiLienHe;
      numberOfElectronicDocumentController.text =
          _phieuYeuCau.soLanNopLuu.toString();
      totalNumberOfFilingsController.text =
          _phieuYeuCau.tongSoHoSoNopLuu.toString();
      totalPagesController.text = _phieuYeuCau.soTrang.toString();
      totalCapacityController.text = _phieuYeuCau.dungLuong.toString();
      int indexCachThuc = depositsMethod
          .indexWhere((element) => element == _phieuYeuCau.cachThucNopLuu);
      // int indexNguon = depositsSource
      //     .indexWhere((element) => element == _phieuYeuCau.nguonNopLuu);
      noteController.text = _phieuYeuCau.ghiChu;
      depositsMethodValue = depositsMethod[indexCachThuc];
      depositsSourceValue = depositsSource[0];
    });
  }

  @override
  void deactivate() {
    super.deactivate();
    EasyLoading.dismiss();
  }

  _openFilePicker(bool isFileAttach) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.any,
      );

      if (result != null) {
        setState(() {
          var files = result.paths.map((path) => File(path)).toList();
          if (isFileAttach) {
            if (_filesAttach.isNotEmpty) {
              for (int i = 0; i < files.length; i++) {
                for (int j = 0; j < _filesAttach.length; j++) {
                  if (files[i].path == _filesAttach[j].path) {
                    files.remove(files[i]);
                  }
                }
              }
              _filesAttach.addAll(files);
            } else {
              _filesAttach = files;
            }
            lengthFilesAttach = _filesAttach.length;
          } else {
            if (_filesIndex.isNotEmpty) {
              for (int i = 0; i < files.length; i++) {
                for (int j = 0; j < _filesIndex.length; j++) {
                  if (files[i].path == _filesIndex[j].path) {
                    files.remove(files[i]);
                  }
                }
              }
              _filesIndex.addAll(files);
            } else {
              _filesIndex = files;
            }
            lengthFilesIndex = _filesIndex.length;
          }
        });
      } else {
        print('No selected');
      }
    } catch (ex) {
      print('error: $ex');
    }
  }

  resetForm() {
    String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
    nameController.clear();
    intendTimeController.text = formattedDate;
    depositSourceController.clear();
    addressController.clear();
    numberOfElectronicDocumentController.clear();
    totalNumberOfFilingsController.clear();
    totalPagesController.clear();
    totalCapacityController.clear();
    noteController.clear();
    setState(() {
      depositsMethodValue = depositsMethod[0];
      depositsSourceValue = depositsSource[0];
      _filesIndex.clear();
      _filesAttach.clear();
      errorInput = '';
    });
  }

  PhieuYeuCauRequest getPhieuYeuCau() {
    List<MultipartFile> mucLucsPartFile = [];
    List<MultipartFile> dinhKemPartFiles = [];

    for (var i = 0; i < _filesIndex.length; i++) {
      mucLucsPartFile.add(MultipartFile.fromFileSync(_filesIndex[i].path,
          filename: getNameFile(_filesIndex[i].path)));
    }
    for (var i = 0; i < _filesAttach.length; i++) {
      dinhKemPartFiles.add(MultipartFile.fromFileSync(_filesAttach[i].path,
          filename: getNameFile(_filesAttach[i].path)));
    }
    PhieuYeuCauRequest request = PhieuYeuCauRequest(
        tenPhieu: nameController.text,
        thoiGianNopLuu: intendTimeController.text,
        diaChiLienHe: addressController.text,
        soLanNopLuu: numberOfElectronicDocumentController.text.isNotEmpty
            ? int.parse(numberOfElectronicDocumentController.text)
            : 0,
        tongSoHoSoNop: totalNumberOfFilingsController.text.isNotEmpty
            ? int.parse(totalNumberOfFilingsController.text)
            : 0,
        soTrang: totalPagesController.text.isNotEmpty
            ? int.parse(totalPagesController.text)
            : 0,
        dungLuong: totalCapacityController.text.isNotEmpty
            ? int.parse(totalCapacityController.text)
            : 0,
        cachThucNopLuu: depositsMethodValue,
        nguonNopLuu: depositsSourceValue,
        mucLucsFile: mucLucsPartFile,
        dinhKemFiles: dinhKemPartFiles,
        ghiChu: noteController.text);
    return request;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarFormPhieuYeuCau(_phieuYeuCau),
      body: LoaderOverlay(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Center(
                      child: Text(
                          (isEnableInput ? kUpdate.toUpperCase() : "") +
                              " phiếu yêu cầu".toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Divider(color: kBlackColors),
                    SizedBox(height: defaultPadding),
                    InputRequired(
                      controller: nameController,
                      isDate: false,
                      isEnable: isEnableInput,
                      label: 'Tên phiếu',
                      error: errorInput,
                    ),
                    SizedBox(height: smallSize),
                    InputRequired(
                      controller: intendTimeController,
                      isDate: true,
                      isEnable: isEnableInput,
                      label: 'Dự kiến thời gian tiến hành nộp lưu',
                    ),
                    SizedBox(height: smallSize),
                    InputNoRequired(
                      controller: addressController,
                      label: 'Địa chỉ liên hệ',
                      isEnable: isEnableInput,
                    ),
                    SizedBox(height: smallSize),
                    Row(
                      children: [
                        Expanded(
                            child: InputNumber(
                          controller: numberOfElectronicDocumentController,
                          isEnable: isEnableInput,
                          label: 'Số lần nộp lưu tài liệu điện tử',
                        )),
                        SizedBox(width: defaultPadding),
                        Expanded(
                            child: InputNumber(
                          controller: totalNumberOfFilingsController,
                          isEnable: isEnableInput,
                          label: 'Tổng số hồ sơ nộp lưu',
                        ))
                      ],
                    ),
                    SizedBox(height: smallSize),
                    Row(
                      children: [
                        Expanded(
                            child: InputNumber(
                          controller: totalPagesController,
                          isEnable: isEnableInput,
                          label: 'Tổng số trang',
                        )),
                        SizedBox(width: defaultPadding),
                        Expanded(
                            child: InputNumber(
                          controller: totalCapacityController,
                          isEnable: isEnableInput,
                          label: 'Tổng số dung lượng',
                        ))
                      ],
                    ),
                    SizedBox(height: defaultPadding),
                    dropdownDepositMethod('Cách thức nộp lưu'),
                    SizedBox(height: defaultPadding),
                    dropdownDepositSource('Nguồn nộp lưu'),
                    SizedBox(height: defaultPadding),
                    fileIndexAttach('Mục lục hồ sơ'),
                    SizedBox(height: defaultPadding),
                    fileAttach('Tài liệu đính kèm'),
                    SizedBox(height: smallSize),
                    InputArea(
                        controller: noteController,
                        label: 'Ghi chú',
                        isEnable: isEnableInput),
                  ],
                ),
              ),
              _phieuYeuCau == null
                  ? buttonAddAndUpdateForm(context)
                  : _phieuYeuCau.status == 0 ||
                          _phieuYeuCau.status == 1 ||
                          _phieuYeuCau.status == 3
                      ? buttonAddAndUpdateForm(context)
                      : buttonBack(context)
            ],
          ),
        )),
      ),
    );
  }

  Row buttonAddAndUpdateForm(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: MaterialButton(
          color: kPrimaryColors,
          onPressed: () async {
            EasyLoading.show(status: 'Đang xử lí...');
            KeyboardUtil.hideKeyboard(context);
            Future.delayed(defaultDuration, () => createPhieuYeuCau(context));
          },
          child: Text(kSave, style: TextStyle(color: kWhiteColors)),
        )),
        SizedBox(width: defaultPadding),
        Expanded(
            child: MaterialButton(
          color: kLabelColors.withOpacity(0.1),
          onPressed: () {
            resetForm();
          },
          child: Text(
            kReset,
            style: TextStyle(color: kWhiteColors),
          ),
        )),
      ],
    );
  }

  SizedBox buttonBack(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        color: kLabelColors.withOpacity(0.1),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          kBack,
          style: TextStyle(color: kWhiteColors),
        ),
      ),
    );
  }

  Future<void> createPhieuYeuCau(BuildContext context) async {
    if (nameController.text.isEmpty) {
      setState(() => errorInput = kRequired);
    } else if (patternCode.hasMatch(nameController.text)) {
      setState(() => errorInput = kNotCharacter);
    } else {
      setState(() => errorInput = '');
      PhieuYeuCauRequest request = getPhieuYeuCau();
      final response = await context
          .read<PhieuYeuCauProvider>()
          .addAndUpdatePhieuYeuCau(request, 20129, 20125, 20100,
              widget.phieuYeuCau == null ? 0 : widget.phieuYeuCau.phieuId);
      if (response['message'] == 'SUCCESSFUL') {
        await context
            .read<PhieuYeuCauProvider>()
            .getAllInitPhieuYeuCau(20125, 20100, '');
        Navigator.pop(context);
        showSnackBar(kConfirm, 'Cập nhật phiếu yêu cầu $kSuccess',
            kSuccessColor, kWhiteColors, kTOP);
      } else {
        print('res: $response');
        setState(() => errorInput = response['message']);
      }
      EasyLoading.dismiss();

      // context.loaderOverlay.hide();
    }
  }

  Widget fileIndexAttach(String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: smallSize,
                color: kLabelColors)),
        SizedBox(height: defaultPadding),
        isEnableInput
            ? widget.phieuYeuCau == null
                ? mucLucHoSoCreateNew()
                : mucLucHoSoEdit()
            : mucLucHoSoView()
      ],
    );
  }

  Container mucLucHoSoCreateNew() {
    print('create new mucluc');
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      height: 48,
      decoration: BoxDecoration(
          border: Border.all(color: kGreyColors),
          borderRadius: BorderRadius.circular(defaultPadding - 2)),
      child: Row(
        children: [
          isEnableInput
              ? ElevatedButton(
                  onPressed: () {
                    _openFilePicker(false);
                  },
                  child: Text(
                    'Chọn tệp',
                    style: TextStyle(color: kWhiteColors),
                  ),
                )
              : SizedBox.shrink(),
          SizedBox(width: defaultPadding),
          Expanded(
              child: Text(_filesIndex.isNotEmpty
                  ? "$lengthFilesIndex tệp"
                  : kNoFilesSelected)),
          _filesIndex.isEmpty
              ? SizedBox.shrink()
              : IconButton(
                  onPressed: () async {
                    final result = await showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(25.0)),
                        ),
                        context: context,
                        builder: (context) {
                          return EditFilesSelectedCreateNew(files: _filesIndex);
                        });
                    if (result != null) {
                      setState(() {
                        _filesIndex = result;
                        lengthFilesIndex = _filesIndex.length;
                      });
                    }
                  },
                  icon: Icon(Icons.edit))
        ],
      ),
    );
  }

  Widget mucLucHoSoEdit() {
    print('edit muc luc');
    int totalListFile =
        widget.phieuYeuCau != null ? widget.phieuYeuCau.mucLucHoSos.length : 0;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      height: 48,
      decoration: BoxDecoration(
          border: Border.all(color: kGreyColors),
          borderRadius: BorderRadius.circular(defaultPadding - 2)),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              _openFilePicker(true);
            },
            child: Text(
              'Chọn tệp',
              style: TextStyle(color: kWhiteColors),
            ),
          ),
          SizedBox(width: defaultPadding),
          Expanded(
              child: Text(widget.phieuYeuCau != null &&
                      widget.phieuYeuCau.mucLucHoSos.isNotEmpty
                  ? "${totalListFile + _filesIndex.length} tệp"
                  : kNoFilesSelected)),
          IconButton(
              onPressed: () async {
                final result = await showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25.0)),
                    ),
                    context: context,
                    builder: (context) {
                      return EditFileSelected(
                        fileNew: _filesIndex,
                        fileOld: widget.phieuYeuCau.mucLucHoSos,
                      );
                    });
                if (result != null) {
                  setState(() {
                    _filesIndex = result;
                    lengthFilesIndex = _filesIndex.length;
                  });
                }
              },
              icon: Icon(
                  _filesIndex.isNotEmpty ? Icons.edit : Icons.remove_red_eye))
        ],
      ),
    );
  }

  Widget mucLucHoSoView() {
    print('view muc luc');
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      height: 48,
      decoration: BoxDecoration(
          border: Border.all(color: kGreyColors),
          borderRadius: BorderRadius.circular(defaultPadding - 2)),
      child: Row(
        children: [
          SizedBox(width: defaultPadding),
          Expanded(
              child: Text(
            widget.phieuYeuCau != null &&
                    widget.phieuYeuCau.mucLucHoSos.isNotEmpty
                ? "${widget.phieuYeuCau.mucLucHoSos.length} tệp"
                : kNoFilesSelected,
            style: GoogleFonts.roboto(),
          )),
          widget.phieuYeuCau.mucLucHoSos.isEmpty
              ? SizedBox.shrink()
              : IconButton(
                  onPressed: () async {
                    await showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(25.0)),
                        ),
                        context: context,
                        builder: (context) {
                          return ViewFilesPhieuYeuCau(
                            files: widget.phieuYeuCau.mucLucHoSos,
                          );
                        });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    size: 18,
                  ))
        ],
      ),
    );
  }

  Widget fileAttach(String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: smallSize,
                color: kLabelColors)),
        SizedBox(height: defaultPadding),
        isEnableInput
            ? widget.phieuYeuCau == null
                ? dinhKemCreateNew()
                : dinhKemEdit()
            : dinhKemOnlyView()
      ],
    );
  }

  Widget dinhKemOnlyView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      height: 48,
      decoration: BoxDecoration(
          border: Border.all(color: kGreyColors),
          borderRadius: BorderRadius.circular(defaultPadding - 2)),
      child: Row(
        children: [
          SizedBox(width: defaultPadding),
          Expanded(
              child: Text(
            widget.phieuYeuCau != null &&
                    widget.phieuYeuCau.fileDinhKems.isNotEmpty
                ? "${widget.phieuYeuCau.fileDinhKems.length} tệp"
                : kNoFilesSelected,
            style: GoogleFonts.roboto(),
          )),
          widget.phieuYeuCau.fileDinhKems.isEmpty
              ? SizedBox.shrink()
              : IconButton(
                  onPressed: () async {
                    await showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(25.0)),
                        ),
                        context: context,
                        builder: (context) {
                          return ViewFilesPhieuYeuCau(
                            files: widget.phieuYeuCau.fileDinhKems,
                          );
                        });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    size: 18,
                  ))
        ],
      ),
    );
  }

  Widget dinhKemEdit() {
    print('edit attach');
    int totalListFile =
        widget.phieuYeuCau != null ? widget.phieuYeuCau.fileDinhKems.length : 0;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      height: 48,
      decoration: BoxDecoration(
          border: Border.all(color: kGreyColors),
          borderRadius: BorderRadius.circular(defaultPadding - 2)),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              _openFilePicker(true);
            },
            child: Text(
              'Chọn tệp',
              style: TextStyle(color: kWhiteColors),
            ),
          ),
          SizedBox(width: defaultPadding),
          Expanded(
              child: Text(widget.phieuYeuCau != null &&
                      widget.phieuYeuCau.fileDinhKems.isNotEmpty
                  ? "${totalListFile + _filesAttach.length} tệp"
                  : kNoFilesSelected)),
          IconButton(
              onPressed: () async {
                final result = await showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25.0)),
                    ),
                    context: context,
                    builder: (context) {
                      return EditFileSelected(
                        fileNew: _filesAttach,
                        fileOld: widget.phieuYeuCau.fileDinhKems,
                      );
                    });
                if (result != null) {
                  setState(() {
                    _filesAttach = result;
                    lengthFilesAttach = _filesAttach.length;
                  });
                }
              },
              icon: Icon(
                  _filesAttach.isNotEmpty ? Icons.edit : Icons.remove_red_eye))
        ],
      ),
    );
  }

  Widget dinhKemCreateNew() {
    print('create new attach');
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      height: 48,
      decoration: BoxDecoration(
          border: Border.all(color: kGreyColors),
          borderRadius: BorderRadius.circular(defaultPadding - 2)),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              _openFilePicker(true);
            },
            child: Text(
              'Chọn tệp',
              style: TextStyle(color: kWhiteColors),
            ),
          ),
          SizedBox(width: defaultPadding),
          Expanded(
              child: Text(_filesAttach.isNotEmpty
                  ? "$lengthFilesAttach tệp"
                  : kNoFilesSelected)),
          _filesAttach.isEmpty
              ? SizedBox()
              : IconButton(
                  onPressed: () async {
                    final result = await showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(25.0)),
                        ),
                        context: context,
                        builder: (context) {
                          return EditFilesSelectedCreateNew(
                              files: _filesAttach);
                        });
                    if (result != null) {
                      setState(() {
                        _filesAttach = result;
                        lengthFilesAttach = _filesAttach.length;
                      });
                    }
                  },
                  icon: Icon(Icons.edit))
        ],
      ),
    );
  }

  Column dropdownDepositMethod(String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: smallSize,
                color: kLabelColors)),
        SizedBox(height: defaultPadding),
        Container(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: kGreyColors),
              borderRadius: BorderRadius.circular(defaultPadding - 2)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: depositsMethodValue,
              icon: Icon(Icons.keyboard_arrow_down),
              items: depositsMethod.map((String items) {
                return DropdownMenuItem<String>(
                    value: items,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(items,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: smallSize)),
                    ));
              }).toList(),
              onChanged: isEnableInput
                  ? (String newValue) {
                      setState(() {
                        depositsMethodValue = newValue;
                      });
                    }
                  : null,
            ),
          ),
        ),
      ],
    );
  }

  Column dropdownDepositSource(String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: smallSize,
                color: kLabelColors)),
        SizedBox(height: defaultPadding),
        Container(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: kGreyColors),
              borderRadius: BorderRadius.circular(defaultPadding - 2)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: depositsSourceValue,
              icon: Icon(Icons.keyboard_arrow_down),
              items: depositsSource.map((String items) {
                return DropdownMenuItem<String>(
                    value: items,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(items,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: smallSize)),
                    ));
              }).toList(),
              onChanged: isEnableInput
                  ? (String newValue) {
                      setState(() {
                        depositsSourceValue = newValue;
                      });
                    }
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
