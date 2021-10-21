import 'package:app_mobile/core/constants/constant.dart';
import 'package:app_mobile/core/rest/api_provider.dart';

class FolderAndFileApi {
  final ApiProvider _apiProvider = ApiProvider.apiProvider;

  Future<dynamic> getAllDocumentByPermission(
      String parentNodeId, int typeUser, int page, bool isSort) async {
    try {
      final response = await _apiProvider.get(Constant
              .GET_ALL_DOCUMENT_AND_FILE +
          "?parentNodeId=$parentNodeId&typeUser=$typeUser&page=$page&sortBy=&direction=${isSort ? "ASC" : "DESC"}&isHiden=false");
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> getProperties(String nodeId) async {
    try{
      final response = await _apiProvider.get(Constant.GET_PROPERTIES+ "?ticKet=&nodeId=$nodeId");
      return response;
    }catch (e){
      throw e;
    }
  }

  Future<dynamic> getFileVersions(String nodeId) async {
    try{
      final response = await _apiProvider.get(Constant.GET_FILE_VERSION+ "?nodeId=$nodeId");
      return response;
    }catch (e){
      throw e;
    }
  }

  Future<dynamic> getFileViewbyPreview(String nodeId) async {
    try{
      final response = await _apiProvider.get(Constant.GET_FILE_VIEW_PREVIEW+ "?ticKet=TICKET_6d4f20953ee5d01747ac2e04fee4b8a691a7fe86&nodeId=$nodeId&type=pdf");
      return response;
    }catch (e){
      throw e;
    }
  }

  Future<dynamic> getFileViewbyDownload(String nodeId) async {
    try{
      final response = await _apiProvider.get(Constant.GET_FILE_VIEW_DOWNLOAD+ "?ticKet=TICKET_6d4f20953ee5d01747ac2e04fee4b8a691a7fe86&downloadId=$nodeId&type=pdf");
      return response;
    }catch (e){
      throw e;
    }
  }
}
