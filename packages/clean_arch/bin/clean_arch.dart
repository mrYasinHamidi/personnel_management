import 'dart:io';

String? entityName;
Map<String, String> entityProperties = {};
String featureName = '';
bool getRoute = false;
bool deleteRoute = false;
bool updateRoute = false;
bool createRoute = false;

void main(List<String> args) {
  if (args.isEmpty) return;
  featureName = args.first;

  String? route = args.last;

  stdout.write('Enter the entity name (for skip press \'s\') :');
  String? entity = stdin.readLineSync()?.trim();
  if (entity?.toLowerCase() != 's') {
    entityName = entity;
  }

  if (entityName != null) {
    bool readingProperties = true;
    while (readingProperties) {
      stdout.write('Enter the properties of $entityName Entity (if you finished press \'f\')');
      String? property = stdin.readLineSync()?.trim();
      if (property == null || property.isEmpty) continue;
      if (property.toLowerCase() == 'f') {
        readingProperties = false;
        continue;
      }
      final parts = property.split(' ');
      if (parts.length != 2) {
        stdout.write('Wrong input!!! (Ex:String name && List<int> numbers)');
        continue;
      }
      entityProperties[parts.first] = parts.last;
    }
  }

  if (entityName != null) {
    bool readingCrud = true;
    while (readingCrud) {
      stdout.write('Which CRUD operation you need ? (C for Create , R for Read , U for Update , D for Delete)');
      String? crud = stdin.readLineSync()?.trim();
      if (crud == null || crud.isEmpty) continue;
      if (!RegExp(r'^[CRUD]+$').hasMatch(crud)) continue;
      if (crud.contains('C')) createRoute = true;
      if (crud.contains('R')) getRoute = true;
      if (crud.contains('U')) updateRoute = true;
      if (crud.contains('D')) deleteRoute = true;
      readingCrud = false;
    }
  }

  final List<String> directories = [
    '$route/$featureName/data/data_sources',
    '$route/$featureName/data/data_sources/remote',
    '$route/$featureName/data/models',
    '$route/$featureName/data/repositories',
    '$route/$featureName/domain/entities',
    '$route/$featureName/domain/repositories',
    '$route/$featureName/domain/usecases',
    '$route/$featureName/domain/params',
    '$route/$featureName/presentation/manager',
    '$route/$featureName/presentation/pages',
    '$route/$featureName/presentation/widgets',
  ];

  final Map<String, String> files = {
    '$route/$featureName/data/data_sources/remote/${featureName}_endpoints.dart': _sampleEndpointsFileContent(),
    '$route/$featureName/data/data_sources/remote/${featureName}_remote_data_source.dart':
        _sampleRemoteDataSourceFileContent(),
    '$route/$featureName/data/data_sources/remote/${featureName}_remote_data_source_impl.dart':
        _sampleRemoteDataSourceImplFileContent(),
    '$route/$featureName/data/repositories/${featureName}_repository_impl.dart': _sampleRepositoryImplFileContent(),
    '$route/$featureName/domain/repositories/${featureName}_repository.dart': _sampleRepositoryFileContent(),
    '$route/$featureName/domain/entities/${featureName}_entity.dart': _sampleEntityFileContent(),
    '$route/$featureName/data/models/${featureName}_model.dart': _sampleModelFileContent(),
    '$route/$featureName/domain/params/${featureName}_param.dart': _sampleParamFileContent(),
    '$route/$featureName/domain/usecases/${featureName}_usecase.dart': _sampleUsecaseFileContent(),
    '$route/$featureName/presentation/pages/${featureName}_page.dart': _samplePageFileContent(),
    '$route/$featureName/domain/presentation/manager/${featureName}_controller.dart': _sampleControllerFileContent(),
  };

  for (final dir in directories) {
    Directory(dir).createSync(recursive: true);
    print('Created directory: $dir');
  }

  files.forEach((path, content) {
    final file = File(path);
    file.writeAsStringSync(content);
    print('Created file: $path');
  });

  print('Feature "$featureName" directories and base files created successfully.');
}

String _sampleUsecaseFileContent() {
  return '''

class ${featureName}UseCase extends UseCase<${featureName}Entity, ${featureName}Param> {
  final ${featureName}Repository repository;

  const ${featureName}UseCase({required this.repository});

  @override
  FutureOr<Either<Failure, ${featureName}Entity>> call(${featureName}Param param) => repository.sampleRequest(param);
}

''';
}

