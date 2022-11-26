#include <cstdio>
#include <string>
#include <iostream>
#include <ctime>
using namespace std;

int main(int argn, char* argv[]) {
    time_t rawtime;
    // 获取当前系统时间
    time(&rawtime);
    long time_long = rawtime * 1000;
    printf("milliseconds: %ld\n", time_long);
}