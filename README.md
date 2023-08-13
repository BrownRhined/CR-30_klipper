# Creality 3DPrintMill CR-30 安裝 Klipper 
## 說明
基於創想盒子 Creality box 刷入 KlipperWrt
KlipperWrt項目網址
<br>[https://github.com/Hao-Luo/](https://github.com/ihrapsa/KlipperWrt)
在開始之前，您應該了解 
通常情況下，專門用於控制3D印表機的MCU有有限的、預先配置好的引腳來管理主要的列印功能（熱敏電阻、擠出機、步進器...）
Klippe 將控制板上運行的經典“韌體”分為兩部分。一個是實際在控制板上運行的非常小的mcu韌體，
另一個是使用安裝了Klippe的RPi作為輔助MCU
這裡我們使用 創想盒子 Creality box 來替代 樹莓派（Raspberry Pi）


## 使用方法



# CR-30 Klipper 韌體
## 先決條件
KlipperWrt 必須安裝到 Creality box上
或
Klipper 必須安裝到 Raspberry Pi 上

建議從 常規 USB 電源為您的 Pi 供電較方便
建議使用 USB 來控制 主板，只需在 主板 和 Pi 之間連接一條 USB-A 轉 USB-C 電纜即可。

## 構建MCU韌體
````
 sudo apt install make
 cd ~/klipper
````
