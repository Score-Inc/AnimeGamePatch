# AnimeGamePatch
This Patch using [apk-mitm](https://github.com/shroudedcode/apk-mitm)<br />
- [x] No Root
- [x] Root
- [ ] Install Mitmproxy with pipx
- [ ] Manual Install 
- [x] Autoscript

# 3.1 Android
If you still want play 3.1 for Android go to [here](https://elaxan.com/NotMain/) and download with support using Termux

#### Download File
Download Termux from [F-Droid](https://f-droid.org/repo/com.termux_118.apk) [Recommend]

Download Anime Game Patch 3.0 from [Release](https://github.com/ElaXan/AnimeGamePatch/releases/tag/3.0)\
[OR YOU CAN DOWNLOAD FROM SCRIPT]

### FOR ROOT USERS
If you have no internet after run mitmproxy with script\
Just copy this command and paste to termux
```bash
su -c settings put global http_proxy :0
```

# Termux
#### Information
This need proxy settings on your phone. If you don't know about this go to [Proxy Settings](https://github.com/ElaXan/AnimeGamePatch#proxy-settings).\
if your phone is Rooted, no need to do that. but turn on the Change Proxy in Settings Script

#### Install
1. Enter command :\
`termux-setup-storage`
* Just allow it like this picture :
<img src="termuximg/termux-setup-storage.png" width="350">

2. Enter command : <br />

`termux-change-repo`\
~ Press on [OK] or Enter on your keyboard <br />
~ Select "Mirrors by A1batross" then Press [OK] <br />
* Do same like this Picture :
<img src="termuximg/termux-change-repo.png" width="350"/>

3. Enter command : <br />

```bash
pkg update && curl -Ls https://raw.githubusercontent.com/ElaXan/AnimeGamePatch/main/install.sh | bash
```
<br />
4. Enter command : <br />

```zex```
<br />~ If ask "motd (Y/I/N/O/D/Z) [default=N] ?" <br />
press Enter on your Keyboard <br />
<br />5. Script will install some package/program if it not installed
<br />6. DONE

# Wiki
For More go to [WIKI](https://github.com/Score-Inc/AnimeGamePatch/wiki)