echo "Parted"
echo "Downloading ..."
git clone --recursive -b discover_only_fixes_v3_2 https://github.com/SergiiKusii/parted.git && \
cd parted && \
echo "Configuring ..." && \
./bootstrap && \
./configure CPPFLAGS=-DDISCOVER_ONLY --prefix=/usr && \
echo "Making ..." && \
make && \
make install && \

echo "Libgustfs appliance. Downloading ..." && \
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
 --enable-appliance \
 --enable-daemon && \
echo "Making ..." && \
# TODO first build is failed
make  && \
rm po-docs/podfiles && \
make -C po-docs update-po && \
make && \
echo "Installation ..." && \
./run appliance/libguestfs-make-fixed-appliance appliance/output && \
cd appliance/output && \
mkdir -p /app/package/guestfs/ && \
tar cvzf /app/package/guestfs/appliance-1.38.tar.gz ./* && \
cd ../../ && \
echo "Done!"
