import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_swagger_ui/shelf_swagger_ui.dart';

class SwaggerCoonfig {
  config() {
    final path = 'specs/swagger.yaml';
    final handler = SwaggerUI(path, title: 'API Dart');
    return handler;
  }
}
