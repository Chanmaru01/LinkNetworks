# __LinkNetworks__ 
## __アプリケーション概要__
このアプリは、ご自身の日常や趣味、目標を共有してモチベーションを向上したい人のための投稿アプリです。投稿に対してコメントもできるため相手とのコミュ二ケーションで分からない事も聞くことができます。
## __本番環境__
()
## __開発環境__
- Docker 4.9.1
- Ruby 2.6.1 
- Ruby on Rails 5.1.7
- Github
- Visual Studio Code
- Render.com
## __制作背景__
私は、初めてポートフォリオを作成するにあたって私自身がよく使用しているであろうSNSアプリを作ってみたいと思い作成しました！思い立って作成してみると私が思っていた以上に難しく、erroeの壁ばかりでした。躓きながらも頑張って作成したので今後活用されることを願っています。
## __実装機能__
- ログイン機能
- 投稿機能
- 投稿へのリアクション機能
- 画像ファイルのアップロード機能
- 投稿検索機能
- Todoリスト
## __usersテーブル__
| Column | Type | Options |
| ---- | ---- | ----|
| email | string | null: false |
| encrypted_password | string | null: false |
| created_at | datetime | null: false |
| updated_at | datetime | null: false |
| user_name | string |  |
| image | string |  |
| pr | string |  |
## Association
- has_many :tweets, dependent: :destroy
- has_many :comments
- has_many :likes, dependent: :destroy
- has_many :liked_tweets, through: :likes, source: :tweet
- has_many :favorites, dependent: :destroy
- has_many :favorited_tweets, through: :favorites, source: :tweet
- has_many :memos
## __tweetsテーブル__
| Column | Type | Options |
| ---- | ---- | ----|
| created_at | string | null: false |
| updated_at | string | null: false |
| content | string |  |
| user_id | string |  |
| image | string |  |
## Association
- has_many :likes, dependent: :destroy
- has_many :liked_users, through: :likes, source: :user
- has_many :favorites, dependent: :destroy
- has_many :favorite_users, through: :favorites, source: :user
- has_many :comments, dependent: :destroy
- belongs_to :user
## __todosテーブル__
| Column | Type | Options |
| ---- | ---- | ----|
| created_at | datetime | null: false |
| updated_at | datetime | null: false |
| done | boolean |default: false, null: false |
| content | string |  |
| memo_id | integer |  |
| position | integer |  |
## Association
- belongs_to :memo
## __memosテーブル__
| Column | Type | Options |
| ---- | ---- | ----|
| created_at | datetime | null: false |
| updated_at | datetime | null: false |
| title | string |  |
| user_id | integer |  |
## Association
- has_many :todos, dependent: :destroy
-  belongs_to :user
## __likesテーブル__
| Column | Type | Options |
| ---- | ---- | ----|
| created_at | datetime | null: false |
| updated_at | datetime | null: false |
| tweet_id | integer |  |
| user_id | integer |  |
## Association
- belongs_to :user
- belongs_to :tweet
## __favoritesテーブル__
| Column | Type | Options |
| ---- | ---- | ----|
| created_at | datetime | null: false |
| updated_at | datetime | null: false |
| tweet_id | integer |  |
| user_id | integer |  |
## Association
- belongs_to :user
- belongs_to :tweet
## __commentsテーブル__
| Column | Type | Options |
| ---- | ---- | ----|
| created_at | datetime | null: false |
| updated_at | datetime | null: false |
| tweet_id | integer |  |
| user_id | integer |  |
| comment_content | string |  |
## Association
- belongs_to :user
- belongs_to :tweet
## __Demonstration__

## __使用技術__
HTML,CSS,JQuery,Ruby,Rails,Docker,render.com
## __課題と今後実装したい機能__
- 現段階での課題は再設定用パスワードを送信できるようにしたい。  
- メディアクエリを使用しスマートフォンでみてもViewが崩れないようにしたい。
### 実装したい機能
- ユーザー同士のやりとりができるようDMの機能を追加したい。  
- ユーザーのフォロー、フォローバックできるようにしたい。
- 投稿にコメントが来た際に通知でお知らせできるようにしたい。