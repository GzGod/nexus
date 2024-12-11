#!/bin/bash

# 检测是否安装了Rust和Cargo
if ! command -v rustc &> /dev/null || ! command -v cargo &> /dev/null; then
    echo "未找到Rust或Cargo。正在安装Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -1   
    if [ -f "$HOME/.bashrc" ]; then
        echo 'source "$HOME/.cargo/env"' >> "$HOME/.bashrc"
        source "$HOME/.bashrc"
    elif [ -f "$HOME/.zshrc" ]; then
        echo 'source "$HOME/.cargo/env"' >> "$HOME/.zshrc"
        source "$HOME/.zshrc"
    else
        echo "无法找到.bashrc或.zshrc文件，无法自动设置环境变量。请手动添加source '$HOME/.cargo/env'到你的shell配置文件中。"
    fi
else
    echo "Rust和Cargo已经安装。"
fi

# 安装protobuf编译器
echo "正在安装protobuf编译器..."
sudo apt update
sudo apt install -y protobuf-compiler
sudo apt install -y libssl-dev
sudo apt install -y pkg-config

# 请求用户输入Prover ID并保存
echo "请输入Prover ID："
read PROVER_ID
mkdir -p ~/.nexus
echo "$PROVER_ID" > ~/.nexus/prover-id

# 安装Nexus CLI
echo "正在安装Nexus CLI..."
curl https://cli.nexus.xyz/ | sh
