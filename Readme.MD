![Lidarr Version)](https://img.shields.io/github/v/tag/lidarr/lidarr?color=009252&label=Lidarr&logo=data%3Aimage%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAA%2F1BMVEUAAADl5eXl5eXl5eXl5eXm5eXl5eXS3Nf16%2FD06%2FDl5eX67%2FXk5eUWCQ8AGwsIAAEAlVPy9PPw8vEDHxENAQUCAACTwKt9p5N4oo%2BGhoY7OzsqKSklJiYAEAJ6pJGAlIsAQiXv8PDg%2Be7l5eXW5dupzLy%2FtLmUyq6Wwa2muK0AklL6%2FPxAg2NEemFCb1sAkFA5ZE8BgkghVT0PUjQATSj17%2FMMKhwHJRYJGhMbDRMMFBAODA0AFgoKCAgLPSeRvKf%2F%2Bf7%2B9fru7u7t7e2cxrJ7mouKiop2lYV6jIN3i4FRknZGi2w7f2AydVZNTU0AfjsAfDcRQy0pKCgDNB4cGxu49hMIAAAAC3RSTlMAvI6KHuvR6%2BvrHewMajoAAADbSURBVHheNY%2FVdsMwEAUlS3baisxMYWamMjP9%2F7fUjtN5Wzp7B%2BRgBE9LEGFwRKL67cudrVOpqBXiGPupIZYOUQ5z8sZ%2BR6u2F4oeyXYwdZhfMXa16s276VIMkMbDqxFLm%2FNy95trCMAL5tXFWB1%2BRsZs04JAfto2Jj9qp6Oei771KAM52ffNr0Nj0tgmcnaymfHoY6iOrbpn2RAgfRF0y%2FNmygaXwUJHAFNX%2BNfV2i6q%2BGZMcR6stw7v26tBsH4lUhE95iafWkuXKP9ymv3w3NJyuYIzBEsnR%2F0%2FaqsZLDthdV8AAAAASUVORK5CYII%3D&logoColor=009252&style=plastic)


```
Uses stable versions  
Lidarr = master

```
TAGS  
:latest == latest

```
docker run -d \
  --name=xlidarr \
  -e PUID=99 \
  -e PGID=100 \
  -e TZ=UTC \
  -e UMASK_SET=000 \
  -p <hostport>:8686 \
  -v <configpath>:/config \
  --restart unless-stopped \
  agpsn/xlidarr:latest
