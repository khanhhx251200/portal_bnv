import 'dart:io';
import 'dart:math';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const kAppName = 'Portal BNV';
const kLogo = 'LOGO';
const kLogin = 'Đăng nhập';
const kDonHaveAnAccount = 'Chưa có tài khoản';
const kHaveAnAccount = 'Đã có tài khoản.';
const kRegistor = 'Đăng ký';
const kEmail = 'Email';
const kPassword = 'Mật khẩu';
const kPasswordCurrent = 'Mật khẩu hiện tại';
const kPasswordNew = 'Mật khẩu mới';
const kConfirmPassword = 'Xác nhận mật khẩu';
const kConfirmPasswordNew = 'Xác nhận mật khẩu mới';
const kForgotPassword = 'Quên mật khẩu';
const kPassport = 'Số CMND/ Hộ chiếu';
const kDateCreatePassport = 'Ngày cấp';
const kFullName = 'Họ và tên';
const kNumberPhone = 'Số điện thoại';
const kRequired = 'bắt buộc';
const kEnterprise = 'Doanh nghiệp';
const kCitizen = 'Công dân';
const kCodeEnterprise = 'Mã số ĐKKD, mã số thuế';
const kNameEnterprise = 'Tên doanh nghiệp';
const kAgreeTerm = 'Tôi đồng ý điều khoản sử dụng';
const kRememberPassword = 'Nhớ mật khẩu';
const kNotCharacterAndNumber = 'Không được có kí tự đặc biệt và số';
const kNotCharacter = 'Không được có kí tự đặc biệt';
const kLengthPassport = 'Chỉ nhập 9 hoặc 13 kí tự';
const kLengthPhone = 'Nhập đúng 10 kí tự';
const kLengthPassword = 'Nhập ít nhất 4 kí tự';
const kNotEmail = 'Nhập đúng định dạng email';
const kNotPhone = 'Nhập đúng số điện thoại';
const kConfirmPasswordFailed = 'Xác nhận mật khẩu không đúng';
const kCancel = 'Hủy';
const kClose = 'Đóng';
const kMatchPassError = 'Mật Khẩu không đúng';
const kEmailNull = 'Vui lòng nhập email';
const kPassNull = 'Vui lòng nhập mật khẩu';
const kShortPass = 'Mật khẩu quá ngắn';
const kConfirm = 'Xác nhận';
const kAgree = 'Đồng ý';
const kConfirmSignUp = 'Xác nhận đăng ký tài khoản';
const kEnterTheEmailAddressAssociatedWithYourAccount =
    'Nhập địa chỉ email được liên kết với tài khoản của bạn';
const kSend = 'Gửi';
const kChangePassword = 'Đổi mật khẩu';
const kUpdate = 'Cập nhật';
const kNewPassSameOldPass = 'Mật khẩu mới trùng với mật khẩu cũ';
const kAccountInformation = 'Thông tin tài khoản';
const kExit = 'Thoát ra';
const kStillStay = 'Vẫn ở lại';
const kAreYouSureExit = 'Bạn có chắc chắn muốn thoát ra không?';
const kAccountManage = 'Quản lý tài khoản';
const kDocumentAndFileManage = 'Quản lý hồ sơ, tài liệu';
const kDocumentManage = 'Quản lý tài liệu';
const kProcedureManage = 'Quản lý quy trình';
const kRequestManage = 'Quản lý yêu cầu';
const kPayManage = 'Quản lý thanh toán';
const kPasswordManage = 'Quản lý mật khẩu';
const kPostsManage = 'Quản lý bài viết';
const kFrequentlyAskedQuestions = 'Phản ánh kiến nghị';
const kLogout = 'Đăng xuất';
const kVerifyEmail = 'Xác minh Email đăng ký';
const kVerifyEmailNotMatch = 'Mã xác minh không đúng';
const kEnterTheCodeSentTo = 'Nhập mã được gửi đến ';
const kSixDigitCode = 'Mã gồm có 6 chữ số';
const kCaptchaNotMatch = 'Mã Captcha không đúng';
const kSearch = 'Tìm kiếm';
const kIconSearch = 'iconSearch';
const kHello = 'Xin chào!';
const kHowCanWeHelpYou = 'Chúng tôi có thể giúp gì được cho bạn?';
const kCommonProblems = 'Các vấn đề thường gặp';
const kAnswers = 'Giải đáp';
const kWasTheInformationUsefulToYou = 'Thông tin có hữu ích với bạn không?';
const kYes = 'Có';
const kNo = 'Không';
const kThankYouForComment = 'Cảm ơn bạn đã góp ý!';
const kSubmitAHelpRequest = 'Gửi phản ảnh kiến nghị';
const kYouNeedMoreHelp = 'Tiếp nhận phản ánh kiến nghị';
const kEnterTheInformationForSupport =
    'Vui lòng cho chúng tôi biết các thông tin sau để có thể hỗ trợ bạn tốt nhất:';
