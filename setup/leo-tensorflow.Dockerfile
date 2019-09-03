FROM tensorflow/tensorflow:latest-py3-jupyter
LABEL Author="Leo Lin <leolin@leolin.studio>"

RUN pip3 install pandas
CMD [ "bash", "-c", "source /etc/bash.bashrc && jupyter notebook --notebook-dir=/tf --ip 0.0.0.0 --no-browser --allow-root --NotebookApp.password='sha1:d5cac0355886:1847860dde50ea62f7b501bac6ae05ee350c387f' --NotebookApp.allow_origin='*' --PAMAuthenticator.encoding='utf8'" ]
