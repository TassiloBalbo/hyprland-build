#/bin/bash

podman run -it --rm --name=hyprland-build \
	-- mount type=bind,source=${PWD},target=/root/src \
	tassilobalbo/hyprland-build:latest \
	bash
