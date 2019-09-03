# Installation of tensorflow using docker

***[official docker: jupyter notebook with tensorflow](https://hub.docker.com/r/tensorflow/tensorflow)***


## Prepare tensorflow

1. prepare password via 
    1. > from notebook.auth import passwd
    2. > passwd()1. prepare leo-tensorflow.Dockerfile to change the notebook command parameter
2. build self image for adding parameters to jupyter notebook: `docker build -t leolin16/datascience-tensorflow:0.1 -f ./setup/leo-tensorflow.Dockerfile ./setup`
3. run docker manually for test purpose:
   > docker run -u ${id -u}:${id -g} -d --rm --name leo-tensorflow -p 8890:8888 -v ${PWD}\notebooks\Tensorflow:/tf/datascience leolin16/datascience-tensorflow:0.1
