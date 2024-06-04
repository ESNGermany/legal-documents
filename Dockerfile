FROM pandoc/latex:latest

RUN apk --no-cache add \
        bash \
        py3-pip \
        rsync \
        openssh-client \
        fontconfig \
        ttf-liberation \
        librsvg

RUN tlmgr update --self && \
    tlmgr install \
       # lang-french: https://packages.debian.org/sid/texlive-lang-french
        aeguill \
        babel-french \
        bib-fr \
        bibleref-french \
        booktabs-fr \
        droit-fr \
        e-french \
        epslatex-fr \
        frenchmath \
        frletter \
        hyphen-french \
        impnattypo \
        mafr \
        tdsfrmath \
        # lang-european: https://packages.debian.org/sid/texlive-lang-european
        babel-dutch \
        hyphen-dutch \
        #lang-german: https://packages.debian.org/sid/texlive-lang-german
        babel-german \
        xpatch \
        #lang-spanish: https://packages.debian.org/unstable/texlive-lang-spanish
        babel-spanish \
        hyphen-spanish \
        # minted
        minted \
        ifplatform \
        etoolbox \
        xstring \
        # template-eisvogel: https://github.com/Wandmalfarbe/pandoc-latex-template#texlive
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
        # template-leaflet
        leaflet \
        transparent \
        titlesec \
        # template-letter
        wallpaper \
        # fonts
        ec \
        cm-super \
        fontawesome5 \
        # misc.
        catchfile

# Lato font installation
RUN mkdir -p /usr/share/fonts/truetype/
COPY fonts/lato/* /usr/share/fonts/truetype/

RUN mkdir -p /usr/share/fonts/opentype/
COPY fonts/kelson_sans/* /usr/share/fonts/opentype/

# Apply fonts
RUN fc-cache -f -v 

VOLUME /pandoc
WORKDIR /pandoc




