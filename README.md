# hyprland-build
build hyprland in a container

```
git clone --recursive https://github.com/TassiloBalbo/hyprland-build.git
```

## Build image

```
docker build -t tassilobalbo/hyprland-build:latest -f Containerfile
docker image push tassilobalbo/hyprland-build:latest
```
