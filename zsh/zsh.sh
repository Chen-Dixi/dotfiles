cp ./zshrc ~/.zshrc

cp ./oh-my-zsh/themes/astro.zsh-theme ~/.oh-my-zsh/themes/astro.zsh-theme
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

g++ --std=c++11 zsh_tools/RadixConverter.cpp -o zsh_tools/RadixConverter_exe
cp -rf ./general_alias ~/.general_alias
cp -rf ./software_alias ~/.software_alias
cp -rf ./zsh_tools ~/.zsh_tools