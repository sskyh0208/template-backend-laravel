# template-backend-laravel

このリポジトリは、Dockerを使用してLaravelバックエンドプロジェクトをセットアップするためのテンプレートを提供します。Laravelプロジェクトの初期化、Docker環境のセットアップ、開始に必要なコマンドの実行を簡素化します。

## 前提条件

- Docker
- Docker Compose
- GNU Make (オプションですが、使いやすさのために推奨されます)

## はじめに

このリポジトリをクローンして、プロジェクトをセットアップするために提供されているMakefileコマンドを使用して開始できます。

1. リポジトリをクローンします：
    ```bash
    git clone https://github.com/sskyh0208/template-backend-laravel.git
    cd template-backend-laravel
    ```

2. 初期化コマンドを実行します：
    ```bash
    make init
    ```
    このコマンドは以下のアクションを実行します：
    - `src`ディレクトリを作成します（存在しない場合）。
    - Dockerコンテナをビルドします。
    - Dockerコンテナを起動します。
    - `src`ディレクトリ内に新しいLaravelプロジェクトを作成します（空の場合）。
    - Laravelアプリケーションキーを生成します。
    - データベースのマイグレーションを実行します。

    `src`ディレクトリが既に存在し、空でない場合は、初期化がスキップされ、メッセージが表示されます。

3. Laravelアプリケーションにアクセスします：
   - Laravelアプリケーションは `http://localhost` でアクセスできるようになります（または `.env` ファイルで設定した異なるポートで）。

## Makeコマンド

このリポジトリには、Docker環境とLaravelアプリケーションを管理するためのさまざまなコマンドを含むMakefileが含まれています：

- `make init`: プロジェクトを初期化します（上記のように）。
- `make build`: Dockerコンテナをビルドします。
- `make start`: Dockerコンテナを起動します。
- `make stop`: Dockerコンテナを停止します。
- `make destroy`: Dockerコンテナ、イメージ、ボリューム、およびネットワークを停止して削除します。
- `make create-new-project`: 新しいLaravelプロジェクトを作成します（`src`が空の場合のみ）。
- `make npm-install`: `app`コンテナ内で`npm install`を実行します。
- `make composer-install`: `app`コンテナ内で`composer install`を実行します。
- `make key-gen`: Laravelアプリケーションキーを生成します。
- `make migrate`: データベースのマイグレーションを実行します。
- `make clear-cache`: Laravelアプリケーションキャッシュをクリアします。

## 環境のカスタマイズ

Docker環境とLaravelアプリケーションをカスタマイズするために、それぞれのDockerfile、設定ファイル、および`.env`ファイルを変更できます。変更後はDockerコンテナを再ビルドしてください：

```bash
make build
```