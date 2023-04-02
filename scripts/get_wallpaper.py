#! /usr/bin/python3


# 获得bing 每日壁纸
from threading import Thread

import requests


class DownloadHanlde(Thread):
    def __init__(self, url, fname):
        super().__init__()
        self.url = url
        self.fname = fname

    def run(self):
        resp = requests.get(self.url)
        with open("/home/lugar/.feh/" + self.fname, "wb") as f:
            f.write(resp.content)


def main():
    num = 1  # 获取图片的数量
    url = "https://cn.bing.com"
    api = f"https://cn.bing.com/HPImageArchive.aspx?format=js&idx=0&n={num}&mkt=zh-CN"
    resp = requests.get(api)
    data_model = resp.json()
    data_list = data_model["images"]
    for line in data_list:

        pic_url = url + line["url"]
        print(f"picture url:{pic_url}")
        fname = line["title"] + ".jpg"
        print(f"filename:{fname}")
        try:
            DownloadHanlde(pic_url, fname).start()
        except Exception as e:
            print("下载失败")
            return

        print(f"成功下载图片:{fname}")


if __name__ == "__main__":
    main()
