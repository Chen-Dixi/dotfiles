#include <cstdio>
#include <string>
#include <iostream>
#include <ctime>
using namespace std;

int main(int argn, char* argv[]) {
    if (argn!=2) {
        cout<<"humantime <13 millisecond digits>"<<endl;
        return 0;
    }
    
    long millisecond = stol(argv[1])/1000;
    time_t time = millisecond;
    tm local_time = *localtime(&time);
    int nYear = local_time.tm_year + 1900;//tm中的年份比实际年份小1900，需加1900
	int nMon = local_time.tm_mon + 1;//月， 从一月算起，范围0-11,需加1
	int nMDay = local_time.tm_mday;//日
	int nHour = local_time.tm_hour;//时
	int nMin = local_time.tm_min;//分
	int nSec = local_time.tm_sec;//秒
    printf("%d-%02d-%02d %02d:%02d:%02d\n", nYear, nMon, nMDay, nHour, nMin, nSec);

}