import os
import requests
from requests.auth import HTTPBasicAuth
from requests.adapters import HTTPAdapter
from requests.adapters import Retry


class ApiBase:
    retries = Retry(total=5, backoff_factor=1, status_forcelist=[502, 503, 504])
    request_session = requests.Session()
    request_session.mount('http://', HTTPAdapter(max_retries=retries))
    request_session.mount('https://', HTTPAdapter(max_retries=retries))

    def __init__(self, api_base_url=None, path=None, api_version=None):
        self.api_base_url = api_base_url
        self.path = path
        self.api_version = api_version
        self.personal_access_token = self.get_token()

    def get_token(self):
        personal_access_token = os.getenv('PERSONAL_ACCESS_TOKEN')
        return personal_access_token

    def api_request(self, method, url=None, path='', api_version=None, data=None,  headers={}, params={}):
        params['api-version'] = api_version if api_version else self.api_version
        requests_url = f'https://{url}{path}' if url and path else f'https://{self.api_base_url}{self.path}'

        auth = None
        if self.personal_access_token:
            auth = HTTPBasicAuth('', self.personal_access_token)
        else:
            headers['Authorization'] = 'Bearer dummy'

        response = self.request_session.request(
            method=method, url=requests_url, auth=auth, params=params, json=data, headers=headers)

        if not response.ok:
            raise Exception(
                f'An error occurred when attempting to call {method} {url}: {response.status_code}:{response.text}')

        return response


