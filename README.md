# Creality 3DPrintMill CR-30 安裝 Klipper 
## 說明
基於創想盒子 Creality box 刷入 KlipperWrt
<br>KlipperWrt項目網址
<br>https://github.com/ihrapsa/KlipperWrt
<br>在開始之前，您應該了解 
<br>通常情況下，專門用於控制3D印表機的MCU有有限的、預先配置好的引腳來管理主要的列印功能（熱敏電阻、擠出機、步進器...）
<br>Klippe 將控制板上運行的經典“韌體”分為兩部分。一個是實際在控制板上運行的非常小的mcu韌體，
<br>另一個是使用安裝了Klippe的RPi作為輔助MCU
<br>這裡我們使用 創想盒子 Creality box 來替代 樹莓派（Raspberry Pi）


## 使用方法



# CR-30 Klipper 韌體
## 先決條件
<br>KlipperWrt 必須安裝到 Creality box上
<br>或
<br>Klipper 必須安裝到 Raspberry Pi 上

<br>建議從 常規 USB 電源為您的 Pi 供電較方便
<br>建議使用 USB 來控制 主板，只需在 主板 和 Pi 之間連接一條 USB-A 轉 USB-C 電纜即可。

## 構建MCU韌體
````
 sudo apt install make
 cd ~/klipper
````

您將需要一個有效的.config檔案來構建mcu檔案。獲取以下配置檔案：
````
curl https://raw.githubusercontent.com/BrownRhined/CR-30_klipper/main/config > .config
````

這將建立該.config文件，您現在可以運行：
````
make
````
<br>該make命令完成後會建立一個韌體檔案klipper.bin，該檔案存儲在資料夾/klipper/out/klipper.bin。
<br>有多種方法可以將此韌體檔案安裝到您的3D列印機主板上。
<br>將該檔案複製到 SD 卡並重命名為類似的名稱firmware.bin
<br>將 SD 卡放入 CR-30 的 SD 插槽中，然後將其關閉（等待 5 秒），然後重新打開。
<br>LCD 螢幕將保持空白，直到klipp PI 上的 python 程序開始加載mcu. 這個是正常的。
<br><br>
在 KlipperWrt 或 PI 上運行：
````
sudo service klipper restart
````
LCD 應該會活躍起來。
<br>此時，klipper正在運行並且 Mainsail 可以連接到/tmp/printer. 
<br>您還將有一個日誌檔案/tmp/klippy.log，您可以通過該檔案查看 Klipper 的最新情況。

如果出現問題，此日誌文件會告訴您原因。
