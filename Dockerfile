FROM innovanon/doom-base
USER root
RUN sleep 91            \
 && apt update          \
 && apt full-upgrade -y \
 && apt install python3-pip python3
USER lfs

