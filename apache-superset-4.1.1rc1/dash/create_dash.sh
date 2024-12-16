# export PATH=$HOME/anaconda/bin:$PATH
conda create -n dash python=3.8 -y
conda init
source ~/.bashrc
conda activate dash
apt update 
apt-get install unixodbc unixodbc-dev default-libmysqlclient-dev -y
apt-get install g++ -y
pip install --trusted-host pypi.python.org --trusted-host files.pythonhosted.org --trusted-host pypi.org -r requirements.txt
