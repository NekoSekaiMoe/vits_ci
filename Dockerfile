FROM ubuntu:jammy
WORKDIR /
RUN apt-get update && apt-get install -y 	git 	git-lfs 	ffmpeg 	libsm6 	libxext6 	cmake 	rsync 	libgl1-mesa-glx curl && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && 	apt-get install -y nodejs	&& rm -rf /var/lib/apt/lists/* 	&& \
    git lfs install && git clone https://huggingface.co/spaces/Mahiruoshi/BangDream-Bert-VITS2 /vits --depth=1 && \
    useradd -m -u 1000 user && \
    cd /vits/ && pip install --no-cache-dir pip==22.3.1 && 	pip install --no-cache-dir 	datasets 	"huggingface-hub>=0.19" "hf-transfer>=0.1.4" "protobuf<4" "click<8.1" "pydantic~=1.0" && \
    pip install -r requirements.txt

CMD ["cd /vits && python3 app.py"]
