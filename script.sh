#!/bin/sh
user=$3

cd /home/$user
curl -s https://raw.githubusercontent.com/actions/runner/main/scripts/create-latest-svc.sh > create-latest-svc.sh
chown $user:$user /home/$user/create-latest-svc.sh
chmod 750 /home/$user/create-latest-svc.sh
export RUNNER_CFG_PAT=$2

# Check if the fifth argument is provided
if [ -n "$5" ]; then
    bash "/home/$user/create-latest-svc.sh" -s $1 -u $user -l $4 -r $5
else
    bash "/home/$user/create-latest-svc.sh" -s $1 -u $user -l $4
fi
