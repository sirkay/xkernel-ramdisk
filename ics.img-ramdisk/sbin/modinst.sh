#!/sbin/sh

# Night-Elf: auto modules install script v3 (ICS) (Changed DooMLoRD Autoroot Script)
loading_modules()
{
	# Loading new module
	echo "[LOADING] Loading Wi-Fi Modules" >> /data/local/tmp/automodules.txt
	insmod /system/lib/modules/compat/compat.ko
	insmod /system/lib/modules/net/wireless/cfg80211.ko
	insmod /system/lib/modules/net/mac80211/mac80211.ko
	insmod /system/lib/modules/drivers/net/wireless/wl12xx/wl12xx.ko
	/system/bin/wlan_calibrator set upd_nvs /etc/tiwlan.ini /data/etc/wifi/fw
	/system/bin/insmod /system/lib/modules/drivers/net/wireless/wl12xx/wl12xx_sdio.ko
}

install_modules()
{
	# [CHECK] verify /system/lib/modules
	echo "[CHECK] verifying /system/lib/modules " >> /data/local/tmp/automodules.txt
	if /sbin/busybox [ ! -d /system/lib/modules ];
	then
		/sbin/busybox mkdir /system/lib/modules
	fi
	if /sbin/busybox [ ! -d /system/lib/modules/compat ];
	then
		/sbin/busybox mkdir /system/lib/modules/compat
	fi
	if /sbin/busybox [ ! -d /system/lib/modules/drivers ];
	then
		/sbin/busybox mkdir /system/lib/modules/drivers
	fi
	if /sbin/busybox [ ! -d /system/lib/modules/drivers/net ];
	then
		/sbin/busybox mkdir /system/lib/modules/drivers/net
	fi
	if /sbin/busybox [ ! -d /system/lib/modules/drivers/net/wireless ];
	then
		/sbin/busybox mkdir /system/lib/modules/drivers/net/wireless
	fi
	if /sbin/busybox [ ! -d /system/lib/modules/drivers/net/wireless/wl12xx ];
	then
		/sbin/busybox mkdir /system/lib/modules/drivers/net/wireless/wl12xx
	fi
	if /sbin/busybox [ ! -d /system/lib/modules/net ];
	then
		/sbin/busybox mkdir /system/lib/modules/net
	fi
	if /sbin/busybox [ ! -d /system/lib/modules/net/mac80211 ];
	then
		/sbin/busybox mkdir /system/lib/modules/net/mac80211
	fi
	if /sbin/busybox [ ! -d /system/lib/modules/net/wireless ];
	then
		/sbin/busybox mkdir /system/lib/modules/net/wireless
	fi
	# Change Permission for directory
	/sbin/busybox chmod 755 /system/lib/modules
	/sbin/busybox chmod 755 /system/lib/modules/compat
	/sbin/busybox chmod 755 /system/lib/modules/drivers
	/sbin/busybox chmod 755 /system/lib/modules/drivers/net
	/sbin/busybox chmod 755 /system/lib/modules/drivers/net/wireless
	/sbin/busybox chmod 755 /system/lib/modules/drivers/net/wireless/wl12xx
	/sbin/busybox chmod 755 /system/lib/modules/net
	/sbin/busybox chmod 755 /system/lib/modules/net/mac80211
	/sbin/busybox chmod 755 /system/lib/modules/net/wireless

	# [Install new Modules]
	echo "[Modules Installing]" >> /data/local/tmp/automodules.txt
	if /sbin/busybox [ -f /system/lib/modules/compat/compat_firmware_class.ko ];
	then
		/sbin/busybox rm /system/lib/modules/compat/compat_firmware_class.ko
	fi
	if /sbin/busybox [ -f /system/lib/modules/compat/compat.ko ];
	then
		/sbin/busybox rm /system/lib/modules/compat/compat.ko
	fi
	if /sbin/busybox [ -f /system/lib/modules/drivers/net/wireless/wl12xx/wl12xx.ko ];
	then
		/sbin/busybox rm /system/lib/modules/drivers/net/wireless/wl12xx/wl12xx.ko
	fi
	if /sbin/busybox [ -f /system/lib/modules/drivers/net/wireless/wl12xx/wl12xx_sdio.ko ];
	then
		/sbin/busybox rm /system/lib/modules/drivers/net/wireless/wl12xx/wl12xx_sdio.ko
	fi
	if /sbin/busybox [ -f /system/lib/modules/drivers/net/wireless/wl12xx/wl12xx_spi.ko ];
	then
		/sbin/busybox rm /system/lib/modules/drivers/net/wireless/wl12xx/wl12xx_spi.ko
	fi
	if /sbin/busybox [ -f /system/lib/modules/net/mac80211/mac80211.ko ];
	then
		/sbin/busybox rm /system/lib/modules/net/mac80211/mac80211.ko
	fi
	if /sbin/busybox [ -f /system/lib/modules/net/wireless/cfg80211.ko ];
	then
		/sbin/busybox rm /system/lib/modules/net/wireless/cfg80211.ko
	fi
	/sbin/busybox cp /res/modules/compat_firmware_class.ko /system/lib/modules/compat/compat_firmware_class.ko
	/sbin/busybox cp /res/modules/compat.ko /system/lib/modules/compat/compat.ko
	/sbin/busybox cp /res/modules/wl12xx.ko /system/lib/modules/drivers/net/wireless/wl12xx/wl12xx.ko
	/sbin/busybox cp /res/modules/wl12xx_sdio.ko /system/lib/modules/drivers/net/wireless/wl12xx/wl12xx_sdio.ko
	/sbin/busybox cp /res/modules/wl12xx_spi.ko /system/lib/modules/drivers/net/wireless/wl12xx/wl12xx_spi.ko
	/sbin/busybox cp /res/modules/mac80211.ko /system/lib/modules/net/mac80211/mac80211.ko
	/sbin/busybox cp /res/modules/cfg80211.ko /system/lib/modules/net/wireless/cfg80211.ko
	/sbin/busybox chown root.root /system/lib/modules/compat/compat_firmware_class.ko
	/sbin/busybox chown root.root /system/lib/modules/compat/compat.ko
	/sbin/busybox chown root.root /system/lib/modules/drivers/net/wireless/wl12xx/wl12xx.ko
	/sbin/busybox chown root.root /system/lib/modules/drivers/net/wireless/wl12xx/wl12xx_sdio.ko
	/sbin/busybox chown root.root /system/lib/modules/drivers/net/wireless/wl12xx/wl12xx_spi.ko
	/sbin/busybox chown root.root /system/lib/modules/net/mac80211/mac80211.ko
	/sbin/busybox chown root.root /system/lib/modules/net/wireless/cfg80211.ko
	/sbin/busybox chmod 644 /system/lib/modules/compat/compat_firmware_class.ko
	/sbin/busybox chmod 644 /system/lib/modules/compat/compat.ko
	/sbin/busybox chmod 644 /system/lib/modules/drivers/net/wireless/wl12xx/wl12xx.ko
	/sbin/busybox chmod 644 /system/lib/modules/drivers/net/wireless/wl12xx/wl12xx_sdio.ko
	/sbin/busybox chmod 644 /system/lib/modules/drivers/net/wireless/wl12xx/wl12xx_spi.ko
	/sbin/busybox chmod 644 /system/lib/modules/net/mac80211/mac80211.ko
	/sbin/busybox chmod 644 /system/lib/modules/net/wireless/cfg80211.ko

	# [DONE] placing flag
	echo "[DONE] placing flag" >> /data/local/tmp/automodules.txt
	if /sbin/busybox [ ! -f /res/modules/modules_version ];
	then
		echo "[ERROR] Automodules version file not found" >> /data/local/tmp/automodules.txt
		echo "[DONE] Make file" >> /data/local/tmp/automodules.txt
		/sbin/busybox touch /system/lib/modules/modules_version 
	else
		/sbin/busybox cp /res/modules/modules_version /system/lib/modules/modules_version
		/sbin/busybox chown root.root /system/lib/modules/modules_version
		/sbin/busybox chmod 644 /system/lib/modules/modules_version
	fi
}

