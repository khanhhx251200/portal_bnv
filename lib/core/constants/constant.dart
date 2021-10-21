class Constant{
  static final API = 'http://192.168.3.14:8080/';
  static final API_AUTH = 'http://192.168.3.14:8080/o/dangky/register';

  //Key
  static final KEY_REMEMBER = 'key_remember';
  static final KEY_KEEP_LOGIN = 'key_keep_login';
  static final KEY_USERNAME = 'key_username';
  static final KEY_PASSWORD = 'key_password';
  static final LOADING = 'LOADING';
  static final SIGN_IN = 'SIGN_IN';
  static final UPDATE_ACCOUNT = 'UPDATE_ACCOUNT';

  //Type file
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

  //api
  static const String REGISTER = 'o/dangky/register';
  static const String GET_ALL_DOCUMENT_AND_FILE = 'api/document/getAllDocumentByPermission';
  static const String GET_PROPERTIES = 'api/alfresco/getProperties';
  static const String GET_FILE_VERSION = 'api/file-version/getListByNodeId';
  static const GET_FILE_VIEW_DOWNLOAD = 'api/alfresco/download-as-zip-file';
  static const GET_FILE_VIEW_PREVIEW = 'api/alfresco/previewDocument';
  static const GET_ALL_PHIEU_YEU_CAU = 'o/phieu/search';
  static const CREATE_AND_UPDATE_PHIEU_YEU_CAU = 'o/phieu/addAndUpdate';
  static const DELETE_PHIEU_YEU_CAU = 'o/phieu/delete';
  static const DETAIL_PHIEU_YEU_CAU = 'o/phieu/detail';
  static const CHANGE_STATUS_PHIEU_YEU_CAU = 'o/phieu/changeStatus';
  static const DELETE_FILE = 'deleteFile';

  static const List<String> fileTypeList = [
    TYPE_PDF, TYPE_DOCX, TYPE_XLSX, TYPE_PNG, TYPE_VIDEO, TYPE_FOLDER
  ];
  static const List<String> fileNameList = [
    "PDF", "Tài liệu", "Bảng tính", 'Ảnh và hình ảnh', "Video", "Thư mục"
  ];
}