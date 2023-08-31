FROM debian:bookworm
SHELL ["/bin/bash", "-c"]
RUN apt update -y
RUN apt install -y udev xauth sudo mesa-utils{,-extra} mplayer firefox-esr
RUN sed -i 's/\(%sudo.*\)ALL$/\1NOPASSWD: ALL/' /etc/sudoers
