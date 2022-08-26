cp ./zshrc ~/.zshrc

cp ./oh-my-zsh/themes/astro.zsh-theme ~/.oh-my-zsh/themes/astro.zsh-theme
git clone https://gitee.com/jklash1996/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

g++ --std=c++11 zsh_tools/RadixConverter.cpp -o zsh_tools/RadixConverter_exe
g++ --std=c+=11 zsh_tools/understand_timestamp.cpp -o humantime
cp -rf ./general_alias ~/.general_alias
cp -rf ./software_alias ~/.software_alias
cp -rf ./zsh_tools ~/.zsh_tools