import requests

URL = 'http://localhost:8088'
AUTH = ('admin', 'admin')
AUTH_PAYLOAD = {"password": "admin",
                "provider": "db",
                "refresh": "true",
                "username": "admin"}


def get_access_token():
    r1 = requests.post(URL + '/api/v1/security/login', json=AUTH_PAYLOAD)
    return r1.json()['access_token']


def get_something(url):
    r1 = requests.get(URL + '/api/v1' + url, headers={'Authorization': 'Bearer ' + get_access_token()})
    return r1.json()


def post_something(url, payload):
    r1 = requests.post(URL + '/api/v1' + url,
                       json=payload,
                       headers={'Authorization': 'Bearer ' + get_access_token()})
    return r1.json()


test = {
  "description": "string",
  "json_metadata": "string",
  "name": "string",
  "owner_id": 0,
  "owner_type": "User"
}


get_something('/dashboard/1/filtersets')
post_something('/dashboard/1/filtersets', payload=test)
