class Constant{
  static final KEY_REMEMBER = 'key_remember';
  static final KEY_KEEP_LOGIN = 'key_keep_login';
  static final KEY_USERNAME = 'key_username';
  static final KEY_PASSWORD = 'key_password';
  static final LOADING = 'LOADING';
  static final SIGN_IN = 'SIGN_IN';
  static final UPDATE_ACCOUNT = 'UPDATE_ACCOUNT';

  static const String TYPE_DOCX = 'docx';
  static const String TYPE_DOC = 'doc';
  static const String TYPE_PDF = 'pdf';
  static const String TYPE_JPG = 'jpg';
  static const String TYPE_PNG = 'png';
  static const String TYPE_JPEG = 'jpeg';
  static const String TYPE_SHEETS = 'sheets';
  static const String TYPE_VIDEO = 'mp4';
  static const String TYPE_XLSX = 'xlsx';
  static const String TYPE_XLS = 'xls';
  static const String TYPE_FOLDER = 'folder';

  static const List<String> fileTypeList = [
    TYPE_PDF, TYPE_DOCX, TYPE_XLSX, TYPE_PNG, TYPE_VIDEO, TYPE_FOLDER
  ];
  static const List<String> fileNameList = [
    "PDF", "Tài liệu", "Bảng tính", 'Ảnh và hình ảnh', "Video", "Thư mục"
  ];
}