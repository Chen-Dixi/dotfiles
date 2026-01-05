#include <iostream>
#include <string>
#include <algorithm>
#include <cstring>



// 将字符串复制到剪贴板
void copyToClipboard(const std::string& str) {
    FILE* pipe = popen("pbcopy", "w");
    if (pipe != nullptr) {
        fwrite(str.c_str(), sizeof(char), str.size(), pipe);
        pclose(pipe);
    }
}

int main(int argc, char*argv[]) {
    if (argc != 3) {
        std::cerr << "用法: " << argv[0] << " <前一个值> <当前值>" << std::endl;
        return 1;
    }

    double prev = atof(argv[1]);
    double curr = atof(argv[2]);
    if (prev == 0) {
        std::cerr << "前一个值不能为0" << std::endl;
        return 1;
    }

    double ratio = (curr - prev) / prev * 100.0;
    char buf[32];
    if (ratio >= 0)
        snprintf(buf, sizeof(buf), "+%.2f%%", ratio);
    else
        snprintf(buf, sizeof(buf), "%.2f%%", ratio);

    std::cout << buf << std::endl;
    copyToClipboard(buf);
    return 0;
}
