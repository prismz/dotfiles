#!/bin/bash

distro=$(grep '^ID=' /etc/os-release | cut -c4-)

# ls aliases
alias ls='ls --color=auto -A '
alias lg='ls -1 | grep -i'
alias ll='ls -lh'
alias lla='ls -lah'
alias l1='ls -1'
alias l1l='ls -1 | less'
alias lbd='ls -1tr'  # list by date

if [ "$distro" == "debian" ]; then
        PATH=$PATH:/sbin/  # why do you make me do this debian... fuck you
fi

if [ "$distro" == "gentoo" ]; then
        # gentoo && kernel aliases
        alias ek='cd /usr/src/linux/ && doas make menuconfig'
        alias k='cd /usr/src/linux && doas su'
        alias bk='cd /usr/src/linux && make -j24 && make modules_install && make install'
        alias mc='doas nvim /etc/portage/make.conf'

        # portage aliases
        alias e='doas emerge --ask --verbose --autounmask-write --autounmask-continue'
        #alias es='emerge --search'
        #alias pes='doas portage-search'
        alias es='eix -s'
        alias er='doas emerge --deselect'
        alias eq='eix-installed all'
        alias eqg='eix-installed -q all | grep'
        alias eqw='cat /var/lib/portage/world'
        alias world='cat /var/lib/portage/world'
        alias eu='echo Make sure to run depclean! && flatpak update && doas emerge -auvDN --with-bdeps=y --autounmask-write --autounmask-continue --quiet @world'
        alias ed='flatpak uninstall --unused && doas emerge --depclean --ask'
        #alias qc='watch -cn 3 genlop -ci'
        #alias qc='doas watch -n 2 qlop -rt'
        alias qc='doas watch -c -n 2 qlop -r --color'

        #alias qe='genlop -ci'
        alias qe='qlop -r'
        #alias ec='genlop -t'
        alias ec='qlop -p'
        alias up='doas emerge -1 sys-apps/portage'
        alias use='cd /etc/portage/package.use && doas su'
        alias custom='doas nvim /etc/portage/package.use/00custom'
        alias ak='doas nvim /etc/portage/package.accept_keywords/00custom'
        alias mask='doas nvim /etc/portage/package.mask/'
        alias uses='equery uses'
        alias sync='doas emaint sync --allrepos && doas eix-update'
fi

if [ "$distro" == "arch" ]; then
        alias aursearch='echo use "es" i re-aliased it to yay...'
        alias e='yay -S --needed'
        alias es='yay -Ss'
        alias er='yay -R'
        alias eq='pacman -Q'
        alias eqg='pacman -Q | grep -i'
        alias eqm='pacman -Qm'
        alias eu='yay -Syu'
        alias ed='doas pacman -Rsn $(pacman -Qdtq)'
fi

# config file aliases
alias bashrc='nvim ~/.bashrc && source ~/.bashrc'
alias aliases='nvim ~/.bash_aliases && source ~/.bashrc'
alias vimrc='nvim ~/.vimrc'
alias startup='nvim ~/.bash_startup'
alias dwmconfig='cd ~/Development/Suckless/dwm && nvim config.h'
alias fstab='doas nvim /etc/fstab'

# command aliases
alias ff='fastfetch'
alias gc='git clone'
alias nv='nvim'
alias dnv='doas nvim'
alias dc='doas cat'
alias sudo='echo USE FUCKING DOAS DAMMIT'
alias neofetch='echo use ff \(fastfetch\)'
alias srm='echo use shred -uz -n [ITER] [FILE] instead of '
alias fp='pgrep -l'
alias cls='clear'
# alias define='dict -d gcide'
alias sx='startx'
alias rb_='doas reboot'  # underscore to avoid typos
alias po_='doas poweroff'
alias sdn='doas poweroff'
alias murder='doas killall -9'
# alias ssh='TERM="xterm" ssh'
# alias ntpsync='doas ntpdate -b pool.ntp.org; doas hwclock -w'
alias nano='vi'  # :)
alias vidoas='doas $EDITOR /etc/doas.conf'

#alias kb='setxkbmap -option "grp:win_space_toggle" colemak,us,ru'
#alias colemak='setxkbmap "us,us" -variant "colemak," -option grp:win_space_toggle'
#alias qwerty='setxkbmap us'

alias win='doas grub-reboot 2 && doas reboot'
alias bios='doas grub-reboot 3 && doas reboot'
alias dickcord='~/Software/Scripts/discord.sh'

#alias df='df -h -x tmpfs -x devtmpfs -x efivarfs -T'
# alias rm='echo "use trash-put or srm."' # rm -rfvi
alias rm='rm -rfvi'
alias mv='mv -v'
alias cp='cp -rv'

# VPN
# alias mullvad='cd /etc/openvpn/ && doas openvpn --config /etc/openvpn/mullvad_us_qas.conf'
# alias fixdns='doas /etc/openvpn/update-resolv-conf.py'
# alias amiconnected='curl https://am.i.mullvad.net/connected'
# alias mullvad='ivpn-ui'
# alias vpn='cd ~/soft/ && doas openvpn AirVPN*'

# yt-dlp aliases
alias yd='yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best"'
alias ya='yt-dlp -x --audio-format mp3'

# directory aliases
alias ad='cd ~/Vault/Adult'
alias movies='cd ~/Vault/Movies'
alias iso='cd ~/Vault/ISOs/'

#alias wifi='echo "UNPLUG ETHERNET!" && doas wpa_supplicant -c /etc/wpa_supplicant.conf -i wlp0s19f2u2'
#alias net='doas rc-service net.enp4s0 restart'

