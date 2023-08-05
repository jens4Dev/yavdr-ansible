# my-optiplex-vdr-main

Dies ist das playbook-Repository für meinen aktuell "neuen" VDR, basierend auf einem Dell Optiplex 5060. Ziel ist ein schnelles Setup nach meinen Wünschen inkl. einer 
weitgehenden VDR-Konfiguration.

Dabei habe ich versucht, die Erweiterungen thematisch zu trennen. Manches könnte ich mir auch im Upstream vom yavdr-ansible vorstellen - dazu sollte ich dann
mal Pull-Requests stellen... Jedes "Thema" hat so einen eigenen Branch basierend auf dem focal-Branch vom Upstream. Branches mit my-xx sind spezifisch für mich, die anderen sollten
allgemein relevant sein. Dass heißt (für mich), dass ich Änderungen immer im jeweiligen Branch vornehme und dann per merge in den my-optiplex-vdr-main überführe - der
beinhaltet also alles. Damit muss ich zum Aufsetzen "meines" VDR nur noch ```git clone -b my-optiplex-vdr-main https://github.com/jens4Dev/yavdr-ansible/``` ausführen. 
Es sind dort nämlich auch die Anpassungen in der host_vars/localhost und eine passende channels.conf drin.

## Hardware

Der Dell Optiplex 5060 ist gebraucht von einem Aufbereiter und hat einen Core i5 8500 mit 8GB Hauptspeicher. Das Gehäuse ist vom Typ SFF und ist so einerseits kompakt, hat aber 
noch einen Schacht 
für eine 3,5" HDD als 3,5 GB "Videograb". Bootplatte ist eine mSATA mit 240GB in vier Partitionen: zwei (potentielle) Systempartitionen á 80GB für einen A/B-Betrieb, eine 
Swap-Partition (ws. nicht wirklich notwendig) mit 16GB und eine Restpartition - vielleicht mal als schnelle Zwischenspeicherung, Live-Puffer oder so etwas.

Ausgabe erfolgt über die Chipsatz-Grafik und braucht so das softhdvaapi-Plugin.

Für die Fernbedienung kommt ein FLIRC-USB-Sensor zum Einsatz, weil ich nach den ganzen Bastel-LIRCs der letzten Jahre mal was optisch sauberes haben wollte. 
Wirklich überzeugend ist es nicht, insgesamt ließ es sich aber hinbiegen zusammen mit meiner geliebten Logitech Harmony (die hoffentlich noch lange lebt...).

TV-Empfang erfolgt über einen Hauppauge WinTV-dualHD TV-Stick am digitalen Kabelanschluss.

## Branches

### focal

Main-Branch vom yavdr-ansible Projekt.

### my-optiplex-vdr-main

"Merge-Branch" von den ganzen Themen-Branches - mein Main.

### my-initial-vdr-config

Anpassungen an der setup.conf wie ich es gern mag (Skin, Plugin-Einstellungen usw.).

### my-vdr-utils

Ein paar zusätzliche Helferlein wie Shell-Aliase, ein Skindesigner-Skript für die Hardware-Daten des Optiplex, ein Skript zum regelmässigen EPG-Scan per 
Wakeup-Timer-Setting und einem Cron-Eintrag für die Tage (dynamisch als localhost übernommen). Außerdem sync2sys, um das aktuelle System bootfähig auf die
zweite Systempartition zu clonen und zwei Skripte zum Konvertieren zwischen VDR- und MP4-Files.

### add-menuorg-softhdvaapi

Fix: nutzt man das softhdvaapi-Plugin für Intel, dann wird das Plugin-Menü sonst nicht per Menuorg in die Settings verschoben, sondern geistert im Hauptmenü herum.

### auto-switch-softhdvaapi

Addon: automatische Erkennung der Intel-Grafik mit Wechsel auf das softhdvaapi-Plugin. Damit läuft Intel (bei mir) OOTB.

### extend-remote-conf

Addon: Entfernen von ein paar doppelt belegten Tasten aus der yavdr-remote.conf und Ergänzung, damit es mit dem FLIRC-KODI-Profil passt. Leider nicht ganz generisch
geworden, weil FLIRC doch etwas biestiger ist als gedacht...

### vdr-transcode

WiP: Einbindung von [VDR-Transcode](https://github.com/jsffm/vdr-transcode). Soll auf Dauer per VDR-Menü bedienbar sein: Starten des Transcode-Server-"Dienst", Markieren
zum Transcode usw. Aktuell wird die aktuelle Version auf dem GIT bei der Installation gezogen, nach /usr/local/bin kopiert und das $VIDEODIR passend dymamisch per
anisible gesetzt.

### wintv-new-fw

Addon: Meine WinTV-dualHD braucht eine andere Firmware, die im yavdr-ansible bisher nicht via USB-ID erkannt und installiert wurde.
