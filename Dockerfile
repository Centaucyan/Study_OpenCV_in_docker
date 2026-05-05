FROM python:3.11-slim

# 컨테이너 내부 작업 폴더
WORKDIR /Tae_opencv-docker-lab

# Python 실행 시 로그가 바로 출력되도록 설정
ENV PYTHONUNBUFFERED=1

# apt update 및 OpenCV 설치에 필요한 패키지 설치
RUN apt-get update && apt-get install -y \
    libxcb1 libgl1 libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# pip 최신화 및 기본 패키지 설치
RUN python -m pip install --upgrade pip

# requirements.txt를 먼저 복사
# 이렇게 하면 requirements.txt가 바뀌지 않았을 때 Docker 캐시를 활용할 수 있음
COPY requirements.txt /Tae_opencv-docker-lab/requirements.txt

# Python 패키지 설치
RUN pip install --no-cache-dir -r /Tae_opencv-docker-lab/requirements.txt

# 기본 실행 위치
CMD ["/bin/bash"]