const kPleaseDescribeYourProblemInDetail =
    'Vui lòng mô tả chi tiết vấn đề của bạn';
const kContent = 'Nội dung';
const kAttachFiles = 'Tài liệu đính kèm';
const kTheContentHelpRequestBeMoreThan15Character =
    'Nội dung yêu cầu trợ giúp phải nhiều hơn 15 kí tự';
const kAddFile = 'Thêm tệp';
const kNotification = 'Thông báo';
const kSuccess = 'thành công';
const kPleaseVisitTheEmailAddressToConfirm =
    'Hãy truy cập vào địa chỉ Email đăng ký để xác nhận ';
const kAddNew = 'Thêm mới';
const kFiles = 'Hồ sơ';
const kDocuments = 'Tài liệu';
const kFileAndDocument = 'Hồ sơ và tài liệu';
const kSeeAll = 'Xem tất cả';
const kCollapse = 'Thu gọn';
const kProblemAbout = 'Phản ánh về việc';
const kProblemTitle = 'Tiêu đề phản ánh';
const kCity = 'Tỉnh/Thành phố';
const kDisctrict = 'Quận/Huyện';
const kWard = 'Phường/Xã';
const kAddress = 'Địa chỉ';
const kDetailAddress = 'số nhà, thôn xóm,...';
const kDataEmpty = 'Không có dữ liệu';
const kFormNotValidated = 'Vui lòng xem lại các trường nhập';
const kErrorServer = 'Lỗi hệ thống';
const String kTypeFileCantSupport = 'Loại tệp không được hỗ trợ';
const String kShare = 'Chia sẻ';
const String kRename = 'Đổi tên';
const String kRenameFile = 'Đổi tên tài liệu';
const String kName = 'Tên';
const String kPhieuYeuCauManage = 'Quản lý phiếu yêu cầu';
const String kKeyword = 'Từ khóa';
const String kPhieuYeuCauList = 'Danh sách phiếu yêu cầu';
const String kSendRequest = 'Gửi duyệt';
const String kEdit = 'Sửa';
const String kDeactive = 'Hủy kích hoạt';
const String kDelete = 'Xóa';
const String kNoFilesSelected = 'Không có tệp nào được chọn';
const String kBack = 'Quay lại';
const String kSave = 'Lưu';
const String kReset = 'Đặt lại';
const String kError = 'Lỗi';
const String kCreateNew = 'Tạo mới';
const String kPending = 'Chờ duyệt';
const String kAdditional = 'Bổ sung';
const String kRefuse = 'Từ chối';
const String kAccept = 'Đã duyệt';
const String kTOP = 'TOP';
const String kBOTTOM = 'BOTTOM';
const String kViewDetail = 'Xem chi tiết';
const String kDownload = 'Tải xuống';

final patternOnlyText = RegExp(
    r'([0-9\~\!\@\#\$\%\^\&\*\(\)\_\+\=\-\[\]\{\}\;\:\"\\\/\<\>\?\.\,])');
final patternCode =
    RegExp(r'([~\!\@\#\$\%\^\&\*\(\)\_\+\=\-\[\]\{\}\;\:\"\\\/\<\>\?\.\,])');
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

getFileSize(String filepath, int decimals) {
  var file = File(filepath);
  int bytes = file.lengthSync();
  if (bytes <= 0) return "0 B";
  const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
  var i = (log(bytes) / log(1024)).floor();
  String result =
      ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + ' ' + suffixes[i];
  return result;
}

getFileSizeByInt(int bytes, int decimals) {
  if (bytes <= 0) return "0 B";
  const suffixes = [ "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
  var i = (log(bytes) / log(1024)).floor();
  String result =
      ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + ' ' + suffixes[i];
  return result;
}

String convertDateDetail(int timeStamp) {
  final df = new DateFormat('dd/MM/yyyy kk:mm');
  var date = DateTime.fromMillisecondsSinceEpoch(timeStamp);
  return df.format(date).toString();
}

String convertDate(int timeStamp) {
  final df = new DateFormat('dd/MM/yyyy');
  var date = DateTime.fromMillisecondsSinceEpoch(timeStamp);
  return df.format(date).toString();
}

String getTypeFile(String path) {
  return path.split(".").last;
}

String getNameFile(String path) {
  return basename(path);
}

String TOKEN =
    'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbjEiLCJpYXQiOjE2MzM5NDA0NDEsImV4cCI6MTYzNjUzMjQ0MX0.lgaag0Q-k3j6eBOVdeRdSjUD-lqYH-x1IO0AGfgLILWhV1MsobPSrQlDzNXAn6mMHz8iirI-gqfoTXYYLj-JFQ';
