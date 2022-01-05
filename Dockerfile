FROM pandoc/latex:2.14.1

RUN apk --no-cache add \
        bash \
        py3-pip \
        rsync \
        openssh-client \
        fontconfig \
        ttf-liberation \
        dia \
        librsvg

RUN tlmgr update --self && \
    tlmgr install \
        #lang-german: https://packages.debian.org/sid/texlive-lang-german
        babel-german \
        xpatch \
        # minted
        minted \
        ifplatform \
        etoolbox \
        xstring \
        adjustbox \
        background \
        bidi \
        collectbox \
        csquotes \
        everypage \
        filehook \
        footmisc \
        footnotebackref \
        framed \
        fvextra \
        letltxmacro \
        ly1 \
        mdframed \
        mweights \
        needspace \
        pagecolor \
        sourcecodepro \
        sourcesanspro \
        titling \
        ucharcat \
        ulem \
        unicode-math \
        upquote \
        xecjk \
        xurl \
        zref \
        # misc.
        catchfile

# Lato font installation
ARG LATO_FONT=https://fonts.google.com/download?family=Lato
RUN wget ${LATO_FONT} -O /root/lato.zip && \
    mkdir -p /root/lato && \
    unzip /root/lato.zip -d /root/lato && \
    mkdir -p /usr/share/fonts/truetype/ && \
    mv /root/lato /usr/share/fonts/truetype/

# Kelson Sans font installation
ARG KELSON_SANS_FONT=https://www.wfonts.com/download/data/2016/07/10/kelson-sans/kelson-sans.zip
RUN wget ${KELSON_SANS_FONT} -O /root/kelson-sans.zip && \
    mkdir -p /root/kelson-sans && \
    unzip /root/kelson-sans.zip -d /root/kelson-sans && \
    mkdir -p /usr/share/fonts/opentype/ && \
    mv /root/kelson-sans /usr/share/fonts/opentype/

# Apply fonts
RUN fc-cache -f -v 

VOLUME /pandoc
WORKDIR /pandoc




