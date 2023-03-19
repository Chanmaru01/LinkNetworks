# __LinkNetworks__ 
## __アプリケーション概要__
__このアプリは、ご自身の日常や趣味、目標を共有してモチベーションを向上したい人のための投稿アプリです。投稿に対してコメントもできるため相手とのコミュ二ケーションで分からない事も聞くことができます。__
## __本番環境__
(https://pf-my-app.onrender.com)
## __開発環境__
- Docker 4.9.1
- Ruby 2.6.1 
- Ruby on Rails 5.1.7
- Github
- Visual Studio Code
- Render.com
## __制作背景__
__私は、初めてポートフォリオを作成するにあたって私自身がよく使用しているSNSアプリを作ってみたいと思い作成しました！思い立って作成してみると私が思っていた以上に難しく、erroeの壁ばかりでした。躓きながらも頑張って作成したので今後活用されることを願っています。__
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
初めてサイトを訪れた人にアプリの説明を提示し、ユーザー登録後アプリを使用できます。  
![ホーム](https://user-images.githubusercontent.com/102949610/226195666-94c9aae0-7397-4b25-9006-d8875ce5cb19.png)
  
投稿一覧から投稿のいいね、お気に入りはfontawesomeのアイコンを使用しています。アイコンをクリックすると1アカウントにつき1つカウントされます。  
![Videotogif](https://user-images.githubusercontent.com/102949610/226205107-8fc4710d-ba0f-4bb7-b0f9-6a476c9e3799.gif)  

投稿の削除、編集、詳細ではdetailsを使用しドロップダウンさせています。中の要素はグループ化しabsoluteで位置指定して背景をつけています。  
![Videotogif (1)](https://user-images.githubusercontent.com/102949610/226202480-f7b3ea58-9c34-46cd-9939-39b7d37e1880.gif)  

投稿がたくさんある場合キーワード検索して探し出せるようにしました。  
![Videotogif](https://user-images.githubusercontent.com/102949610/226203942-81857aae-58a5-47c9-91b8-4f0d2a101485.gif)  

投稿に反応できるようコメントの返信ができるようにしました。  
![Videotogif (4)](https://user-images.githubusercontent.com/102949610/226203717-15cd4f74-f37b-4d01-9525-80b0f39b023a.gif)  

新規投稿  
![Videotogif (2)](https://user-images.githubusercontent.com/102949610/226203359-c1b323f2-4297-4680-962b-d170eb257ba6.gif)  

自身の目標をより分かりやすくするためTodoリストを実装しました。  
![Videotogif](https://user-images.githubusercontent.com/102949610/226203177-7007396e-c365-4d60-8125-c33a056f5080.gif)  

気になったユーザーのプロフィールの閲覧ができるようにしました。  
![Videotogif (7)](https://user-images.githubusercontent.com/102949610/226199578-aa876182-d99b-4424-9d10-ab3de75ec0ac.gif)

## __工夫したポイント__

最新の投稿がわかりやすいように1列ごと陳列するようにし、プロフィール画面でお気に入りの投稿、自信の投稿をeach文を使用し表示させるようにしました。  
ユーザーがプロフィール画像を指定していないときはデフォルト画像になるようにしました。今回の作成はif文、each文が多かったと思っています。  
また、Todoリストではアニメーションをつけることでなめらかに動くようにしたところです。
## __使用技術__
HTML,CSS,JQuery,Ruby,Rails,Docker,render.com
## __課題と今後実装したい機能__
- 現段階での課題は再設定用パスワードを送信できるようにしたい。  
- 登録完了後にメールをそうしんできるようにしたい。
- メディアクエリを使用しスマートフォンでみてもViewが崩れないようにしたい。
### 実装したい機能
- ユーザー同士のやりとりができるようDMの機能を追加したい。  
- ユーザーのフォロー、フォローバックできるようにしたい。
- 投稿にコメントが来た際に通知でお知らせできるようにしたい。