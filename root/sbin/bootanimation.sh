#!/sbin/sh

if [ ! -f /data/local/bootanimation.zip ] && [ ! -f /system/media/bootanimation.zip ];
then
    exec /system/bin/samsungani
else
    exec /system/bin/bootanimation
fi

