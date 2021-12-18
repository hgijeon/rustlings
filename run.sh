#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd -P )"
RUSTLINGS_DIR="$SCRIPT_DIR"
# RUSTLINGS_DIR="$SCRIPT_DIR/rustlings"
RUSTLINGS_EXECUTABLE="$SCRIPT_DIR/rustlings_executable"

GIT_REPO="https://github.com/rust-lang/rustlings"
GIT_BRANCH="4.6.0"

# 기존에 클론한 레포지토리가 없으면 클론해온다.
if [ ! -d $RUSTLINGS_DIR ] ; then
  echo "cloning..."
  git clone -b $GIT_BRANCH --depth 1 $GIT_REPO $RUSTLINGS_DIR
fi

cd $RUSTLINGS_DIR

# rustlings 바이너리가 없으면 설치한다.
if [ ! -f $RUSTLINGS_EXECUTABLE ] ; then
  echo "install rustlings exectuable..."
  cargo install --force --path . || exit
  echo "copy installed executable..."
  cp "$HOME/.cargo/bin/rustlings" $RUSTLINGS_EXECUTABLE
  chmod u+x $RUSTLINGS_EXECUTABLE
fi
if [ ! -x $RUSTLINGS_EXECUTABLE ] ; then
  echo "set permission..."
  chmod u+x $RUSTLINGS_EXECUTABLE
fi

# 실행
$RUSTLINGS_EXECUTABLE watch
