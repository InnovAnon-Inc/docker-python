FROM innovanon/doom-base
USER root
COPY ./pyenv.sh /etc/profile.d/
RUN sleep 91                 \
 && apt update               \
 && apt full-upgrade -y      \
 && apt install              \
      python3-pip            \
      python3-setuptools     \
      python3-wheel          \
 && python3 -m pip install   \
      --upgrade pip          \
 && python3 -m pip install   \
      --upgrade wheel        \
 && python3 -m pip install   \
      --upgrade setuptools   \
 && python3 -m pip install   \
      --upgrade pipenv       \
 && git clone --depth=1      \
      --recursive            \
      https://github.com/pyenv/pyenv.git \
       /opt/pyenv            \
 && cd /opt/pyenv            \
 && src/configure            \
 && make -C src              \
 && tar cf - --exclude-vcs . \
 |  tar xf - --owner=lfs:lfs \
      -C /home/lfs/.pyenv
USER lfs

