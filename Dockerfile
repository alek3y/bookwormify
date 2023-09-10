FROM debian:bookworm
SHELL ["/bin/bash", "-c"]

RUN apt update
RUN apt install -y udev xauth sudo mesa-utils{,-extra}
RUN sed -i 's/\(%sudo.*\)ALL$/\1NOPASSWD: ALL/' /etc/sudoers

RUN apt install -y mplayer firefox-esr

RUN apt install -y binutils wget curl zip unzip apt-file vim
RUN apt-file update

ARG username
RUN mkdir /home/$username
RUN useradd -Md /home/$username -G sudo,video,render,kvm -s /bin/bash $username
