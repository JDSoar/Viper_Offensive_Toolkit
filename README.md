# Viper Offensive Toolkit

![Viper Resized](https://github.com/user-attachments/assets/0df2b6c2-d41d-464e-94f8-319a64c47f44)




The Viper Offensive Toolkit is a powerful, open-source solution for deploying a comprehensive suite of ethical hacking tools on Debian-based Linux systems. Engineered for lightweight performance and ease of use, it offers a streamlined alternative to Kali Linux, perfect for both newcomers and experienced professionals. 




## Installation

NOTE: While Viper Offensive Toolkit was designed to work with all Debian based Linux distributions, it has only been tested with Ubuntu. Use other distributions at your own risk.

1. Download an install Ubuntu Desktop. https://ubuntu.com/download/desktop
2. Download and install git.
   - `sudo apt install git`
4. Download Viper Offensive Toolkit.
    - `sudo git clone https://github.com/JDSoar/Viper_Offensive_Toolkit.git`
5. Change into the Viper Offensive Toolkit directory.
   - `cd Viper_Offensive_Toolkit`
6. Make the install script executable.
   - `sudo chmod +x Viper_Setup.sh`
7. Run the installation script.
   - `sudo ./Viper_Setup.sh`
  
### Optional
#### Install a New Desktop Enviroment
1. Make Desktop_Env.sh exectuable.
     -`sudo chmod +x Desktop_Env.sh`
2. Run Desktop_Env.sh in the Tools Directory.
     -`./Desktop_Env.sh`
3. Choose your desired desktop background KDE/XFCE.
4. After the installation finishes, login to the new enviroment.
5. If you installed KDE, run the desktop envroment customization script.
     - `./KDE_Setup.sh`


## Ethical Hacking Tools Included

#### Tools
- Git
- Openvpn
- Terminator
- Tmux
- Default-jre
- Curl
- Httpx


#### Proxies
- Caido
- Zed Attack Proxy

#### Scanners
- Nmap
- Nikto
- Wp-scan
- Rust Scan
- Nuclei

#### Password Cracking
- Hashcat
- Hydra
- John The Ripper

#### Fuzzers
- Ffuf
- Dirbuster
- Sqlmap
- Subfinder
- Gobuster
- Dirsearch

#### Packet Capture
- Wireshark
