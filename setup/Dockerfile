FROM jupyter/all-spark-notebook:latest
LABEL Author="Leo Lin <leolin@leolin.studio>"

# 下面是按官网的方法安装spotlight
#RUN pip --no-cache-dir install --upgrade install http://download.pytorch.org/whl/cu75/torch-0.2.0.post3-cp36-cp36m-manylinux1_x86_64.whl 
#RUN pip --no-cache-dir install --upgrade torchvision

# RUN whoami
# RUN apt-get update -y && \
#     curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
#     add-apt-repository \
#     "deb [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable" && \
#     apt-get update -y

# COPY pip.conf /etc/pip.conf
# COPY pip.conf ~/.pip/pip.conf
# COPY pip.conf ~/.config/pip/pip.conf

# change source
# RUN conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/pytorch/ && \
#     conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/ && \
#     conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/ && \
#     conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/ && \
#     conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/msys2/ && \
#     conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/bioconda/ && \
#     conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/menpo/ && \
#     conda config --remove channels defaults && \
#     conda config --set show_channel_urls yes

# pytorch
RUN conda install pytorch torchvision -c pytorch -y
# conda install pytorch-cpu torchvision-cpu -c pytorch -y

# spotlight(https://github.com/maciejkula/spotlight)
# RUN conda install -c maciejkula -c soumith spotlight=0.1.2

