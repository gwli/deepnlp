tagname="victorgwli/deepnlp:tensorflow-1.0-cpu"
docker pull $tagname

nvidia-docker run --privileged  -e DISPLAY  --net=host --ipc=host -it -v $HOME/.Xauthority:/home/nvidia/.Xauthority -v `pwd`:/home/nvidia/samples/deepnlp $tagname /bin/bash
