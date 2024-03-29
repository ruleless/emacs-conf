FROM emacs:26.3

RUN echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse' > /etc/apt/sources.list \
  && echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse' >> /etc/apt/sources.list \
  && echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse' >> /etc/apt/sources.list \
  && echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse' >> /etc/apt/sources.list \
  && echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse' >> /etc/apt/sources.list \
  && apt-get update && apt-get install -y \
    language-pack-zh-hans \
    fonts-droid-fallback ttf-wqy-zenhei ttf-wqy-microhei fonts-arphic-ukai fonts-arphic-uming \
    global gcc g++ clang clangd-10 \
    git \
  && rm -rf /var/lib/apt/lists/* \
  && ln -s /usr/bin/clangd-10 /usr/bin/clangd \
  && echo 'LANG="zh_CN.UTF-8"' >> /etc/environment \
  && echo 'LANGUAGE="zh_CN:zh:en_US:en"' >> /etc/environment \
  && echo 'en_US.UTF-8 UTF-8' >> /var/lib/locales/supported.d/local \
  && echo 'zh_CN.UTF-8 UTF-8' >> /var/lib/locales/supported.d/local \
  && echo 'zh_CN.GBK GBK' >> /var/lib/locales/supported.d/local \
  && echo 'zh_CN GB2312' >> /var/lib/locales/supported.d/local \
  && locale-gen

# install golang
# ADD https://golang.org/dl/go1.16.3.linux-amd64.tar.gz /usr/local/
ADD go1.19.2.linux-amd64.tar.gz /usr/local/
ENV PATH "/usr/local/go/bin:/root/go/bin:$PATH"
ENV GO111MODULE on
ENV GOPROXY https://goproxy.cn,direct
RUN go install github.com/mdempsky/gocode@latest \
  && go install github.com/rogpeppe/godef@latest \
  && go install github.com/dougm/goflymake@latest \
  && go install golang.org/x/tools/cmd/goimports@latest \
  && go install golang.org/x/tools/cmd/godoc@latest \
  && go install github.com/hhatto/gocloc/cmd/gocloc@latest \
  && go install golang.org/x/lint/golint@latest

# 拷贝文件
COPY site-lisp/ /root/.emacs.d/site-lisp/
COPY elpa/ /root/.emacs.d/elpa/
COPY ac-dict/ /root/.emacs.d/ac-dict/
COPY snippets/ /root/.emacs.d/snippets/
COPY .emacs /root/.emacs

# 设置环境变量
ENV TERM xterm-256color
ENV LANG "zh_CN.UTF-8"
ENV LANGUAGE "zh_CN:zh:en_US:en"

WORKDIR /root

CMD ["emacs"]
