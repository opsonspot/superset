from flask import Flask, request
from flask_restful import Resource, Api
from flasgger import Swagger
import json
import mysql.connector
from flask_cors import CORS

app = Flask(__name__)
CORS(app)
api = Api(app)
swagger = Swagger(app)

# Read SQL server credentials from a config file
def get_db_config():
    with open("static/db_config.json", "r") as config_file:
        db_config = json.load(config_file)
    return db_config

# Function to update data in SQL Server
def update_sql_server(table_name, key_name, key_value, column_to_update, new_value):
    db_config = get_db_config()

    try:
        conn = mysql.connector.connect(
            host=db_config['host'],
            user=db_config['user'],
            password=db_config['password'],
            database=db_config['database']
        )

        cursor = conn.cursor()

        # Build the SQL query
        query = f"UPDATE {table_name} SET {column_to_update} = %s WHERE {key_name} = %s"
        cursor.execute(query, (new_value, key_value))
        conn.commit()
        cursor.close()
        conn.close()
        return "Data updated successfully."

    except Exception as e:
        return f"Error updating data: {str(e)}"

class UpdateData(Resource):
    def post(self):
        """
        Update a data point in SQL Server.
        ---
        parameters:
          - name: body
            in: body
            required: true
            schema:
              id: update_data
              required:
                - table_name
                - key_name
                - key_value
                - column_to_update
                - new_value
              properties:
                table_name:
                  type: string
                  description: Name of the table to update data in.
                key_name:
                  type: string
                  description: Name of the key column.
                key_value:
                  type: string
                  description: Value of the key to identify the row to update.
                column_to_update:
                  type: string
                  description: Name of the column to update.
                new_value:
                  type: string
                  description: New value to set in the specified column.
        responses:
          200:
            description: Data updated successfully.
          400:
            description: Error updating data.
        """
        data = request.get_json()
        table_name = data['table_name']
        key_name = data['key_name']
        key_value = data['key_value']
        column_to_update = data['column_to_update']
        new_value = data['new_value']

        result = update_sql_server(table_name, key_name, key_value, column_to_update, new_value)
        return {"message": result}

# Add resource for updating data
api.add_resource(UpdateData, '/update-data')

if __name__ == '__main__':
    app.run(debug=True)
