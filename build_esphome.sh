docker exec -it ab66665fa6d8 bash
cd config/esphome
export ESPHOME_IS_HA_ADDON=true
pio_cache_base=/data/cache/platformio
export PLATFORMIO_PLATFORMS_DIR="${pio_cache_base}/platforms"
export PLATFORMIO_PACKAGES_DIR="${pio_cache_base}/packages"
export PLATFORMIO_CACHE_DIR="${pio_cache_base}/cache"
export PLATFORMIO_GLOBALLIB_DIR=/piolibs
for config in *.yaml
do
  echo "----- COMPILE ----- $config -----"
  if esphome compile $config
  then 
    echo "----- UPLOAD ----- $config -----"
    esphome upload $config --device ${config%.*}.local
  fi
done