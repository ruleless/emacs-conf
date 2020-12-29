FROM emacs:26.3

ENV TERM xterm-256color
ENV LANG "zh_CN.UTF-8"
ENV LANGUAGE "zh_CN:zh:en_US:en"

RUN echo 'deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse' > /etc/apt/sources.list \
  && echo 'deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse' >> /etc/apt/sources.list \
  && echo 'deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse' >> /etc/apt/sources.list \
  && echo 'deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse' >> /etc/apt/sources.list \
  && apt-get update && apt-get install -y \
    global \
    language-pack-zh-hans \
    fonts-droid-fallback ttf-wqy-zenhei ttf-wqy-microhei fonts-arphic-ukai fonts-arphic-uming \
  && rm -rf /var/lib/apt/lists/* \
  && echo 'LANG="zh_CN.UTF-8"' >> /etc/environment \
  && echo 'LANGUAGE="zh_CN:zh:en_US:en"' >> /etc/environment \
  && echo 'en_US.UTF-8 UTF-8' >> /var/lib/locales/supported.d/local \
  && echo 'zh_CN.UTF-8 UTF-8' >> /var/lib/locales/supported.d/local \
  && echo 'zh_CN.GBK GBK' >> /var/lib/locales/supported.d/local \
  && echo 'zh_CN GB2312' >> /var/lib/locales/supported.d/local \
  && locale-gen

COPY site-lisp/ /root/.emacs.d/site-lisp/
COPY elpa/ /root/.emacs.d/elpa/
COPY ac-dict/ /root/.emacs.d/ac-dict/
COPY snippets/ /root/.emacs.d/snippets/
COPY .emacs /root/.emacs
COPY my-settings.el /root/.emacs.d/custom/my-settings.el
COPY .TabNine/ /root/.TabNine/

WORKDIR /root

CMD ["emacs"]
