FROM innovanon/doom-base
USER root
RUN sleep 91               \
 && apt update             \
 && apt full-upgrade -y    \
 && apt install            \
      python3-pip          \
      python3-setuptools   \
      python3-wheel        \
 && python3 -m pip install \
      --upgrade pip wheel  \
                setuptools \
                pyenv      \
                pipenv
USER lfs

