cd ~/src/github.com/
mkdir tmux
cd tmux
mkdir diff
cd diff
curl https://gist.githubusercontent.com/z80oolong/e65baf0d590f62fab8f4f7c358cbcc34/raw/f6374c17d76debbd510e0b6af00d07600c9f38f8/tmux-2.8-fix.diff -o tmux-2.8-fix.diff
cd ../
git clone https://github.com/tmux/tmux.git
cd tmux
git checkout refs/tags/2.8
patch -p1 < ../diff/tmux-2.8-fix.diff

sh autogen.sh
./configure
make -j4
sudo make install

