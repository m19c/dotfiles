export GOPRIVATE="github.com/digitalegarage"
export GO111MODULE=on
export GOBIN=~/Development/go/bin
export PATH=$PATH:~/Development/go/bin

eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
