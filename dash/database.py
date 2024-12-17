import mysql.connector
import pandas as pd
from constants import (HOST_IP,
                       HOST_USERNAME,
                       HOST_DATABASE,
                       HOST_PASSWORD)


class Event:
    def __init__(self):
        self.connection = mysql.connector.connect(user=HOST_USERNAME,
                                                  password=HOST_PASSWORD,
                                                  host=HOST_IP,
                                                  database=HOST_DATABASE,
                                                  auth_plugin='mysql_native_password')
        self.dataframe = pd.read_sql("select * from events", self.connection)
        self.connection.close()

    def get(self, event_id):
        return self.dataframe.loc[self.dataframe.Eventid == event_id]

    def write(self, event_id, column_name, updates):
        with mysql.connector.connect(user=HOST_USERNAME,
                                     password=HOST_PASSWORD,
                                     host=HOST_IP,
                                     database=HOST_DATABASE,
                                     auth_plugin='mysql_native_password') as connection:
            cursor = connection.cursor()
            cursor.execute("UPDATE events SET {} = %s WHERE Eventid = %s".format(column_name),
                           (updates, event_id,))
            connection.commit()
            cursor.close()

    def status(self, event_id):
        return self.get(event_id).Status.values[0]

    def comments(self, event_id):
        return self.get(event_id).Comments.values[0]

    def severity(self, event_id):
        return self.get(event_id).Severity.values[0]

    def location(self, event_id):
        return self.get(event_id).Location.values[0]

    def datetime(self, event_id):
        return self.get(event_id).Hours.values[0]

    def expert(self, event_id):
        return self.get(event_id).Expert_Remedy.values[0]
