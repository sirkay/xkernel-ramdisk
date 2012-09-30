#!/sbin/sh

# starting
echo "[ START ]" > /data/local/tmp/log_doom-mods.log
echo "" >> /data/local/tmp/log_doom-mods.log

# execute tweaks
/system/bin/logwrapper /sbin/busybox run-parts /res/scripts
# execute FPS limit remove
/sbin/mount -t debugfs debugfs /sys/kernel/debug
/sbin/echo '0' > /sys/kernel/debug/msm_fb/0/vsync_enable
/sbin/umount /sys/kernel/debug
echo "FPS limit successfully removed " >> /data/local/tmp/log_doom-mods.log

# DONE
echo "" >> /data/local/tmp/log_doom-mods.log
echo "[ DONE ]" >> /data/local/tmp/log_doom-mods.log
