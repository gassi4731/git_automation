# Gitが存在するかを確認
git --version
if [ $? != 0 ]; then
  # Homebrewが存在するかを確認
  brew list
  if [ $? = 0 ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  brew install git
fi

# GithubのConfigに登録できているかどうか

# 今いるディレクトリを確認&移動
read -p "今いるディレクトリを教えてください。(Enterで確定): " dirUrl
cd $dirUrl

# gitファイルが存在するか
cd .git
if [ $? != 0 ]; then
  git init
  echo 8
else
  cd ../
fi

git push origin master
if [ $? != 0 ]; then
  read -p "GithubのURLを入力してください。(Enterで確定): " gitUrl
  git remote add origin $gitUrl
else
  echo Good
fi

# gitにPushする
git add .
read -p "今回のアップロードのコメントを書いてください(Enterで確定): " commitStr
git commit -m $commitStr
git push origin master