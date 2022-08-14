#!/bin/bash
    read -p "GodStra Or Nostalgia ?  [Gg/Nn]? "

        if [[ $REPLY =~ ^[Gg]$ ]]; then
            # Update Repositores!!!
            apt update -y && apt upgrade -y
            add-apt-repository ppa:deadsnakes/ppa -y

            # Install Necessary
            apt install -y software-properties-common supervisor python-pip python3.8 python3-venv python3-pandas python-wheel-common git curl && apt install python3-pip -y
            apt-get -f install -y

            # Download Freqtrade from Github
            cd /root/ && git clone https://github.com/freqtrade/freqtrade.git
            cd /root/freqtrade/
            git checkout stable
            curl -o setup.sh https://raw.githubusercontent.com/MAlphaGu/cloud-setup/main/setup.sh
            chmod 777 setup.sh
            sudo -H ./setup.sh -i


            #Download Strategy
            cd /root/freqtrade/user_data/strategies/
            curl -o GodStra.py https://raw.githubusercontent.com/freqtrade/freqtrade-strategies/main/user_data/strategies/GodStra.py

            #Supervisor File
            cd /etc/supervisor/conf.d/
            curl -o god.conf https://raw.githubusercontent.com/MAlphaGu/cloud-setup/main/god.conf
            /root/freqtrade/.env/bin/pip install ta

        elif [[ $REPLY =~ ^[Nn]$ ]]; then
            apt update -y && apt upgrade -y
            add-apt-repository ppa:deadsnakes/ppa -y

            # Install Necessary
            apt install -y software-properties-common supervisor python-pip python3.8 python3-venv python3-pandas python-wheel-common git curl && apt install python3-pip -y
            apt-get -f install -y

            # Download Freqtrade from Github
            cd /root/ && git clone https://github.com/freqtrade/freqtrade.git
            cd /root/freqtrade/
            git checkout stable
            curl -o setup.sh https://raw.githubusercontent.com/MAlphaGu/cloud-setup/main/setup.sh
            chmod 777 setup.sh
            sudo -H ./setup.sh -i
            cd /root/freqtrade/user_data/strategies/
            curl -o NostalgiaForInfinityX.py https://raw.githubusercontent.com/iterativv/NostalgiaForInfinity/main/NostalgiaForInfinityX.py
            cd /etc/supervisor/conf.d/
            curl -o nos.conf https://raw.githubusercontent.com/MAlphaGu/cloud-setup/main/nos.conf

      fi

        cd /root/freqtrade/
        supervisorctl reread
        /root/freqtrade/.env/bin/freqtrade new-config
        sudo supervisorctl update
        sudo supervisorctl status
        else:
                exit
