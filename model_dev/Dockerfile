FROM tensorflow/tensorflow:2.2.0-gpu

ENV DEBIAN_FRONTEND noninteractive
ENV CUDA_VISIBLE_DEVICES 0,1

RUN add-apt-repository -y ppa:deadsnakes/ppa \
 && curl -sL https://deb.nodesource.com/setup_10.x | bash \
 && apt-get update -qq -y \
 && apt-get install -y python3.7 python3.7-dev \
 && rm /usr/bin/python3 \
 && ln -s /usr/bin/python3.7 /usr/bin/python3 \
 && apt-get install -y libsm6 libxrender1 libxext-dev python3-tk git nodejs \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN python3.7 -m pip install --upgrade pip
RUN pip3 install jupyter jupyterlab matplotlib ipywidgets jupyter_http_over_ws pandas tensorflow-gpu
RUN jupyter serverextension enable --py jupyter_http_over_ws && \
    jupyter nbextension enable --py widgetsnbextension && \
    jupyter labextension install @jupyter-widgets/jupyterlab-manager

# Add configuration files to ipy notebook env.
VOLUME ["/workspace"]

WORKDIR "/workspace"
CMD ["jupyter-notebook", "--allow-root" ,"--port=8888" ,"--no-browser" ,"--ip=0.0.0.0", "--NotebookApp.token='shallnotpass'"]
