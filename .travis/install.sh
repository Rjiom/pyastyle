#!/bin/bash

set -e
set -x

if [[ "$(uname -s)" == 'Darwin' ]]; then
    DARWIN=true
else
    DARWIN=false
fi

if [[ "$DARWIN" = true ]]; then
    brew update

    if which pyenv > /dev/null; then
        eval "$(pyenv init -)"
    fi

    case "${TOXENV}" in
        py32)
            brew upgrade pyenv
            pyenv install 3.2.5
            pyenv global 3.2.5
            ;;
        py33)
            brew upgrade pyenv
            pyenv install 3.3.5
            pyenv global 3.3.5
            ;;
        py34)
            brew upgrade pyenv
            pyenv install 3.4.3
            pyenv global 3.4.3
            ;;
        py35)
            brew upgrade pyenv
            pyenv install 3.5.0
            pyenv global 3.5.0
            ;;
        py36)
            brew upgrade pyenv
            pyenv install 3.6.0
            pyenv global 3.6.0
            ;;
        py37)
            brew upgrade pyenv
            pyenv install 3.7.0
            pyenv global 3.7.0
            ;;
    esac

    pyenv rehash

else
    sudo add-apt-repository -y ppa:jonathonf
    sudo apt-get -y update

    case "${TOXENV}" in
        py32)
            sudo apt-get install python3.2 python3.2-dev
            ;;
        py33)
            sudo apt-get install python3.3 python3.3-dev
            ;;
        py34)
            sudo apt-get install python3.4 python3.4-dev
            ;;
        py35)
            sudo apt-get install python3.5 python3.5-dev
            ;;
        py36)
            sudo apt-get install python3.6 python3.6-dev
            ;;
        py37)
            sudo apt-get install python3.7 python3.7-dev
            ;;
    esac
fi

sudo pip install virtualenv
virtualenv ~/.venv
source ~/.venv/bin/activate
pip install tox