modules_installed()
{
	echo "[FOUND] automodules file" >> /data/local/tmp/automodules.txt
	echo "Device has been already have modules" >> /data/local/tmp/automodules.txt
}

# [START] setting up
echo "[START] remounting system" > /data/local/tmp/automodules.txt
/sbin/busybox mount -o remount,rw /system >> /data/local/tmp/automodules.txt

# [CHECK] searching if automodules was done before
echo "[CHECK] searching for automodules file " >> /data/local/tmp/automodules.txt
if /sbin/busybox [ ! -f /system/lib/modules/modules_version ]; 
then
	install_modules
	loading_modules
else
    if /sbin/busybox [ ! -f /res/modules/modules_version ];
    then
	echo "[ERROR] Modules version file not found" >> /data/local/tmp/automodules.txt
	modules_installed
    else
	/sbin/busybox cmp /res/modules/modules_version /system/lib/modules/modules_version &> /dev/null
	if [ $? -ne 0 ];
	then
	    echo "[OLD MODULES FOUND] automodules file" >> /data/local/tmp/automodules.txt
	    /sbin/busybox rm /system/lib/modules/modules_version
	    install_modules
	    loading_modules
	else
		modules_installed
	fi
    fi
fi;

# [DONE] all done exiting
echo "[DONE] all done exiting" >> /data/local/tmp/automodules.txt
