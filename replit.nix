{ pkgs }: {
  deps = [
    pkgs.rustc
    pkgs.rustfmt
    pkgs.cargo
    pkgs.cargo-edit
    pkgs.rust-analyzer
    pkgs.rustup
    pkgs.python3 # 처음 rustlings 를 설치할 때 python 을 요구한다.
  ];
}
