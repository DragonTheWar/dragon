#!/usr/bin/bash
# Author by @DarK_TeAm3
# Support me with telegram channel https://t.me/DarK_TeAm3
# Disclaimer: please dont re-edit or recode the original source code !
# Last update: 31/03/2022 - version 1.0



  function main_menu {
    clear
    figlet Dragon
    echo ""
    echo " telegram: DarK_TeAm3 "
    echo " Github: DragonTheWar "
    echo ""
    echo "Выберите программу для запуска: "
    echo "1) Узнать информацию "
    echo "2) Дополнения "
    echo "3) Обновить скрипт "
    echo "4) Kali linux "
    echo "5) Termux "
    echo "6) Выход"
    echo ""


    echo -n " Введите ответ: "
    read option
    echo ""


    case $option in
      1 ) information ;;
      2 ) more ;;
      3 ) update ;;
      4 ) kali ;;
      5 ) termux ;;
      6 ) clear && exit ;;
    esac
  }

  function information {
    clear
    figlet Info
    echo ""
    echo "1) Узнать информацию ip "
    echo "2) Узнать информацию Сovid-19 "
    echo "3) Узнать погоду"
    echo "4) Вернуться в главное меню"
    echo ""

    echo -n " Введите ответ: "
    read option
    echo ""

    case $option in
      1 ) ip ;;
      2 ) covid_19 ;;
      3 ) weather ;;
      4 ) main_menu ;;
    esac
}

  function ip {
    clear
    figlet ip
    echo ""
    echo "Выберите опцию: "
    echo "1) Узнать информацию по другому ip "
    echo "2) Узнать информацию по вашему ip "
    echo "3) Вернуться в главное меню"
    echo ""

    echo -n "Уточните информацию: "
    read option
    echo ""


    case $option in
      1 ) other_ip ;;
      2 ) Our_ip ;;
      3 ) main_menu ;;
    esac
  }


  function other_ip {
    clear
    echo ""
    echo ""
    echo -n " Введите внешний ip: "
    read ip
    curl http://api.db-ip.com/v2/free/$ip
    echo ""
    read -rsn1 -p" Нажмите любую кнопку для продолжения "
    ip
  }


  function Our_ip {
    clear
    echo ""
    echo ""
    curl http://api.db-ip.com/v2/free/self/ipAddress
    echo ""
    read -rsn1 -p" Нажмите любую кнопку для продолжения "
    ip
  }


  function covid_19 {
    clear
    figlet Covid-19
    echo ""
    echo -n " Введите страну(на английском): "
    read country
    curl -L covid19.trackercli.com/$country
    echo ""
    read -rsn1 -p" Нажмите любую кнопку для продолжения "
    main_menu
  }

  function weather {
    figlet Weather
    echo ""
    echo -n "Введите город (на английском): "
    read city
    echo -n "Введите страну (на английском): "
    read country
    curl wttr.in/$city+$country
    echo ""
    read -rsn1 -p" Нажмите любую кнопку для продолжения "
    main_menu
  }

  function more {
    clear
    figlet More
    echo ""
    echo " 1)Угадайка "
    echo " 2)Главное меню "
    echo ""

    echo -n "Уточните информацию: "
    read option
    case $option in
      1 ) find_me ;;
      2 ) main_menu ;;
    esac
    }

    function find_me {
      chmod 777 release/myscript
      ./release/myscript
      echo ""
      echo "1)Попробовать еще раз?"
      echo "2)Назад"
      echo ""
      echo -n "Выберите опцию: "
      read option
      case $option in
        1 ) find_me ;;
        2 ) more ;;
      esac
}

  function update {
    clear
    figlet Update
    echo ""
    git pull
    echo ""
    echo "По всем вопросам обращаться сюда: "
    echo ""
    echo "Telegram: DarK_TeAm3 "
    echo "Github: DragonTheWar "
    echo ""
    read -rsn1 -p" Нажмите любую кнопку для продолжения "
    bash script.sh
  }

  function kali {
    clear
    figlet Kali linux
    echo ""
    echo " 1) Установить пакет "
    echo " 2) Настройка репозиториев "
    echo " 3) Выйти в главное меню "
    echo ""

    echo -n " Выберите опцию: "
    read option
    case $option in
      1 ) kali_package ;;
      2 ) kali_repository ;;
      3 ) main_menu ;;
    esac
  }

  function kali_package {
    clear
     figlet Package
     echo ""
     echo " Установка пакетов при помощи скрипта "
     echo " Разделение пакетов при помощи && "
     echo " Например: Deluge && Zabbix && Gkrellm"
     echo ""
     echo -n " Введите пакет для установки: "
     read package
     sudo apt install $package
     echo ""
     read -rsn1 -p" Нажмите любую кнопку для продолжения "
     kali
  }

  function kali_repository {
    clear
    figlet Configure
    echo ""
    echo "1) Версия системы "
    echo "2) Проверка файлов репозиториев "
    echo ""
    echo "3) Установка mitmf"
    echo "4) Добавить репозиторий Kali "
    echo "5) Настройка ключей Kali "
    echo ""
    echo "6) Главное меню "
    echo ""

    echo -n "Выберите опцию: "
    read option
    case $option in
      1 ) clear && echo "" && uname -a && echo "" && read -rsn1 -p" Нажмите любую кнопку для продолжения " && kali_repository ;;
      2 ) clear && echo "" && sudo cat /etc/apt/sources.list && echo "" && read -rsn1 -p" Нажмите любую кнопку для продолжения " && kali_repository ;;
      3 ) mitmf ;;
      4 ) kali_repository_install ;;
      5 ) keys_kali ;;
      6 ) main_menu ;;
        esac
  }
  
  function mitmf {
    sudo apt install mitmf 
  }

  function kali_repository_install {
    clear
    echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" | sudo tee /etc/apt/sources.list
    echo "deb http://security.kali.org/kali-security kali-rolling/updates main contrib non-free" | sudo tee /etc/apt/sources.list
    echo "deb http://http.kali.org/kali sana main non-free contrib" | sudo tee /etc/apt/sources.list
    echo "deb http://security.kali.org/kali-security sana/updates main contrib non-free" | sudo tee /etc/apt/sources.list
    sudo apt-key adv --keyserver pgp.mit.edu --recv-keys ED444FF07D8D0BF6
    sudo apt update
    echo ""
    read -rsn1 -p" Нажмите любую кнопку для продолжения "
    kali_repository
  }

  function keys_kali {
    clear
    wget --no-check-certificate http://http.kali.org/kali/pool/main/k/kali-archive-keyring/kali-archive-keyring_2022.1_all.deb
    sudo dpkg -i kali-archive-keyring_2022.1_all.deb
    rm kali-archive-keyring_2022.1_all.deb
    sudo apt update
    echo ""
    read -rsn1 -p" Нажмите любую кнопку для продолжения "
    kali_repository
  }

