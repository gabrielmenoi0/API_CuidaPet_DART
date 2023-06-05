import 'package:cuida_pet/applications/application_configs.dart';
import 'package:cuida_pet/configs/swagger_config.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_swagger_ui/shelf_swagger_ui.dart';

// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..get('/echo/<message>', _echoHandler);

Response _rootHandler(Request req) {
  return Response.ok('Hello, World!\n');
}

Response _echoHandler(Request request) {
  final message = request.params['message'];
  return Response.ok('$message\n');
}

void main(List<String> args) async {
  /// Swagger config
  final path = 'specs/swagger.yaml';
  final handler = SwaggerUI(path, title: 'Swagger Test');
  // Use any available host or container IP (usually `0.0.0.0`).
  // final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  // final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);
  final appConfig = ApplicationConfig();
  appConfig.loadConfigApplication();
  // For running in containers, we respect the PORT environment variable.
  // final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, "0.0.0.0", 8080);
  print('Server listening on port ${server.port}');
}
