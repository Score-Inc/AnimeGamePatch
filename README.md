# AnimeGamePatch
For who have Android 8 or crash issue can try use this Patch.<br />
This Patch using [apk-mitm](https://github.com/shroudedcode/apk-mitm)

## Download File
Download Termux from [F-Droid](https://f-droid.org/repo/com.termux_118.apk) <br />
Download Anime Game Patch from [Release](https://github.com/ElaXan/AnimeGamePatch/releases) (Outdated!) <br />

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
~ If ask "motd (Y/I/N/O/D/Z) [default=N] ?" <br />
Press ```N``` on your keyboard then Enter on your Keyboard <br />
<br />4. If done install and ask exit. Exit/Close Termux using command ```exit 0``` then enter <br />
5. Open Termux<br />
6. Enter :
```bash
bash AnimeGamePatch/install2.sh
```
<br />7. Follow what script said
<br />8. DONE✓

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

## FAQ
Q. How to play again? Does i need to follow [this](https://github.com/ElaXan/AnimeGamePatch/edit/main/README.md#termux) step again?
<br />A. No. just enter command ```bash zex.sh``` then play Anime Game
<br />
<br />Q. I want to play other server. How to change server?
<br />A. Using command ```bash zdom.sh``` and enter the server you want play!
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
<br />Q. Why i got error when i install from [Termux](https://github.com/ElaXan/AnimeGamePatch/edit/main/README.md#termux)?
<br />A. Try change your repo termux using ```termux-change-repo``` and follow [this](https://github.com/ElaXan/AnimeGamePatch#termux) step again<br />
