FROM pandoc/latex:latest

RUN apk --no-cache add \
        bash \
        py3-pip \
        rsync \
        openssh-client \
        fontconfig \
        ttf-liberation \
        librsvg

RUN tlmgr option repository http://mirror.ctan.org/systems/texlive/tlnet && \
    tlmgr update --self && \
    tlmgr install titlesec
    
# Lato font installation
RUN mkdir -p /usr/share/fonts/truetype/
COPY fonts/lato/* /usr/share/fonts/truetype/

RUN mkdir -p /usr/share/fonts/opentype/
COPY fonts/kelson_sans/* /usr/share/fonts/opentype/

# Apply fonts
RUN fc-cache -f -v 

VOLUME /pandoc
WORKDIR /pandoc




