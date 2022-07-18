# AnimeGamePatch
For who have Android 8 or crash issue can try use this Patch.<br />
This Patch using [apk-mitm](https://github.com/shroudedcode/apk-mitm)<br />
<br />Feel free dm me on [Telegram](https://t.me/ElashXander) If you want need help how to use this or have issue install


## This just for only install mitmproxy
Maybe for now just for install mitmproxy and change a server as you want<br />
This good for beginner/who don't know about Termux

## Download File
Download Termux from [F-Droid](https://f-droid.org/repo/com.termux_118.apk) [Recommend] <br /><br />
Download Anime Game Patch 2.8 from [Release](https://github.com/ElaXan/AnimeGamePatch/releases) <br />

## Termux
* This need proxy settings on your phone. ~~No need install cert on your phone but follow the script said until it success.~~ If you don't know about this go to [Proxy Settings](https://github.com/ElaXan/AnimeGamePatch#proxy-settings).
1. Enter : ```termux-setup-storage``` <br />
* Just allow it like this picture :
![](termuximg/termux-setup-storage.png)
2. Enter : ```termux-change-repo``` <br />
~ Press on [OK] or Enter on your keyboard <br />
~ Select "Mirrors by A1batross" then Press [OK] <br />
* Do same like this Picture :
![](termuximg/termux-change-repo.png)
3. Enter : 
```bash
cd; pkg install git; git clone https://github.com/ElaXan/AnimeGamePatch.git; cd AnimeGamePatch; binary="/data/data/com.termux/files/usr/bin/zex" && mv zex.sh $binary; chmod 775 $binary; clear; echo "Please enter command zex for run the code!"
```
4. Enter :
```bash
zex ins
```
~ If ask "motd (Y/I/N/O/D/Z) [default=N] ?" <br />
Press ```N``` on your keyboard then Enter on your Keyboard <br />
<br />5. If done install and ask exit. Exit/Close Termux using command ```exit 0``` then enter <br />
6. Open Termux<br />
7. Enter :
```bash
zex ins2
```
<br />8. Follow what script said
<br />9. DONE✓

# Command
```
zex: invalid option
    zex Usage : zex ins / dom / ins2 / run

    ins : Install program at begining
    ins2 : when you already using zex ins then use ins2
    dom : change a server/domain
    run : run a mitmproxy                               
This script was made by @ElashXander (Telegram) this not easy to use this but, why not to try learn this?
```

```zex ins``` : for install / update program<br />
```zex ins2``` : install mitmproxy<br />
```zex run``` : run a proxy for play Anime Game<br />
```zex dom``` : change a domain/server<br />

# Proxy Settings
* Mobile data go to settings and use search function, and search word ```Access point Name``` and click on **+**. Then enter Proxy and Port as like this picture :
![](img/apnmobiledata.png)

* For WiFi just follow this picture : 
<br />**Step 1**
![Never](img/wifiproxy1.png)
**Step 2**
![Gonna](img/wifiproxy2.png)
**Step 3**
![Give](img/wifiproxy3.png)
**Step 4**
![You](img/wifiproxy4.png)
**Step 5**
![UP](img/wifiproxy5.png)
**Step 6**
![HEHE](img/wifiproxy6.png)

# Install certificate on your phone
* First open settings and search "CA Certificate" then follow this picture step by step
![Never](imgcert/installcert1.png)
* Step 2
![Gonna](imgcert/installcert2.png)
* Step 3
![Give](imgcert/installcert3.png)
* Step 4
![You](imgcert/installcert4.png)
* Step 5 (Done install certificate)
![UP](imgcert/installcert5.png)

## FAQ
Q. How to play again? Does i need to follow [this](https://github.com/ElaXan/AnimeGamePatch/edit/main/README.md#termux) step again?
<br />A. No. just enter command ```zex run``` then play Anime Game
<br />
<br />Q. I want to play other server. How to change server?
<br />A. Using command ```zex dom``` and enter the server you want play!
<br />
<br />Q. Why it said "Password error" or trying enter username and password?
<br />A. Check your Proxy settings on your phone
<br />
<br />Q. Why am I still on the original server?
<br />A. Hmmm.. check your proxy on Settings. Set proxy to<br />Hostname : **127.0.0.1**<br />Port : **8080**<br />After set the Proxy go back to Termux and run command ```bash zex.sh```
<br />
<br />Q. Why i got Data Error?
<br />A. Because you may the proxy not setting to<br /> Hostname : **127.0.0.1**<br />Port : **8080**<br />Try settings proxy and run ```bash zex.sh```
<br />
<br />Q. Why 0% Stuck loading?
<br />A. Your data is missing, check it on settings app info, if less than 15GB (I think) you need to download again from original server
<br />
<br />Q. Why i got error when i install from [Termux](https://github.com/ElaXan/AnimeGamePatch/edit/main/README.md#termux)?
<br />A. Try change your repo termux using ```termux-change-repo``` and follow [this](https://github.com/ElaXan/AnimeGamePatch#termux) step again<br />
