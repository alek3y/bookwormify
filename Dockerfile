FROM debian:trixie
SHELL ["/bin/bash", "-c"]

RUN apt update && apt upgrade -y
RUN apt install -y udev xauth sudo mesa-utils{,-extra} locales
RUN sed -i '/%sudo.*ALL$/ s/ALL$/NOPASSWD: ALL/' /etc/sudoers
RUN sed -i '/en_US\.UTF/ s/^# *//' /etc/locale.gen
RUN locale-gen && echo "LANG=en_US.UTF-8" >> /etc/environment

RUN apt install -y mpv firefox-esr dbus-x11

RUN apt install -y binutils wget curl xz-utils zip unzip apt-file vim
RUN apt-file update

ARG username
RUN mkdir /home/$username
RUN useradd -Md /home/$username -G sudo,video,render,kvm -s /bin/bash $username
