from flask import Flask, request, jsonify
from flask_restful import Resource, Api
from flasgger import Swagger
import mysql.connector
import os
import re
from flask_cors import CORS
import pyodbc
from typing import Union, List, Dict, Any

app = Flask(__name__)
api = Api(app)
swagger = Swagger(app)
CORS(app)


def run_sql_query(
    query: str, db_type: str
) -> Union[List[Dict[str, Any]], Dict[str, str]]:
    """
    Run a SQL query on the specified database type and return results or status.

    Args:
        query (str): The SQL query to be executed.
        db_type (str): The type of database, 'mysql' or 'mssql'.

    Returns:
        Union[List[Dict[str, Any]], Dict[str, str]]: Query results or a status message.
    """
    try:
        if db_type.lower() == "mysql":
            host = os.environ.get("host", "127.0.0.1")
            user = os.environ.get("user", "root")
            password = os.environ.get("password", "")
            db_name = os.environ.get("database", "test")
            port = os.environ.get("port", "3306")

            conn = mysql.connector.connect(
                host=host, user=user, password=password, database=db_name, port=port
            )
        elif db_type.lower() == "mssql":
            host = os.environ.get("mssql_host", "127.0.0.1")
            user = os.environ.get("mssql_user", "sa")
            password = os.environ.get("mssql_password", "yourStrong23")
            db_name = os.environ.get("mssql_database", "master")
            port = os.environ.get("mssql_port", "1433")

            conn = pyodbc.connect(
                f"DRIVER={{ODBC Driver 18 for SQL Server}};SERVER={host};DATABASE={db_name};UID={user};PWD={password};PORT={port};TrustServerCertificate=yes;"
            )
        else:
            return {"Query Status": "Invalid database type specified."}

        cursor = conn.cursor(buffered=True)
        query_type = query.split(" ", 1)[0].strip().upper()

        print("query is " + query)
        print("query_type is " + query_type)

        if query_type in ["SELECT", "WITH"]:
            cursor.execute(query)
            rows = cursor.fetchall()
            columns = [column[0] for column in cursor.description]
            results = [dict(zip(columns, row)) for row in rows]
            return results
        else:
            cursor.execute(query)
            conn.commit()
            return {"Query Run Status": f"Successfully executed {query_type} query."}

    except (mysql.connector.Error, pyodbc.Error) as e:
        return {"Query Run Status": f"Query run failed. Error: {str(e)}"}
    finally:
        if "conn" in locals():
            cursor.close()
            conn.close()


class RunQuery(Resource):
    def post(self) -> Any:
        """
        Run an SQL query in SQL Server and return results as JSON.
        ---
        parameters:
          - name: body
            in: body
            required: true
            schema:
              id: sql_query
              required:
                - query
                - db_type
              properties:
                query:
                  type: string
                  description: The SQL query to be executed.
                db_type:
                  type: string
                  description: The database type ('mysql' or 'mssql').
        responses:
          200:
            description: SQL query executed successfully.
          400:
            description: Error executing the SQL query.
        """
        data = request.get_json()
        query = data.get("query")
        db_type = data.get("db_type")

        if not query or not db_type:
            return {"error": "Query or Database type not provided."}, 400

        if db_type.lower() not in ["mysql", "mssql"]:
            return {
                "error": "Invalid database type. Only 'mysql' and 'mssql' are supported."
            }, 400

        if query[-1] != ";":
            query += ";"

        sql_pattern = r"^(SELECT|INSERT|UPDATE|DELETE|CREATE|DROP|ALTER|GRANT|REVOKE|USE|BEGIN|COMMIT|ROLLBACK|EXPLAIN|DESCRIBE|SHOW|SET|CALL|MERGE|WITH|DECLARE|FETCH|REPLACE|SAVEPOINT|LOCK|UNLOCK)\s"

        if re.match(sql_pattern, query, re.IGNORECASE):
            result = run_sql_query(query, db_type)
            return jsonify(result)
        else:
            return {"error": "Query format is incorrect. Please recheck."}, 400


# Add resource for running SQL queries
api.add_resource(RunQuery, "/run-query")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
