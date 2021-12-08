FROM archlinux
RUN echo "Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/\$repo/os/\$arch" >/etc/pacman.d/mirrorlist && \
    sed -i 's/#Color/#Color\nParallelDownloads = 10/g' /etc/pacman.conf && \
    pacman -Syu --noconfirm r base-devel pandoc texlive-bin texlive-core texlive-langchinese texlive-latexextra && \
    pacman -Scc --noconfirm  && \
    MAKE="make -j$(nproc)" R -q -e 'install.packages(c("bookdown","selectr","httr","kableExtra"), repo=c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/"))'
WORKDIR /app