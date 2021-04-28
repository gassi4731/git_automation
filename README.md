# git_automation

Github への Push を簡単に終わらせるもの

## 前提条件

- 使用しているパソコンが、macOSで動作している
- Githubのアカウントが作成済
- Githubのリポジトリを作成済（初回実行時のURLが必要）
- Githubのメインブランチ名が、**master**になっている

## 実行方法

- Githubを使うのが、完全に初めての場合
  1. git_first.commandを実行
  2. git_upload.commandを作業中のフォルダにコピペ
  3. git_upload.commandを実行
- Githubを使うのが2回目以降の場合
  1. git_upload.commandを実行

## 実行内容

- **git_first.command**
  1. Gitがコンピュータで使えるか検証
  2. git configの設定（user.nameとuser.emailを設定）
- **git_upload.command**
  1. Gitがコンピュータで使えるか検証
  2. 作業中のディレクトリに自動的に移動
  3. Gitの作業リポジトリが存在するかを確認
  4. リモートリポジトリが設定されているかを確認→設定されていない場合は、ここで**入力が必要**
  5. コミット名をユーザーに聞く
  6. 5で指定したコミット名でpushする

>それぞれの検証作業の後に、不足している事項があれば自動で実行されます。情報が必要な場合は、ユーザーに聞くこともあります。

## トラブルシューティング

### 実行できない場合

コマンドファイルを起動しようとしたときに、権限エラーで使えない場合がある。その時は、対象のファイルに許可を設定を渡せば良い。

**1. ターミナルを起動する**

アプリケーションから「ターミナル.app」を起動する。

**2. フォルダのある場所まで移動する**
```
userName@UserName-MacbookPro % cd 移動したい先のディレクトリ
```
**3. 権限を付与する**（git_first.commandの場合）
```
userName@UserName-MacbookPro % chmod u+x git_first.command
```

## 参考文献

- [Github](https://github.com/penguin4731)
- [Githubのアカウント作成方法](https://qiita.com/negisys/items/04700c688382a0865947)
- [Githubのリポジトリの作成方法](https://docs.github.com/ja/github/getting-started-with-github/create-a-repo)
- [UNIXコマンドの使い方](https://techacademy.jp/magazine/6406)