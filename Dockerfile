FROM ubuntu:18.04
LABEL Author=dnnmind.com

ENV LANG=C.UTF-8 RUNMODE=STANDALONE JOBLIB_TEMP_FOLDER=/root

WORKDIR /root
COPY ./sources.list /etc/apt/
RUN echo "nameserver 223.5.5.5" > /etc/resolv.conf && echo "nameserver 8.8.8.8" >> /etc/resolv.conf
ENV TZ=Etc/UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./fonts/msyh.ttf /usr/share/fonts/
COPY ./fonts/simhei.ttf /usr/share/fonts/
COPY ./packages.sh ./
COPY ./startup ./startup
COPY Python-3.7.2.tar.xz ./ 

RUN apt update && apt install -y sudo fontconfig screen htop wget net-tools vim curl && \
    apt install -y swig make cmake build-essential git gcc inetutils-ping procps && \
    apt-get install -y llvm llvm-7 libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev zip unzip rar unrar && \
    apt install -y redis-server gcc-multilib libaio1 

RUN curl https://pyenv.run | bash && \
    echo 'export PATH="/root/.pyenv/bin:$PATH"' >> ~/.bashrc && \
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc && \
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc  && \
    echo "export LANG=C.UTF-8" >> ~/.bashrc && \
    export PATH="/root/.pyenv/bin:$PATH" && eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)" && \
    mkdir ~/.pyenv/cache && mv Python-3.7.2.tar.xz ~/.pyenv/cache && \
    env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install -v 3.7.2 && \
    pyenv rehash && pyenv global 3.7.2  && \
    bash packages.sh && rm packages.sh && rm -rf ~/.cache && rm -rf ~/.pyenv/cache && apt-get clean
    
RUN ln -s /root/.pyenv/shims/* /usr/bin/ && \
    apt-get install -y libglib2.0-0

CMD ["/usr/bin/python", "/root/startup"]
    


