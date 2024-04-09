#!/bin/bash

gpu_status() {
  #output=$(nvidia-smi --format=csv,noheader,nounits --query-gpu=name,power.draw,fan.speed,utilization.gpu,temperature.gpu,memory.used,memory.total)
  local output=$(nvidia-smi --format=csv,noheader,nounits --query-gpu=temperature.gpu,memory.used,memory.total)

  IFS=',' read -r -a array <<< "$output"

  local temp=${array[0]// /}
  local used=${array[1]}
  local total=${array[2]}

  local free_memory_percentage=$(echo "scale=1; ($total - $used) * 100 / $total" | bc)
  echo "${free_memory_percentage}% $temp°C"
}

which nvidia-smi 2>&1 >/dev/null || i3status

i3status | while :
do
    read line
    gpu=$(gpu_status)
    echo "GPU: $gpu | $line" || exit 1
done
