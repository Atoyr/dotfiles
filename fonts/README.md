sudo apt install fontforge python-fontforge
curl -O https://www.rs.tus.ac.jp/yyusa/ricty/ricty_generator.sh
git clone https://github.com/powerline/fontpatcher.git

curl -O https://www.rs.tus.ac.jp/yyusa/ricty/os2version_reviser.sh

sh os2version_reviser.sh Ricty-Regular.ttf 
sh os2version_reviser.sh Ricty-Bold.ttf 
sh os2version_reviser.sh RictyDiscord-Regular.ttf 
sh os2version_reviser.sh RictyDiscord-Bold.ttf
