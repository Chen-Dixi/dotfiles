#include <iostream>
#include <cstdio>
#include <algorithm>
#include <cstdlib>
using namespace std;

const char digit[37] = {"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"};

int char2int(char c){
    // A~Z 表示从10开始的数字
    if(c>='a' && c<='z') {
        return c-'a'+10;
    }else if(c>='A' && c<='Z') {
        return c-'A'+10;
    }
    // 0~10
    return c-'0';
}

string getQuotientAndRemainder(
    string originNumber,
    int radix_from,
    int radix_to,
    char& remainderChar) {
    
    int remainder = 0;
    
    int num = 0;
    for(int i=0; i<originNumber.size(); i++) {
        num = remainder * radix_from + char2int(originNumber[i]);
        originNumber[i] = digit[num / radix_to];
        remainder = num % radix_to;
    }
    remainderChar = digit[remainder];

    int pos = 0;
    while(originNumber[pos] == '0') {
        pos++;
    }
    return originNumber.substr(pos);
}

string convert(string originNumber, int radix_from, int radix_to) {

    string result = "";
    char remainderChar = '0';

    while(originNumber.size() != 0) {
        originNumber = getQuotientAndRemainder(originNumber, radix_from, radix_to, remainderChar);
        result = remainderChar + result;
    }

    return result;
}

int main(int argc, char*argv[]) {
    // 表示数字的字符串，radix from，radix to
    if (argc < 4) {
        cout<<"radixConverter number radix_from radix_to"<<endl;
        return 0;
    }

    string originalNumber = string(argv[1]);

    int radix_from = atoi(argv[2]);
    int radix_to = atoi(argv[3]);;
    string bistring = convert(originalNumber, radix_from, radix_to);
    cout<<bistring;
}
