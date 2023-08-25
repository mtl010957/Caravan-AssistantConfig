docker exec -it ab66665fa6d8 bash
cd config/esphome
export ESPHOME_IS_HA_ADDON=true
for config in smoke-*.yaml
do
  echo "----- COMPILE ----- $config -----"
  if esphome compile $config
  then 
    echo "----- UPLOAD ----- $config -----"
    esphome upload $config --device ${config%.*}.local
  fi
done