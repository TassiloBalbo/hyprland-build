FROM archlinux:base-devel
LABEL Description="Hyprland build environment"

ENV HOME /root

SHELL ["/bin/bash", "-c"]

RUN pacman -Syu

RUN pacman -S --needed git

RUN git clone https://aur.archlinux.org/yay-bin.git && \
	cd yay-bin && \
	makepkg -si

RUN yay -S gdb ninja gcc cmake libxcb xcb-proto xcb-util \
	xcb-util-keysyms libxfixes libx11 libxcomposite \
	xorg-xinput libxrender pixman wayland-protocols \
	cairo pango seatd libxkbcommon xcb-util-wm \
	xorg-xwayland


