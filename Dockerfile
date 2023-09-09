FROM debian:bookworm
SHELL ["/bin/bash", "-c"]

RUN apt update -y
RUN apt install -y udev xauth sudo mesa-utils{,-extra} mplayer firefox-esr binutils wget curl zip unzip apt-file vim
RUN apt-file update
RUN sed -i 's/\(%sudo.*\)ALL$/\1NOPASSWD: ALL/' /etc/sudoers

ARG username
RUN mkdir /home/$username
RUN useradd -Md /home/$username -G sudo,video,render,kvm -s /bin/bash $username
