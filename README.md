# setprof

setprof is a CLI-utility for setting the combined power profiles of the host system.

```
setprof <profile>
```

This programme has only been tested on an Arch Linux system running an AMD Ryzen 7 3700X CPU combined with an AMD Radeon RX 5700 XT GPU.
Support for other graphics cards (especially from NVIDIA) is not guaranteed.

## Built-in Profiles

The following profiles are built-in:

* `idle` for power saving
* `3d` for generic 3D rendering
* `vr` for VR rendering

## Installation

Run the provided `install.sh` script to install setprof:

```
install.sh <base_directory>
```
