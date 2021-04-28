ESC=$(printf '\033')
echo "${ESC}[32mGREEN${ESC}[m"


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
echo [STEP 1] Gitがインストールされていることを確認

# GithubのConfigに登録できているかどうか

echo [STEP 2] Gitの環境設定が完了していることを確認

# 今いるディレクトリに移動
cd `dirname $0`
pwd

# gitファイルが存在するか
cd .git
if [ $? != 0 ]; then
  git init
  echo Gitの初期化を実行
else
  cd ../
  echo Gitが初期化済であることを確認
fi

git push origin master
if [ $? != 0 ]; then
  read -p "GithubのURLを入力してください。(Enterで確定): " gitUrl
  git remote add origin $gitUrl
  echo Githubのリモートリポジトリを設定
else
  echo Githubのリモートリポジトリが機能していることを確認
fi

# gitにPushする
git add .
read -p "今回のアップロードのコメントを書いてください(Enterで確定): " commitStr
git commit -m $commitStr
git push origin master