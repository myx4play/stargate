#! /bin/sh

##you must change mod this script first
##chmod a+x client_enable_script.sh
##require open ssh (sharing Remote Login) 

user=$(whoami)
config=$(cat ip)
hamachiIp="25.23.7.185"

commandSSH=""

for c in $config ; do
  source=$(echo $c | sed 's/--.*//')
  target=$hamachiIp:$(echo $c | sed 's/.*--//')
  commandSSH="$commandSSH -L $source:$target"
done

commandSSH="ssh -fN $commandSSH $user@0.0.0.0"
# echo $commandSSH
sudo $commandSSH
echo $(ps -ef | grep ssh.*$(echo $(cat ip | head -1 | sed 's/:.*//')))
