from flask import Flask, request
from flask_restful import Resource, Api
from flask_swagger_ui import get_swaggerui_blueprint
import mysql.connector
import json
from flask_cors import CORS


app = Flask(__name__)
api = Api(app)
CORS(app)

# Swagger configuration
SWAGGER_URL = '/api/docs'
API_URL = '/static/swagger.json'
swaggerui_blueprint = get_swaggerui_blueprint(SWAGGER_URL, API_URL)
app.register_blueprint(swaggerui_blueprint, url_prefix=SWAGGER_URL)

# Define a function to read SQL server credentials from the config file
def get_sql_credentials():
    with open('config.json', 'r') as config_file:
        config_data = json.load(config_file)
        return config_data

# Define a resource for updating data in SQL server
class UpdateData(Resource):
    def post(self):
        try:
            data = request.get_json()
            new_value = data.get('new_value')

            sql_credentials = get_sql_credentials()
            conn = mysql.connector.connect(**sql_credentials)
            cursor = conn.cursor()

            query = "UPDATE your_table SET your_column = %s WHERE id = %s"
            cursor.execute(query, (new_value, data['id']))

            conn.commit()
            conn.close()
            return {"message": "Data updated successfully"}, 200
        except Exception as e:
            return {"error": str(e)}, 500

api.add_resource(UpdateData, '/update-data')

if __name__ == '__main__':
    app.run(debug=True)
