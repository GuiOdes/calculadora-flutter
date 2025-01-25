// import 'dart:io';
//
// import 'package:app/components/Users.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
// import 'package:package_info_plus/package_info_plus.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
// import 'package:mockito/annotations.dart';
// import 'chat_test.mocks.dart';
//
// @GenerateMocks([
//   ParseObject,
//   ParseResponse
// ], customMocks: [
//   MockSpec<ParseObject>(as: #MockGeneratedParseObject),
//   MockSpec<ParseResponse>(as: #MockGeneratedParseResponse),
// ])
// class MockGeneratedParseObject extends Mock implements ParseObject {}
//
// class TestHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
//   }
// }
//
// class FakePathProviderPlatform extends PathProviderPlatform {
//   @override
//   Future<String?> getTemporaryPath() async => '.';
//
//   @override
//   Future<String?> getApplicationDocumentsPath() async => '.';
//
//   @override
//   Future<String?> getExternalStoragePath() async => '.';
//
//   @override
//   Future<List<String>?> getExternalCachePaths() async => ['.'];
//
//   @override
//   Future<List<String>?> getExternalStoragePaths({StorageDirectory? type}) async => ['.'];
//
//   @override
//   Future<String?> getLibraryPath() async => '.';
// }
//
// void main() {
//   late Chat chatService;
//   late MockGeneratedParseObject mockChat;
//   late MockGeneratedParseResponse mockParseResponse;
//
//   TestWidgetsFlutterBinding.ensureInitialized();
//
//   PathProviderPlatform.instance = FakePathProviderPlatform();
//
//   setUpAll(() async {
//     SharedPreferences.setMockInitialValues({});
//
//     const mockAppName = 'Mock App';
//     const mockPackageName = 'com.example.mockapp';
//     const mockVersion = '1.0.0';
//     const mockBuildNumber = '1';
//
//     PackageInfo.setMockInitialValues(
//       appName: mockAppName,
//       packageName: mockPackageName,
//       version: mockVersion,
//       buildNumber: mockBuildNumber,
//       buildSignature: 'test',
//     );
//
//     const keyApplicationId = 'QdZED23aJMjxCSyFLgNucNmsq4lCrhJTBOFfY10e';
//     const keyClientKey = 'z3nz8OnTPVqECG5gXQuWRa8xUiOEhJZYOGB8XoGQ';
//     const keyParseServerUrl = 'https://parseapi.back4app.com';
//
//     await Parse().initialize(
//       keyApplicationId,
//       keyParseServerUrl,
//       clientKey: keyClientKey,
//       autoSendSessionId: true,
//       debug: true,
//     );
//   });
//
//   setUp(() {
//     chatService = Chat();
//     mockChat = MockGeneratedParseObject();
//     mockParseResponse = MockGeneratedParseResponse();
//
//     when(mockParseResponse.success).thenReturn(true);
//     when(mockParseResponse.results).thenReturn([mockChat]);
//
//     when(mockChat.get<List<dynamic>>('users')).thenReturn([]);
//     when(mockChat.save()).thenAnswer((_) async => mockParseResponse);
//
//     when(mockChat.set('users', any)).thenReturn(mockChat);
//     when(mockChat.set('messages', any)).thenReturn(mockChat);
//   });
//
//   group('Chat Service Tests', ()
//   {
//     test('Check and Save User - Adds New User', () async {
//       final ParseResponse response = MockGeneratedParseResponse();
//       when(response.success).thenReturn(true);
//       when(mockChat.save()).thenAnswer((_) async => response);
//
//       final ParseObject? result = await chatService.checkAndSaveUser(
//           'test_user');
//       expect(result, isNotNull);
//     });
//
//     test('Check and Save User - User Already Exists', () async {
//       final ParseResponse response = MockGeneratedParseResponse();
//       when(response.success).thenReturn(true);
//       when(mockChat.save()).thenAnswer((_) async => response);
//       when(mockChat.get<List<dynamic>>('users')).thenReturn(
//           [{'username': 'test_user'}]);
//
//       await chatService.checkAndSaveUser('test_user');
//       final ParseObject? result = await chatService.checkAndSaveUser(
//           'test_user');
//       expect(result, isNull);
//     });
//
//     test('Get or Create Chat - Chat Exists', () async {
//       final ParseObject result = await chatService.getOrCreateChat();
//       expect(result, isNotNull);
//     });
//
//     test('Get or Create Chat - Chat Does Not Exist', () async {
//       when(mockParseResponse.results).thenReturn([]);
//       final ParseObject result = await chatService.getOrCreateChat();
//       expect(result, isNotNull);
//     });
//
//     test('Save Chat - Success', () async {
//       final ParseResponse response = MockGeneratedParseResponse();
//       when(response.success).thenReturn(true);
//       when(mockChat.save()).thenAnswer((_) async => response);
//
//       final chat = await chatService.getOrCreateChat();
//       chat.set('testKey', 'testValue');
//       final ParseObject? result = await chatService.saveChat(chat);
//       expect(result, isNotNull);
//     });
//   });
// }
