
import 'package:postgres/postgres.dart';

class Database {
  Future<List<T>> query<T>(String queryStr, T Function(List<dynamic>) fromMap, [List<dynamic> parameters = const []]) async {
    List<T> result =[];
    try {
      Connection connection = await Connection.open(
        Endpoint(
          host: '',
          database: 'Momental',
          username: 'Momental',
          password: '',
        ),
        settings: ConnectionSettings(sslMode: SslMode.verifyFull),
      );
      
      print('has connection!');

      await connection.execute('SET search_path TO "momental"');

      var queryResult = await connection.execute(
        queryStr,
        parameters: parameters
      );

      if (queryStr.trim().toLowerCase().startsWith("select")) {
        for (var row in queryResult) {
          result.add(fromMap(row));
        }
      }
      connection.close();
    } catch (e) {
      throw e;
    }
    return result;
  }
}