function termux {
  clear
  figlet Termux
  echo ""
  echo "1) Установка пакетов "
  echo "2) Настройка пакетов "
  echo "3) Установить команду"
  echo "4) Главное меню "
  echo ""

  echo -n "Введите ответ: "
  read option
  case $option in
    1 ) install_termux ;;
    2 ) configure_termux ;;
    3 ) termux_command ;;
    4 ) main_menu ;;
  esac
}

function install_termux {
  clear
  figlet Install
  echo ""
  echo "1) Установить nethunter "
  echo "2) Установить metasploit"
  echo "3) Установить sudo"
  echo "4) Назад "
  echo ""

  echo -n "Введите ответ: "
  read option
  case $option in
    1 ) install_nethunter  ;;
    2 ) install_metasploit ;;
    3 ) install_sudo ;;
    4 ) termux ;;
  esac
}

function install_nethunter {
  clear
  figlet Nethunter
  apt-get update -y
  pkg install wget -y
  pkg install python -y
  pkg install python2 -y
  pkg install openssh -y
  pkg install wget openssl-tool proot -y && hash -r && wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/Installer/Kali/kali.sh && bash kali.sh
}

function install_metasploit {

  source <(curl -fsSL https://kutt.it/msf)

}

function install_sudo {
  apt install git
  git clone https://gitlab.com/st42/termux-sudo
  cd termux-sudo
  cat sudo > /data/data/com.termux/files/usr/bin/sudo
  chmod 700 /data/data/com.termux/files/usr/bin/sudo
}

function configure_termux {
  clear
  figlet configure
  echo ""
  echo "1) Настройка баннера "
  echo "2) Назад"
  echo ""

  echo -n " Введите ответ: "
  read option
  case $option in
    1 ) banner_configure ;;
    2 ) termux ;;
  esac
}

function termux_command {
    cd ~
    wget -q https://raw.githubusercontent.com/DragonTheWar/dragon/main/script.sh -O $PREFIX/bin/dragon
    chmod 777 $PREFIX/bin/dragon
    echo "Теперь можно запускать команду 'dragon' "
    echo ""
    read -rsn1 -p" Нажмите любую кнопку для продолжения "
    termux
}

function banner_configure {
  clear
  figlet banner
  echo " telegram: DarK_TeAm3 "
  echo ""
  read -p "  [~] Баннер:" banner
  read -p "  [~] Пользователь:" user
  echo ""
  rm -rf ~/../usr/etc/motd
  echo "clear && figlet '$banner' | lolcat" >> ~/../usr/etc/bash.bashrc
  echo "PS1='[ $user : \w ]'" >> ~/../usr/etc/bash.bashrc
  echo "Перезапустите Termux"
  echo ""
  read -rsn1 -p" Нажмите любую кнопку для продолжения "
  exit
  exit
}

main_menu