String _sampleControllerFileContent() {
  return '''
import 'package:get/get.dart';

class ${featureName}Controller extends GetxController {}


''';
}

String _samplePageFileContent() {
  return '''

class ${featureName}Page extends GetView<${featureName}Controller> {
  const ${featureName}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


''';
}

String snakeToUpperCamelCase(String snakeCaseString, String projectName) {
  // Split the snake_case string into words
  List<String> words = snakeCaseString.split('_');

  // Capitalize the first letter of each word
  for (int i = 0; i < words.length; i++) {
    words[i] = words[i][0].toUpperCase() + words[i].substring(1);
  }

  // Join the words back together
  return words.join('');
}

String _sampleParamFileContent() {
  return '''
part '$featureName.g.dart';

@JsonSerializable()
class ${featureName}Param {

  @JsonKey(name: 'sampleField')
  final String sampleField;

  const ${featureName}Param({
    required this.sampleField,
  });

  factory ${featureName}Param.fromJson(Map<String, dynamic> json) => _\$${featureName}ParamFromJson(json);

  Map<String, dynamic> toJson() => _\$${featureName}ParamToJson(this);
}

''';
}

String _sampleRemoteDataSourceFileContent() {
  return '''

abstract class ${featureName}RemoteDataSource extends RemoteDataSource {
  const ${featureName}RemoteDataSource({required super.request});

  Future<ResponseModel> sampleRequest(${featureName}Param param);
}
''';
}

String _sampleEndpointsFileContent() {
  return '''
part of '${featureName}_remote_data_source_impl.dart';
class ${featureName}Endpoints {
  static const String sampleEndpoint = '/api/v1/$featureName';
}

''';
}

String _sampleModelFileContent() {
  return '''
part '${featureName}_model.g.dart';

@JsonSerializable()
class ${featureName}Model {
  final String sampleField;

  const ${featureName}Model({
    required this.sampleField,
  });

  factory ${featureName}Model.fromEntity(${featureName}Entity entity) => ${featureName}Model(
        sampleField: entity.sampleField,
      );

  factory ${featureName}Model.fromJson(Map<String, dynamic> json) => _\$${featureName}ModelFromJson(json);

  Map<String, dynamic> toJson() => _\$${featureName}ModelToJson(this);

  ${featureName}Entity toEntity() {
    return ${featureName}Entity(
      sampleField: sampleField,
    );
  }
}
''';
}

String _sampleEntityFileContent() {
  return '''
class ${entityName}Entity extends Equatable {
  
  ${entityProperties.keys.map((i) => 'final ${entityProperties[i]} $i;').join('\n')}

  const ${entityName}Entity({
    ${entityProperties.keys.map((i) => 'required this.$i,').join('\n')}
  });

  @override
  List<Object?> get props => [
    ${entityProperties.keys.join(',\n')}
  ];
}
''';
}

String _sampleRemoteDataSourceImplFileContent() {
  return '''
part '${featureName}_endpoints.dart';

class ${featureName}RemoteDataSourceImpl extends ${featureName}RemoteDataSource {
  const ${featureName}RemoteDataSourceImpl({required super.request});
  
  @override
  Future<ResponseModel> sampleRequest(${featureName}Param param) async {
    final res = await request.post(
      ${featureName}Endpoints.sampleEndpoint,
      data: param.toJson(),
    );
    return ResponseModel.fromJson(res.data);
  }
  
}
''';
}

String _sampleRepositoryFileContent() {
  return '''

abstract class ${featureName}Repository extends Repository {
  const ${featureName}Repository();

  Future<Either<Failure, ${featureName}Entity>> sampleRequest(${featureName}Param param);
}
''';
}

String _sampleRepositoryImplFileContent() {
  return '''

class ${featureName}RepositoryImpl extends ${featureName}Repository {
  final ${featureName}RemoteDataSource remoteDataSource;

  const ${featureName}RepositoryImpl({
    required this.remoteDataSource,
  });
  
  @override
  Future<Either<Failure, ${featureName}Entity>> sampleRequest(${featureName}Param param) async {
    return perform(() async {
      final response = await remoteDataSource.sampleRequest(param);

      if (response.statusCode != 200) {
        throw ServerException(response.message);
      }

      return ${featureName}Model.fromJson(response.data).toEntity();
    });
  }
}
''';
}
