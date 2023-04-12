# WWU-VPN

This repo contains a script to connect to the WWU-VPN. Also, a GUI is available which is built with Python.

**Note: This script is not affiliated with the WWU**

**Note: This repo originates from a [gist](https://gist.github.com/antonengelhardt/c920a42a1fb8ce9e9f301b57da3b8c59) and has been turned into a repo, because additional contributors joined.**

## Before running

### Install tools

Before you run this script, install:

- openconnect
- oathtool

Use the `install.sh` script to install the tools.

With [brew](https://brew.sh/index_de):

```sh
brew install oath-toolkit; brew install openconnect
```

### Change constants

At the top of the script, change the values accordingly:

```sh
USER=mmuster1
PASSWORD=verysecurepassword
OTP_CODE=$(oathtool --totp 100000000000000000005224)
```

The Keimwert is displayed in the WWU-IT-Portal when you create your OTP profile. It is the "Keimwert im Base16-Format"

## Run / Connect

To run this script, use `sh wwu-vpn.sh`

When you are prompted for a password, enter the password which you use to login to your computer.

## Disconnect

To disconnect, run the script again. It should disconnect you automatically.

To manually disconnect, run: `sudo killall openconnect`

## Futher topics

### Shortcut automation

Get [KeySmith](https://www.keysmith.app/).

Recreate this Shortcut:

![Screenshot-Keysmith-001308@2x](https://user-images.githubusercontent.com/106314688/224741223-7aa8b179-613c-49b8-907a-745b8d0aceed.png)

### Aliases in Terminal

It is also possible to wrap the execution of the script or parts of it in own commands - keyword "alias".

All commands may require the computer password.

The command `wwu-vpn-check` produces no output if the VPN is not active and returns the ID of the process if the VPN is active.

#### For zsh

Change File `~/.zshrc`:

```sh
alias wwu-vpn-connect="sh ~/Documents/scripts/wwu-vpn.sh" // depending on where the script is located
alias wwu-vpn-disconnect="sudo killall openconnect"
alias wwu-vpn-check="sudo pgrep openconnect"
```

#### For fish

Change file `~/.config/fish/config.fish`

```sh
alias wwu-vpn-connect "sh ~/Documents/scripts/wwu-vpn.sh" // depending on where the script is located
alias wwu-vpn-disconnect "sudo killall openconnect"
alias wwu-vpn-check "sudo pgrep openconnect"
```

## Feedback & Questions

Feedback and Questions are appreciated. Please open an issue.
