# 出力用の環境設定
ESC=$(printf '\033')

# Gitが存在するかを確認
git --version
if [ $? != 0 ]; then
  # Homebrewが存在するかを確認
  brew list
  if [ $? = 0 ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  echo Homebrewがインストール済であることを確認
  echo Gitのインストールを開始
  brew install git
fi
printf "${ESC}[32m%s${ESC}[m\n" '[OK] Gitの動作'

# Gitの環境設定
read -p "Githubに登録した名前（ユーザーネーム）を教えてください(Enterで確定): " name
git config --global user.name $name
read -p "Githubに登録したEmailを教えてください(Enterで確定): " email
git config --global user.email $email
printf "${ESC}[32m%s${ESC}[m\n" '[OK] 環境設定終了'