# AnimeGamePatch
This Patch using [apk-mitm](https://github.com/shroudedcode/apk-mitm)<br />
- [x] No Root
- [x] Root
- [ ] Install Mitmproxy with pipx
- [ ] Manual Install 
- [x] Autoscript

# 3.1 Android
If you still want play 3.1 for Android go to [here](https://elaxan.com/NotMain/) and download with support using Termux

# GCAndroid
Want play localhost on your android phone?\
Go to [GCAndroid](https://github.com/Score-Inc/GCAndroid)

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

# No Termux
No Termux or mitmproxy go to [YuukiProxy](https://github.com/ElaXan/YuukiProxy)

# Termux
#### Information
This need proxy settings on your phone. If you don't know about this go to [Proxy Settings](https://github.com/ElaXan/AnimeGamePatch#proxy-settings).\
if your phone is Rooted, no need to do that. but turn on the Change Proxy in Settings Script

#### Termux Command
<details markdown='1'><summary>How to</summary>

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

</details>

# Shortcut Commands
Commands for ```zex```
#### zex 1
install mitmproxy
#### zex 2
for get certificate
#### zex 3
Download Genshin .apk
#### zex 4
Run Mitmproxy
#### zex 5
Download proxy.py and proxy_config.py
#### zex 6
Install certificate to .apk
#### zex 7
For Settings

# Proxy Settings
#### Mobile data
<details markdown='1'><summary>How to</summary>

go to settings and use search function, and search word `Access point Name` and click on **+**. Then enter Proxy and Port as like this picture :

<img src="img/apnmobiledata.png" width="350"/>

</details>


#### WiFi
<details markdown='1'><summary>How to</summary>
For WiFi just follow this picture : <br />

**Step 1**\
<img src="img/wifiproxy1.png" width="350"/>\
**Step 2**\
<img src="img/wifiproxy2.png" width="350"/>\
**Step 3**\
<img src="img/wifiproxy3.png" width="350"/>\
**Step 4**\
<img src="img/wifiproxy4.png" width="350"/>\
**Step 5**\
<img src="img/wifiproxy5.png" width="350"/>\
**Step 6**\
<img src="img/wifiproxy6.png" width="350"/>

</details>

# Install certificate on your phone
#### Get certificate
You can get certificate by running `zex 2` command

#### Install Certificate 
<details markdown='1'><summary>How to</summary>
First open settings and search "CA Certificate" then follow this picture step by step<br />
<img src="imgcert/installcert1.png" width="350"/><br />

**Step 2**<br />
<img src="imgcert/installcert2.png" width="350"/><br />
**Step 3**<br />
<img src="imgcert/installcert3.png" width="350"/><br />
**Step 4**<br />
<img src="imgcert/installcert4.png" width="350"/><br />
**Step 5**(Done install certificate)<br />
<img src="imgcert/installcert5.png" width="350"/>

</details>

# FAQ
<details markdown='1'><summary>Faq List</summary>

#### How to play again? Does i need to follow [this](https://github.com/ElaXan/AnimeGamePatch/edit/main/README.md#termux) step again?
No. just enter command ```zex 4``` then play Anime Game

#### I want to play other server. How to change server?
Change a Custom Server in Settings Script by running command `zex 7`

#### Why it said "Password error" or trying enter username and password?
Check your Proxy settings on your phone

#### Why am I still on the original server?
Hmmm.. check your proxy on Settings. Set proxy to<br />Hostname : **127.0.0.1**<br />Port : **8080**<br />After set the Proxy go back to Termux and run command ```zex```

#### Why i got Data Error?
Because maybe you not setting proxy to<br /> Hostname : **127.0.0.1**<br />Port : **8080**<br />Try settings proxy and run ```zex 4```

#### Why 0% Stuck loading?
Your data is missing, check it on settings app info, if less than 18GB or more you need to download again from original server

#### Why i got error when i install from [Termux](https://github.com/ElaXan/AnimeGamePatch/edit/main/README.md#termux)?
Try change your repo termux using ```termux-change-repo``` and follow [this](https://github.com/ElaXan/AnimeGamePatch#termux) step again<br />


</details>
