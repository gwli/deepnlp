FROM   jupyter/scipy-notebook:latest

#ssh 
EXPOSE 22

#PTVSD
EXPOSE 4022


RUN pip install --no-cache-dir --upgrade  numpy pexpect psutil future \
         tensorflow==1.0 ptvsd scipy tqdm 

RUN pip install --no-cache-dir git+https://github.com/gwli/deepnlp.git
RUN pip install --no-cache-dir git+https://github.com/thunlp/THULAC-Python.git

USER root

RUN apt update && apt install -y openssh-server && \
    rm -fr /var/lib/apt/lists/*
#Fix ptvsd
COPY ptvsd_debugger.patch /tmp/ptvsd_debugger.patch
RUN  patch /opt/conda/lib/python3.6/site-packages/ptvsd/debugger.py /tmp/ptvsd_debugger.patch && \
     rm /tmp/ptvsd_debugger.patch
