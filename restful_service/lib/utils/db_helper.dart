import 'dart:async';
import 'package:sqljocky5/sqljocky.dart';

class DbHelper {
  factory DbHelper() {
    return _singleton;
  }

  DbHelper._internal() {
    print("Opening mysql connection");

    final connectionSettings = ConnectionSettings(
      user: "root",
      password: "dart_jaguar",
      host: "localhost",
      port: 3306,
      db: "example",
    );
    MySqlConnection.connect(connectionSettings);
  }

  static final DbHelper _singleton = DbHelper._internal();
  MySqlConnection mySqlConnection;

  void closeConnection() {
    print("Closing connection");
    mySqlConnection.close();
  }

  Future<Results> runRawQuery(String query) async {
    final Results results = await mySqlConnection
        .execute(query);
    return results;
  }
}
