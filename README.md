# AnimeGamePatch
For who have Android 8 or crash issue can try use this Patch.<br />
This Patch using [apk-mitm](https://github.com/shroudedcode/apk-mitm)

## Download File
Download Termux from [F-Droid](https://f-droid.org/repo/com.termux_118.apk) <br />
Download Anime Game Patch from [Release](https://github.com/ElaXan/AnimeGamePatch/releases/tag/2.7) <br />

## Termux
* This need proxy settings on your phone. No need install cert on your phone but follow the script said until it success. If you don't know about this go to google how to set proxy on your phone. Mobile Data just change the APN (Access Point Name)
1. Enter : ```termux-setup-storage``` <br />
2. Enter : ```termux-change-repo``` <br />
~ Press on [OK] or Enter on your keyboard <br />
~ Select "Mirrors by A1batross" then Press [OK] <br />
3. Enter : 
```bash
cd && pkg install git && git clone https://github.com/ElaXan/AnimeGamePatch.git && cd AnimeGamePatch && bash install.sh
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
<br />Q. Why preparing data 0% (stuck)?
<br />A. Please change your data Genshin at /sdcard/Android/data. Change it to ```com.miHoYo.GenshinImpactzex```, then try open the app
<br />
<br />Q. Why i got error when i install from [Termux](https://github.com/ElaXan/AnimeGamePatch/edit/main/README.md#termux)?
<br />A. Try change your repo termux using ```termux-change-repo``` and follow [this](https://github.com/ElaXan/AnimeGamePatch/edit/main/README.md#termux) step again<br />
<br />If doesn't work you can join [Discord Server](https://discord.gg/GenshinPS) and go to Support-Channel and send the screenshot error
