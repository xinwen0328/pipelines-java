import os

from apibase import ApiBase
import argparse

class VerifyPipeline(ApiBase):
    def __init__(self, url, path, api_version):
        url = url
        path = path
        api_version = api_version
        super().__init__(api_base_url=url, path=path, api_version=api_version)

    def get(self):
        return self.api_request(method='GET')


def get_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('-u', '--url', action='store', required=False, default='')
    parser.add_argument('-p', '--path', action='store', required=False, default='')
    parser.add_argument('-v', '--api_version', action='store', required=False, default='')

    args = parser.parse_args()

    for arg in vars(args):
        print(f'Input: {arg}:{getattr(args,arg)}')

    print(os.linesep)
    return args


if __name__ == '__main__':
    args = get_args()

    pipeline = VerifyPipeline(url=args.url, path=args.path, api_version=args.api_version)
    rjson = pipeline.get().json()
    pipelines = rjson["value"]
    for item in pipelines:
        print(f'{item["id"]:<10} {item["name"]:<64} {item["folder"]:<10}')
