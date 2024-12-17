import 'dart:io';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';

/// Enum for API Request Type
enum RequestType { get, post, patch, delete, put, upload }

/// API Failure Class
class ApiFailure {
  final String message;
  ApiFailure(this.message);
}

/// Global API Request Class with Working Interceptors
class GlobalApiRequest<T> extends GetConnect {


  @override
  void onInit() {
    httpClient.baseUrl = 'https://your-api-base-url.com'; // Set Base URL


    // Add global request interceptors
    httpClient.addRequestModifier<dynamic>((request) {
      print('🟢 Request:');
      print('Method: ${request.method}');
      print('URL: ${request.url}');
      print('Headers: ${request.headers}');
      // if (request.bodyBytes != null) print('Body: ${request.body}');
      return request;
    });

    // Add global response interceptors
    httpClient.addResponseModifier<dynamic>((request, response) {
      print('🟡 Response:');
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.bodyString}');
      return response;
    });

    // Add authenticator for token handling (Optional)
    httpClient.addAuthenticator<dynamic>((request) async {
      print('🔄 Re-authenticating...');
      // Simulate token refresh logic here
      request.headers['Authorization'] = 'Bearer refreshed_token_here';
      return request;
    });

    super.onInit();
  }

  Future<Either<ApiFailure, T>> apiRequest({
    required RequestType type,
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
    T Function(Map<String, dynamic>)? fromJson,
    File? file,
    String? fileFieldName,
  }) async {
    try {
      Response response;

      if (type == RequestType.upload && file != null && fileFieldName != null) {
        final form = FormData({
          fileFieldName: MultipartFile(file, filename: file.path.split('/').last),
          if (body != null) ...body,
        });
        response = await post(url, form, query: queryParams);
      } else {
        switch (type) {
          case RequestType.get:
            response = await request(url,'get', query: queryParams);
            // response = await get(url, query: queryParams);
            break;
          case RequestType.post:
            response = await post(url, body, query: queryParams);
            break;
          case RequestType.patch:
            response = await patch(url, body, query: queryParams);
            break;
          case RequestType.put:
            response = await put(url, body, query: queryParams);
            break;
          case RequestType.delete:
            response = await delete(url, query: queryParams);
            break;
          default:
            throw Exception("Unsupported request type for this method");
        }
      }

      if (response.status.hasError) {
        return Left(ApiFailure(response.statusText ?? "Unknown error"));
      }

      if (fromJson != null && response.body is Map<String, dynamic>) {
        return Right(fromJson(response.body));
      } else {
        return Right(response.body as T);
      }
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }
}