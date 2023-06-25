cp ./zshrc ~/.zshrc

cp ./oh-my-zsh/themes/astro.zsh-theme ~/.oh-my-zsh/themes/astro.zsh-theme
git clone https://gitee.com/jklash1996/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

g++ --std=c++11 zsh_tools/RadixConverter.cpp -o zsh_tools/RadixConverter_exe
g++ --std=c++11 zsh_tools/understand_timestamp.cpp -o zsh_tools/humantime
g++ --std=c++11 zsh_tools/time_long.cpp -o zsh_tools/curtime
g++ --std=c++11 zsh_tools/slashdot.cpp -o zsh_tools/slashdot
cp -rf ./general_alias ~/.general_alias
cp -rf ./software_alias ~/.software_alias
cp -rf ./zsh_tools ~/.zsh_tools