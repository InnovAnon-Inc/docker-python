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
 && mkdir /home/lfs/.pyenv   \
 && tar cf -               . \
 |  tar xf - --owner=lfs     \
      -C /home/lfs/.pyenv    \
 && chown -R lfs:lfs         \
         /home/lfs/.pyenv    \
 && /opt/pyenv/bin/pyenv install 3.9.1 \
 && /opt/pyenv/bin/pyenv global  3.9.1
USER lfs
#RUN cd   /home/lfs/.pyenv/src/configure \
# && make -C src

