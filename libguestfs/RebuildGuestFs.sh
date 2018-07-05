#! /bin/bash
# ubuntu
UBUNTU_IMAGE='9069/ubuntu_build_libguestfs'
DOCKER_DIR='/app'
UBUNTU_INSTALL_SCRIPT="/app/install_libquestfs_ubuntu.sh"
BUILD_SCRIPT="chmod +x $UBUNTU_INSTALL_SCRIPT && $UBUNTU_INSTALL_SCRIPT"

echo "pull $UBUNTU_IMAGE ..." && \
docker pull $UBUNTU_IMAGE && \
echo "run $UBUNTU_IMAGE image ... " && \
docker run -v $PWD:$DOCKER_DIR $UBUNTU_IMAGE bash -c "$BUILD_SCRIPT"

# fedora
FEDORA_IMAGE='9069/fedora_build_libguestfs'
FEDORA_INSTALL_SCRIPT="/app/install_libquestfs_fedora.sh"
BUILD_SCRIPT="chmod +x $FEDORA_INSTALL_SCRIPT && $FEDORA_INSTALL_SCRIPT"

echo "pull $FEDORA_IMAGE ..."
docker pull $FEDORA_IMAGE && \
echo "run $FEDORA_IMAGE image ... " && \
docker run -v $PWD:$DOCKER_DIR $FEDORA_IMAGE bash -c "$BUILD_SCRIPT" && \
