// import 'package:dio/dio.dart';
//
// class Request {
//   final Dio _dio = Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/3/'));
//   final String _key = '5ac2a4d5e1a55902993e0b35793c149b';
//
//   // final String _token = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1YWMyYTRkNWUxYTU1OTAyOTkzZTBiMzU3OTNjMTQ5YiIsInN1YiI6IjYyZWFjNTVkNDgzMzNhMDA1OWZiMjBiOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.4mE_w-em27mBo2y5OfWC9XpD5C6DSY0djGr0YAZGxHI';
//
//   Future<Response> get(
//     String path, {
//     Map<String, dynamic>? queryParameters,
//   }) =>
//       _dio.get(
//         path,
//         queryParameters: (queryParameters ?? {})..['api_key'] = _key,
//       );
//
//   Future<Response> post(
//     String path, {
//     Map<String, dynamic>? queryParameters,
//     data,
//   }) =>
//       _dio.post(
//         path,
//         queryParameters: (queryParameters ?? {})..['api_key'] = _key,
//         data: data,
//       );
//
//   Future<Response> delete(
//     String path, {
//     Map<String, dynamic>? queryParameters,
//     data,
//   }) =>
//       _dio.delete(
//         path,
//         queryParameters: (queryParameters ?? {})..['api_key'] = _key,
//         data: data,
//       );
// }
