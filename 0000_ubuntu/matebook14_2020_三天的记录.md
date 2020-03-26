### 华为matebook14 安装 ubuntu18的一些问题记录

## 输入法 （google输入法）

```bash
sudo apt-get install fcitx
im-config
sudo apt-get install fcitx-googlepinyin
# 重启
sudo reboot
fcitx-config-gtk3
```

## 触摸板无法右键 （导致这个问题是因为ubuntu默认MAC的触摸板）
```bash
gsettings set org.gnome.desktop.peripherals.touchpad click-method areas
```

## 网卡驱动 （Intel和Ubuntu不得不说的故事，整整弄了三天。。。）
```bash
sudo apt-get install git
git clone https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/backport-iwlwifi.git
cd backport-iwlwifi
make defconfig-iwlwifi-public
sed -i 's/CPTCFG_IWLMVM_VENDOR_CMDS=y/# CPTCFG_IWLMVM_VENDOR_CMDS is not set/' .config
make -j4
sudo make install
sudo reboot
# 重启，然后无线网卡能用了
# 唯一庆幸得是以后Intel的网卡都可以这么操作了
```
