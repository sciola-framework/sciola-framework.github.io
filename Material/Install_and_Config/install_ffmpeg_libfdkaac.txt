# Criando um script .sh para executar todos os comandos:
#root@servidor:~# vi script.sh 
#root@servidor:~# chmod +x script.sh 
#root@servidor:~# ./script.sh

apt-get update
apt-get -y install autoconf automake build-essential git-core libass-dev libgpac-dev libsdl1.2-dev libtheora-dev libtool libvdpau-dev libvorbis-dev libx11-dev libxext-dev libxfixes-dev pkg-config texi2html zlib1g-dev libmp3lame-dev nasm gcc yasm && true
mkdir ~/ffmpeg_sources
cd ~/ffmpeg_sources
git clone --depth 1 git://github.com/mstorsjo/fdk-aac.git
cd fdk-aac
autoreconf -fiv
./configure --prefix="$HOME/ffmpeg_build" --disable-shared
make -j8
make install
make distclean
cd ~/ffmpeg_sources
wget https://sourceforge.net/projects/lame/files/lame/3.99/lame-3.99.5.tar.gz
tar xzvf lame-3.99.5.tar.gz
cd lame-3.99.5
./configure --prefix="$HOME/ffmpeg_build" --enable-nasm --disable-shared
make -j8
make install
make distclean
cd ~/ffmpeg_sources
wget https://ffmpeg.org/releases/ffmpeg-4.2.1.tar.gz
tar xzvf ffmpeg-4.2.1.tar.gz
cd ffmpeg-4.2.1
PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig"
export PKG_CONFIG_PATH
./configure --prefix="$HOME/ffmpeg_build" \
  --extra-cflags="-I$HOME/ffmpeg_build/include" --extra-ldflags="-L$HOME/ffmpeg_build/lib" \
  --bindir="$HOME/bin" --extra-libs="-ldl" --enable-gpl --enable-libass --enable-libfdk-aac \
  --enable-libmp3lame --enable-nonfree
make -j8
make install
cp ffmpeg /usr/bin/
make distclean
hash -r
ffmpeg 2>&1 | head -n1
