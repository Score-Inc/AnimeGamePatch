
# AnimeGamePatch
Untuk yang punya Android 8 atau masalah crash bisa coba patch ini.

Patch ini pake [apk-mitm](https://github.com/shroudedcode/apk-mitm)

Jangan ragu buat DM saya di [Telegram](https://t.me/ElashXander) Jika lu ada masalah install ini atau tidak tau cara pakenya
- [x] No Root
- [ ] Root Metode
- [x] Install Mitmproxy
- [ ] Manual Install 
- [x] Autoscript

#### Ini hanya untuk install Mitmproxy
Mungkin untuk sekarang cuman untuk install mitmproxy dan ganti server sesuai kalian mau

Ini bagus buat pemula/tidak tau dengan termux. KALAU IKUTI CARA PAKENYA DI [SINI](https://github.com/ElaXan/AnimeGamePatch#termux)

#### Download File
Download Termux di [F-Droid](https://f-droid.org/repo/com.termux_118.apk) [Rekomendasi]

Download Anime Game Patch 2.8 di [Release](https://github.com/ElaXan/AnimeGamePatch/releases) <br />


# No Termux
Tanpa Termux atau mitmproxy bisa ke [YuukiProxy](https://github.com/ElaXan/YuukiProxy)

# Termux
#### Information
Ini butuh proxy setting di hp lu. ~~Ga perlu install cert di hp lu tapi ikuti script katakan sampai berhasil~~ Jika lu ga tau cara setting proxy bisa ke [Proxy Settings](https://github.com/ElaXan/AnimeGamePatch#proxy-settings).

### Cara pake?
1. Masukin command :\
`termux-setup-storage`
* Terima aja kayak di foto ini :
<img src="termuximg/termux-setup-storage.png" width="350">

2. Masukin command :\
`termux-change-repo`\
~ Klik [OK] atau Enter di keyboard lu\
~ Pilih "Mirrors by A1batross" lalu pencet [OK]
* Lakuin kayak di Foto ini :

<img src="termuximg/termux-change-repo.png" width="350"/>

3. Copy ini dan paste di Termux :

```bash
pkg update && curl -Ls https://raw.githubusercontent.com/ElaXan/AnimeGamePatch/main/install.sh | bash
```
<br />
4. Lalu masukin command :

`zex`\
~ Lalu pilih nomor 1\
~ Jika ada "motd (Y/I/N/O/D/Z) [default=N] ?"\
Enter di keyboard lu
<br />5. Ikuti Script harus ngapain
<br />6. Udah, Berhasil install

# Shortcut Commands
Command untuk `zex`
#### zex 1
install program dan mitmproxy
#### zex 2
Ganti server atau domain
#### zex 3
Jalanin mitmproxy buat main

# Proxy Settings
#### Mobile data
Buka pengaturan dan pakai fitur pencarian, dan cari : `Nama titik akses` dan pencet **+**. Dan masukin proxy dan port sesuai foto ini :

<img src="img/apnmobiledata.png" width="350"/>

#### WiFi
Untuk WiFi ikuti langkah ini :\
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

# Install certificate on your phone
#### Download certificate
Ke [mitm.it](http://mitm.it) tapi settings proxy di hp lu dulu liat [cara settings](https://github.com/ElaXan/AnimeGamePatch#proxy-settings)
Dan jalanin `mitmdump --ssl-insecure` di Termux dan buka [mitm.it](http://mitm.it)

#### Install Certificate 
Pertama buka pengaturan dan cari "CA Certificate" lalu ikuti foto ini<br />
<img src="imgcert/installcert1.png" width="350"/><br />
**Step 2**<br />
<img src="imgcert/installcert2.png" width="350"/><br />
**Step 3**<br />
<img src="imgcert/installcert3.png" width="350"/><br />
**Step 4**<br />
<img src="imgcert/installcert4.png" width="350"/><br />
**Step 5**(Berhasil install)<br />
<img src="imgcert/installcert5.png" width="350"/>

# FAQ
#### Bagaimana main lagi? Apakah harus ikuti [ini](https://github.com/ElaXan/AnimeGamePatch/edit/main/README.md#termux) lagi?
Ga. Masukin command `zex run` Lalu buka Gamenya

#### Gw mau main server lain. Cara ubahnya gimana?
Pakai command `zex dom` pilih nomor **4** dan masukin server lu mau main!

#### Kenapa "Password error" atau mencoba masukin username dan Password?
Check proxy di hp LU

#### Kenapa gw masih di Original Server?
Hmmm.. check proxy di pengaturan. Atur proxy ke\
Hostname : **127.0.0.1**\
Port : **8080**\
Kalau sudah atur Proxy buka Termux dan masukin command `bash zex.sh`

#### Kenapa Data Error?
Mungkin karena proxy lu ga di setting ke\
Hostname : **127.0.0.1**\
Port : **8080**\
Coba atur proxy dan masukin command `zex run`

#### Kenapa 0% loading?
Genshin data lu ilang, cek di pengaturan info aplikasi, jika kurang dari 15GB (mungkin) lu download ulang di Official Server lagi

#### Kenapa error ketika gw install di [Termux](https://github.com/ElaXan/AnimeGamePatch/edit/main/README.md#termux)?
Coba ubah repo termux pakai `termux-change-repo` dan ikuti [ini](https://github.com/ElaXan/AnimeGamePatch#termux) lagi
