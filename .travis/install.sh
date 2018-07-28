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
    #sudo add-apt-repository -y ppa:jonathonf
    #sudo apt-get -y update

    case "${TOXENV}" in
        py32)
            sudo add-apt-repository -y ppa:jonathonf/python3.2
            sudo apt-get install python3.2 python3.2-dev
            sudo apt-get -y update
            ;;
        py33)
            sudo add-apt-repository -y ppa:jonathonf/python3.3
            sudo apt-get -y update
            sudo apt-get install python3.3 python3.3-dev python3.3-venv
            ;;
        py34)
            sudo add-apt-repository -y ppa:jonathonf/python3.4
            sudo apt-get install python3.4 python3.4-dev python3.4-venv
            sudo apt-get -y update
            ;;
        py35)
            sudo add-apt-repository -y ppa:jonathonf/python3.5
            sudo apt-get install python3.5 python3.5-dev python3.5-venv
            sudo apt-get -y update
            ;;
        py36)
            sudo add-apt-repository -y ppa:jonathonf/python3.6
            sudo apt-get install python3.6 python3.6-dev python3.6-venv
            sudo apt-get -y update
            ;;
        py37)
            sudo add-apt-repository -y ppa:jonathonf/python3.7
            sudo apt-get install python3.7 python3.7-dev python3.7-venv
            sudo apt-get -y update
            ;;
    esac
fi

#sudo pip install virtualenv
#virtualenv ~/.venv
python3 -m venv ~/.venv
source ~/.venv/bin/activate
pip install tox
