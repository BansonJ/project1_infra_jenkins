#!/bin/bash
SERVERS=("control1" "control2" "control3" "worker1" "worker2")

# 원격 서버에 접속할 사용자 이름을 지정
REMOTE_USER=kubeuser

PUBLIC_KEY_FILE="$HOME/.ssh/id_rsa.pub" 

# 키 파일이 존재하는지 확인합니다.
if [ ! -f "$PUBLIC_KEY_FILE" ]; then
    exit 1
fi

# 목록의 각 서버에 대해 반복하여 키를 복사합니다.
for HOST in "${SERVERS[@]}"
do
    ssh-copy-id -i "$PUBLIC_KEY_FILE" "$REMOTE_USER@$HOST"
    
    if [ $? -eq 0 ]; then
	    echo "SSH key copied to $HOST successfully."
    else
	    echo "Failed to copy SSH key to $HOST."
    fi
done
