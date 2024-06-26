# F´ IIAC Workspace

![](./screenshot-of-fprime-workspace-image-with-ingenuity-above-perseverance-on-mars-wallpaper.png)

[Ingenuity Helicopter above Perseverance on Mars](https://photojournal.jpl.nasa.gov/catalog/PIA24127) (wallpaper) image credit: NASA/JPL-Caltech

## Introduction

This repo provides the source code for building an Immutable-Infrastructure-as-Code (IIAC) workspace image, using Kasm, for the [F´(F Prime)](https://github.com/nasa/fprime) flight software and embedded systems framework, based on an Ansible template for [KASM Ubuntu Jammy](https://hub.docker.com/r/kasmweb/core-ubuntu-jammy) images.  The workspace is configured with the following:

- FPrime Community Projects
  - [fprime-workshop-led-blinker](https://github.com/fprime-community/fprime-workshop-led-blinker)
  - [fprime-tutorial-math-component](https://github.com/fprime-community/fprime-tutorial-math-component)
  - [fprime-baremetal-reference](https://github.com/mdrs-community/fprime-baremetal-reference)
- Cross Compile Toolchain for embedded Linux
  - gcc-arm-linux-gnueabihf
  - g++-arm-linux-gnueabihf
  - gdb-multiarch
  - build-essential
  - openssl
  - [cmake v3.23](http://www.cmake.org/files/v3.23)
- git cli
- [Keychain](https://www.funtoo.org/Keychain)
- Firefox
- Python 3.10 (part of the image template) with the following packages (not part of the image template)
    - pip
    - [fprime](https://github.com/nasa/fprime) 3.4.0
        - [fprime-tools](https://github.com/fprime-community/fprime-tools)
        - [fprime-gds](https://github.com/fprime-community/fprime-gds)
        - [fpp](https://github.com/fprime-community/fpp)
    - [JupyterLab](https://jupyter.org/)
    - [Jupyter Notebook](https://jupyter.org/)
    - [Voilà](https://voila.readthedocs.io/en/stable/index.html)
    - [Pint](https://pint.readthedocs.io/en/stable/)
    - [pySerial](https://github.com/pyserial/pyserial)
- Arduino tools for building fprime for embedded platforms
    - [Arduino IDE](https://github.com/arduino/arduino-ide) 2.2.1
    - [Arduino CLI](https://github.com/arduino/arduino-cli) 0.33.1
    - [Arduino CLI CMake Wrapper](https://github.com/SterlingPeet/arduino-cli-cmake-wrapper)
    - [Arduino Pico](https://github.com/earlephilhower/arduino-pico) 3.3.0
    - [Arduino ESP32](https://github.com/espressif/arduino-esp32) 2.0.9
    - [Teensy](https://www.pjrc.com/teensy/td_download.html)
    - [Adafruit board index](https://github.com/adafruit/arduino-board-index) esptools-0.4.2-winfix
- VS Code with the following extensions (note, auto-updates are disabled)
    - [Python extension by Microsoft](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
    - [VSCode language support for FPrimePrime modeling language by Jet Propulsion Laboratory](https://marketplace.visualstudio.com/items?itemName=jet-propulsion-laboratory.fpp)

## Requirements

1. Docker
2. Git
3. A Bash terminal (standard terminal environment for *nix and macOS).
4. [UDEV Rules for Teensy boards](https://www.pjrc.com/teensy/00-teensy.rules) placed in `/etc/udev/rules.d/00-teensy.rules`. See https://www.pjrc.com/teensy/td_download.html

NOTE: To Windows 10 users: Windows Command Prompt will not satisfy this dependency. We recommend installing [Ubuntu on WSL2 for Windows 10](https://ubuntu.com/tutorials/install-ubuntu-on-wsl2-on-windows-10).

## How to Use this Repo

1. Clone this repo and change directory into `fprime-workspace-image`.
1. Run `docker-compose pull` (Note: Linux users may need to prepend this command with `sudo`) to pull the published version of the workspace image or run `docker-compose build` to build the image locally.

## Using the image locally

Once built, the image can be pushed into the Kasm server per Kasm documentation or it can be run locally on port 6901 using docker-compose.

- **Starting the image locally:** Run `docker-compose up -d`
- **Stopping the image locally:** Run `docker-compose down`

When running locally, the workspace can be accessed at https://localhost:6901 with
- **User:** `kasm_user`
- **Passwordd:** `password`
