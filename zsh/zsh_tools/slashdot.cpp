#include <iostream>
#include <string>
#include <algorithm>
#include <cstring>

// 转换字符串中的'/'为'.'，'.'为'/'
std::string convertString(const std::string& str) {
    std::string convertedString = str;
    for(std::string::iterator it = convertedString.begin(); it !=convertedString.end(); it++){
        if (*it == '.') {
            *it = '/';
        } else if (*it == '/') {
            *it = '.';
        }
    }
    return convertedString;
}

// 将字符串复制到剪贴板
void copyToClipboard(const std::string& str) {
    FILE* pipe = popen("pbcopy", "w");
    if (pipe != nullptr) {
        fwrite(str.c_str(), sizeof(char), str.size(), pipe);
        pclose(pipe);
    }
}

int main(int argc, char*argv[]) {
    std::string inputString = std::string(argv[1]);
    std::string convertedString = convertString(inputString);
    std::cout << "Converted string: " << convertedString << std::endl;
    copyToClipboard(convertedString);
    std::cout << "Result copied to clipboard." << std::endl;
    return 0;
}
