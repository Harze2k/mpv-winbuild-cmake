ExternalProject_Add(ffmpeg-otruehd
    DEPENDS
        amf-headers
        avisynth-headers
        nvcodec-headers
        bzip2
        lame
        lcms2
        openssl
        libssh
        libsrt
        libass
        libbluray
        libdvdnav
        libdvdread
        libmodplug
        libpng
        libsoxr
        libbs2b
        libvpx
        libwebp
        libzimg
        libmysofa
        fontconfig
        harfbuzz
        opus
        speex
        vorbis
        x264
        ${ffmpeg_x265}
        xvidcore
        libxml2
        libvpl
        libopenmpt
        libjxl
        shaderc
        libplacebo
        libzvbi
        libaribcaption
        aom
        rav1e
        dav1d
        vapoursynth
        uavs3d
        davs2
        rubberband
        libva
        openal-soft
    GIT_REPOSITORY https://github.com/mitzsch/FFmpeg.git
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--sparse --filter=tree:0"
    GIT_CLONE_POST_COMMAND "sparse-checkout set --no-cone /* !tests/ref/fate"
    UPDATE_COMMAND ""
    GIT_REMOTE_NAME origin
    GIT_TAG master-2
    CONFIGURE_COMMAND ${EXEC} <SOURCE_DIR>/configure
        --cross-prefix=${TARGET_ARCH}-
        --prefix=${MINGW_INSTALL_PREFIX}
        --arch=${TARGET_CPU}
        --target-os=mingw32
        --pkg-config-flags=--static
        --enable-cross-compile
        --enable-runtime-cpudetect
        --enable-gpl
        --enable-version3
        --enable-postproc
        --enable-avisynth
        --enable-vapoursynth
        --enable-libass
        --enable-libbluray
        --enable-libdvdnav
        --enable-libdvdread
        --enable-libfreetype
        --enable-libfribidi
        --enable-libfontconfig
        --enable-libharfbuzz
        --enable-libmodplug
        --enable-libopenmpt
        --enable-libmp3lame
        --enable-lcms2
        --enable-libopus
        --enable-libsoxr
        --enable-libspeex
        --enable-libvorbis
        --enable-libbs2b
        --enable-librubberband
        --enable-libvpx
        --enable-libwebp
        --enable-libx264
        --enable-libx265
        --enable-libaom
        --enable-librav1e
        --enable-libdav1d
        --enable-libdavs2
        --enable-libuavs3d
        --enable-libxvid
        --enable-libzimg
        --enable-openssl
        --enable-libxml2
        --enable-libmysofa
        --enable-libssh
        --enable-libsrt
        --enable-libvpl
        --enable-libjxl
        --enable-libplacebo
        --enable-libshaderc
        --enable-libzvbi
        --enable-libaribcaption
        --enable-cuda-llvm
        --enable-cuvid
        --enable-nvdec
        --enable-nvenc
        --enable-amf
        --enable-openal
        --enable-opengl
        --disable-doc
        --enable-vaapi
        --disable-vdpau
        --disable-videotoolbox
        --disable-decoder=libaom_av1
        ${ffmpeg_lto}
        --extra-cflags='-Wno-error=int-conversion'
        "--extra-libs='${ffmpeg_extra_libs}'" # -lstdc++ / -lc++ needs by libjxl and shaderc
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(ffmpeg-otruehd)
cleanup(ffmpeg-otruehd install)
