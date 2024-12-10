#!/bin/bash

# 检查是否安装了Rust和Cargo
if ! sudo -H -u "$SUDO_USER" bash -c 'command -v rustc &> /dev/null || command -v cargo &> /dev/null'; then
    echo "未找到Rust或Cargo。正在安装Rust..."
    sudo -H -u "$SUDO_USER" bash -c 'curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -1 && source "$HOME/.cargo/env"'
else
    echo "Rust和Cargo已经安装。"
fi

# 安装protobuf编译器
echo "正在安装protobuf编译器..."
sudo brew update
sudo brew install protobuf
sudo brew install openssl@1.1
sudo brew install pkg-config

# 请求用户输入Prover ID并保存
read -p "请输入Prover ID: " PROVER_ID
sudo mkdir -p "/Users/$SUDO_USER/.nexus"
echo "$PROVER_ID" | sudo tee "/Users/$SUDO_USER/.nexus/prover-id" > /dev/null

# 安装Nexus CLI
echo "正在安装Nexus CLI..."
sudo -H -u "$SUDO_USER" bash -c 'curl https://cli.nexus.xyz/ | sh'
