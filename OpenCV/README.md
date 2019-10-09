# OpenCV

## Env
- Ubuntu 14.04 LTS 64bit  

## Download
- HTTPS
  ```bash
  cd <workspase>
  git clone https://github.com/RyodoTanaka/my_ubuntu_setup.git
  ```

- SSH
  ```bash
  cd <workspase>
  git clone git@github.com:RyodoTanaka/my_ubuntu_setup.git
  ```

## OpenCV Installer
### Usage
`source`コマンドを使って下さい。  
**`sh`や、`bash`コマンドを使わないで下さい。**

1. `source`コマンドで実行  
   ただし、**第一引数にインストールしたいバージョンを入れて下さい。**入れなかった場合には、デフォルトのバージョンが適用されます。  
   因みに、現在(2015.09.10)時点でのデフォルトバージョンは、`3.0.0`です。  
   以下の例では、`3.0.0`を手動で指定しています。
   ```bash
   cd <workspase>/my_ubuntu_setup/OpenCV
   source installer.bash 3.0.0
   ```

2. 表示される質問に`yes/no`で答えてゆく。

3. 見守る(約10分)

**!! 注意 !!** インストールするパッケージにGRUBをいじろうとするモノがあります。どうするか聞かれたら、`Esc`キーを押し、GRUBをいじらないようにしてインストールを進めて下さい。

### Feature
バージョンを変えたくなったら、**Usage**の項に書いてあるとおり、第一引数に希望のバージョンを指定して実行して下さい。  
この方法で**ダウングレードもできます。**  
ダウングレードした際には、元のバージョンである、`~/Downloads/opencv-x.x.x`が不要になります。手動で消去して下さい。  
2015.09.10時点では、`3.0.0`以上のバージョンは保証できません。

## OpenCV Version Checker
### Usage
`source`コマンドを使って下さい。  
**`sh`や、`bash`コマンドを使わないで下さい。**  
`source`コマンドで実行
```bash
source version_checker.bash
```
