# ~/.bash_profile: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

for file in ~/bash/*.sh; do
    source $file
done

if [ -f ~/.aws/credentials ]; then
    export AWS_KEY=$(head -3 ~/.aws/credentials| awk '/aws_access_key_id/ { print $NF }')
    export AWS_ACCESS_KEY_ID=$(head -3 ~/.aws/credentials| awk '/aws_access_key_id/ { print $NF }')
    export AWS_SECRET=$(head -3 ~/.aws/credentials| awk '/aws_secret_access_key/ { print $NF }')
    export AWS_SECRET_ACCESS_KEY=$(head -3 ~/.aws/credentials| awk '/aws_secret_access_key/ { print $NF }')
fi

source ~/.profile
