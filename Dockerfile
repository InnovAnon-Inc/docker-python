FROM innovanon/doom-base
USER root
RUN sleep 91               \
 && apt update             \
 && apt full-upgrade -y    \
 && apt install            \
      python3-pip          \
      python3-pyenv        \
      python3-setuptools   \
      python3-wheel        \
 && python3 -m pip install \
      --upgrade pip        \
 && python3 -m pip install \
      --upgrade wheel      \
 && python3 -m pip install \
      --upgrade setuptools \
 && python3 -m pip install \
      --upgrade pipenv
USER lfs

