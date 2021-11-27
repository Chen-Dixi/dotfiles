import time
import argparse
import sys

if len(sys.argv) < 2:
    print("datenum 13位数字")
    exit(1)

tupTime = time.localtime(int(sys.argv[1])/1000)#秒时间戳
stadardTime = time.strftime("%Y-%m-%d %H:%M:%S", tupTime)
print(stadardTime)