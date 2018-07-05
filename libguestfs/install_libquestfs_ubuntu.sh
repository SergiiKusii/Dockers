echo "Downloading ..."
git clone --recursive -b stable-1.38 https://github.com/SergiiKusii/libguestfs.git && \
cd libguestfs && \
echo "Configuring ..." && \
./autogen.sh && \
./autogen.sh \
 --disable-perl \
 --disable-python \
 --disable-ruby \
 --disable-haskell \
 --disable-php \
 --disable-erlang \
 --disable-lua \
 --disable-golang \
 --disable-gobject \
 --disable-java \
 --enable-daemon && \
echo "Making ..."
make # TODO first build is failed 
rm po-docs/podfiles 
make -C po-docs update-po
make && \
echo "Installation ..." && \
make INSTALLDIRS=vendor DESTDIR=$PWD/build install && \

echo "Copying ..." && \
mkdir -p /app/package/guestfs/ && \
cp build/usr/local/lib/libguestfs.so.0.*.0 /app/package/guestfs/ && \
echo "Done!"
