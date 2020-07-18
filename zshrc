# configure proxy server
export PROXY=192.168.88.74:7890
alias setproxy="export HTTP_PROXY=${PROXY}; export HTTPS_PROXY=${PROXY}"
alias unsetproxy="unset HTTP_PROXY; unset HTTPS_PROXY"

# command alias
alias vi=vim
