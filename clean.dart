import 'dart:io';

void main() {
  // Get feature name from user input
  stdout.write('Enter the feature name: ');
  String? featureName = stdin.readLineSync()?.trim();
  if (featureName == null || featureName.isEmpty) {
    print('Feature name is required. Exiting.');
    return;
  }

  // Get route from user input
  stdout.write('Enter the route where the feature should be created (e.g., lib/features): ');
  String? route = stdin.readLineSync()?.trim();

  if (route == null || route.isEmpty) {
    print('Route is required. Exiting.');
    return;
  }

  String projectName = Directory.current.path.split('/').last;

  String featureName1 = snakeToUpperCamelCase(featureName, projectName);

  // Define the directories to create for the feature
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

  // Define the files to create with some basic content for the feature
  final Map<String, String> files = {
    '$route/$featureName/data/data_sources/remote/${featureName}_endpoints.dart':
        _sampleEndpointsFileContent(featureName1, projectName),
    '$route/$featureName/data/data_sources/remote/${featureName}_remote_data_source.dart':
        _sampleRemoteDataSourceFileContent(featureName1, projectName),
    '$route/$featureName/data/data_sources/remote/${featureName}_remote_data_source_impl.dart':
        _sampleRemoteDataSourceImplFileContent(featureName1, projectName),
    '$route/$featureName/data/repositories/${featureName}_repository_impl.dart':
        _sampleRepositoryImplFileContent(featureName1, projectName),
    '$route/$featureName/domain/repositories/${featureName}_repository.dart':
        _sampleRepositoryFileContent(featureName1, projectName),
    '$route/$featureName/domain/entities/${featureName}_entity.dart':
        _sampleEntityFileContent(featureName1, projectName),
    '$route/$featureName/data/models/${featureName}_model.dart': _sampleModelFileContent(featureName1, projectName),
    '$route/$featureName/domain/params/${featureName}_param.dart': _sampleParamFileContent(featureName1, projectName),
    '$route/$featureName/domain/usecases/${featureName}_usecase.dart':
        _sampleUsecaseFileContent(featureName1, projectName),
  };

  // Create directories
  for (final dir in directories) {
    Directory(dir).createSync(recursive: true);
    print('Created directory: $dir');
  }

  // Create files with content
  files.forEach((path, content) {
    final file = File(path);
    file.writeAsStringSync(content);
    print('Created file: $path');
  });

  print('Feature "$featureName" directories and base files created successfully.');
}

String _sampleUsecaseFileContent(String featureName, String projectName) {
  return '''

class ${featureName}UseCase extends UseCase<${featureName}Entity, ${featureName}Param> {
  final ${featureName}Repository repository;

  const ${featureName}UseCase({required this.repository});

  @override
  FutureOr<Either<Failure, ${featureName}Entity>> call(${featureName}Param param) => repository.sampleRequest(param);
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

String _sampleParamFileContent(String featureName, String projectName) {
  return '''
part '${featureName}.g.dart';

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

String _sampleRemoteDataSourceFileContent(String featureName, String projectName) {
  return '''

abstract class ${featureName}RemoteDataSource extends RemoteDataSource {
  const ${featureName}RemoteDataSource({required super.request});

  Future<ResponseModel> sampleRequest(${featureName}Param param);
}
''';
}

String _sampleEndpointsFileContent(String featureName, String projectName) {
  return '''
part of '${featureName}_remote_data_source_impl.dart';
class ${featureName}Endpoints {
  static const String sampleEndpoint = '/api/v1/$featureName';
}

''';
}

String _sampleModelFileContent(String featureName, String projectName) {
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

String _sampleEntityFileContent(String featureName, String projectName) {
  return '''

class ${featureName}Entity extends Equatable {
  
  final String sampleField;

  const ${featureName}Entity({
    required this.sampleField,
  });

  @override
  List<Object?> get props => [
        sampleField,
      ];
  
}
''';
}

String _sampleRemoteDataSourceImplFileContent(String featureName, String projectName) {
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

String _sampleRepositoryFileContent(String featureName, String projectName) {
  return '''

abstract class ${featureName}Repository extends Repository {
  const ${featureName}Repository();

  Future<Either<Failure, ${featureName}Entity>> sampleRequest(${featureName}Param param);
}
''';
}

String _sampleRepositoryImplFileContent(String featureName, String projectName) {
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
