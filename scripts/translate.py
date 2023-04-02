#! /usr/bin/python3
import json
import sys

import requests

# step1:指定url
url = "https://fanyi.baidu.com/sug"
if len(sys.argv) == 2:
    t = sys.argv[1]
else:
    t = input("input what you want to translate:")

data = {"kw": t}
header = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.5112.81 Safari/537.36 Edg/104.0.1293.47"
}
# step2:发起请求
response = requests.post(url=url, data=data, headers=header)
dic_ojb = response.json()
if dic_ojb:
    for item in dic_ojb["data"]:
        print(item["k"])
        print(item["v"])
else:
    print("None")

input()
