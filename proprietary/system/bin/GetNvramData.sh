#!/system/bin/sh

log "[GetNvramData] START..."

WIFI_MAC=$(qcinvram_lite wifi getmac)
WIFI_COUNTRYCODE=$(qcinvram_lite wifi getcountrycode)
BT_MAC=$(qcinvram_lite bt getmac)
SMT_SN=$(qcinvram_lite sn getsmt)
DEV_SN=$(qcinvram_lite sn getdev)
FA_SN=$(qcinvram_lite sn getfa)
SKU_SN=$(qcinvram_lite sn getsku)
#ALS_KADC=$(qcinvram_lite sensor get als kadc)
#ALS_OFFSET=$(qcinvram_lite sensor get als offset)
GSENSOR_X=$(qcinvram_lite sensor get gsensor axisx)
GSENSOR_Y=$(qcinvram_lite sensor get gsensor axisy)
GSENSOR_Z=$(qcinvram_lite sensor get gsensor axisz)
#HDCP_KEY=$(qcinvram_lite hdcp getkey)

echo "$WIFI_MAC" > /data/local/tmp/WIFI_MAC
echo "$WIFI_COUNTRYCODE" > /data/local/tmp/WIFI_COUNTRYCODE
echo "$BT_MAC" > /data/local/tmp/BT_MAC
echo "$SMT_SN" > /data/local/tmp/SMT_SN
echo "$DEV_SN" > /data/local/tmp/Dev_SN
echo "$FA_SN" > /data/local/tmp/FA_SN
echo "$SKU_SN" > /data/local/tmp/SKU_SN
#echo "$ALS_KADC" > /data/local/tmp/ALS_KADC
#echo "$ALS_OFFSET" > /data/local/tmp/ALS_OFFSET

## copy gsensor data for backup and offset compensation
echo "$GSENSOR_X" > /data/local/tmp/G_AXISX
echo w 0x38 $GSENSOR_X > /sys/devices/platform/gsensor/driver/iicrw
echo "$GSENSOR_Y" > /data/local/tmp/G_AXISY
echo w 0x39 $GSENSOR_Y > /sys/devices/platform/gsensor/driver/iicrw
echo "$GSENSOR_Z" > /data/local/tmp/G_AXISZ
echo w 0x3a $GSENSOR_Z > /sys/devices/platform/gsensor/driver/iicrw

#chmod 0664 /data/local/tmp/ALS_KADC
#chmod 0664 /data/local/tmp/ALS_OFFSET
chmod 0664 /data/local/tmp/BT_MAC
chmod 0664 /data/local/tmp/Dev_SN
chmod 0664 /data/local/tmp/FA_SN
#chmod 0664 /data/local/tmp/OutputHDCPKey.bin
chmod 0664 /data/local/tmp/SMT_SN
chmod 0664 /data/local/tmp/SKU_SN
chmod 0664 /data/local/tmp/WIFI_MAC
chmod 0664 /data/local/tmp/WIFI_COUNTRYCODE
#chmod 0664 /data/local/tmp/G_AXISX
#chmod 0664 /data/local/tmp/G_AXISY
#chmod 0664 /data/local/tmp/G_AXISZ

log "[GetNvramData] done"

