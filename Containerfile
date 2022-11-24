FROM archlinux:base-devel
LABEL Description="Hyprland build environment"

ENV HOME /root

SHELL ["/bin/bash", "-c"]

RUN pacman -Syu --noconfirm

RUN pacman -S --noconfirm --needed git sudo

RUN useradd builduser -m && \
	passwd -d builduser && \
	printf 'builduser ALL=(ALL) ALL\n' | tee -a /etc/sudoers

RUN sudo -u builduser bash -c 'cd ~ && git clone https://aur.archlinux.org/yay-bin.git && \
	cd yay-bin && \
	makepkg -si'

RUN yay -S --noconfirm gdb ninja gcc cmake libxcb xcb-proto xcb-util \
	xcb-util-keysyms libxfixes libx11 libxcomposite \
	xorg-xinput libxrender pixman wayland-protocols \
	cairo pango seatd libxkbcommon xcb-util-wm \
	xorg-xwayland


