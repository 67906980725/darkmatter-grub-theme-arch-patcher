#!/bin/bash
# install: chmod -x ./run.sh && ./run.sh
#    type password and then separately chose: 1, 2, 2
# unstall: ./run.sh -r


origin_pwd="darkmatter-grub-theme"
if not test -d $origin_pwd ; then
    git clone "https://gitlab.com/VandalByte/darkmatter-grub-theme.git"
fi

bak_file()
{
    mv "$1" "$1.bak"
    echo "moved $1 to $1.bak"
}

copy_to()
{
    cp "$1" "$origin_pwd/$1"
    echo "copyed $1 to $origin_pwd/$1"
}

flag_file="pached"

if not test -e "$flag_file" ; then
    bak_file "$origin_pwd/base/1080p/progress_bar_e.png"
    bak_file "$origin_pwd/base/1080p/progress_bar_w.png"
    bak_file "$origin_pwd/base/1440p/progress_bar_e.png"
    bak_file "$origin_pwd/base/1440p/progress_bar_w.png"

    bak_file "$origin_pwd/base/1080p/progress_bar_c.png"
    bak_file "$origin_pwd/base/1080p/progress_highlight_c.png"
    bak_file "$origin_pwd/base/1440p/progress_bar_c.png"
    bak_file "$origin_pwd/base/1440p/progress_highlight_c.png"
    copy_to "base/1080p/progress_bar_c.png"
    copy_to "base/1080p/progress_highlight_c.png"
    copy_to "base/1440p/progress_bar_c.png"
    copy_to "base/1440p/progress_highlight_c.png"

    bak_file "$origin_pwd/assets/backgrounds/arch-1440p.png"
    copy_to "assets/backgrounds/arch-1440p.png"
    # todo now haven't 1080p background
#    bak_file "$origin_pwd/assets/backgrounds/arch-1080p.png"
#    copy_to "assets/backgrounds/arch-1080p.png"

    echo "" > "$flag_file"
    echo "pached success"
fi

x="i"
if [ "$1"x = "-r"x ]; then
    x="u"
fi

cmd_str="sudo python3 darkmatter-theme.py -$x"

cd "$origin_pwd"
$cmd_str
