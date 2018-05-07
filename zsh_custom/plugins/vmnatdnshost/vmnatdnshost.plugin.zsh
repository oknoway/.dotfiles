function vmnatdnshost() {
  zsh $ZSH_CUSTOM/plugins/vmnatdnshost/vmnatdnshost.sh $@
}

function myip() {
  prompt_ip
}


function get_ip() {

  local interfaces callback
  # Get network interface names ordered by service precedence.
  networksetup -listnetworkserviceorder
  #interfaces=$(networksetup -listnetworkserviceorder | grep -o "Device:\s*[a-z0-9]*" | grep -o -E '[a-z0-9]*$')
  #callback='ipconfig getifaddr $item'

  ip=$(getRelevantItem "$interfaces" "$callback")

  echo $ip
  return $ip
}
