
# 追加：中間テーブル → 親テーブル の順で消す（外部キー対策）
ArticleTag.destroy_all
Tag.destroy_all
Article.destroy_all

# 既存：記事データ
Article.create!([
  { title: "Ruby入門", summary: "Rubyの基本文法と配列操作の基礎。", body: "Arrayとeachで要素を順に処理します。", user_id: 1 },
  { title: "Rails基礎", summary: "scaffoldでCRUDを作成。", body: "scaffoldでMVC一式を生成し、基本操作を学びます。", user_id: 1 },
  { title: "テーブル表示", summary: "一覧を表形式で表示。", body: "tableとヘルパで見やすい一覧を作ります。", user_id: 1 },
  { title: "Seed活用", summary: "初期データの自動投入。", body: "rails db:seedで学習用データを投入します。", user_id: 1 },
  { title: "フォーム作成", summary: "入力画面の実装。", body: "form_withで記事の新規投稿を実装します。", user_id: 1 },
  { title: "バリデーション", summary: "入力チェックの追加。", body: "validatesで必須や長さをチェックします。", user_id: 1 },
  { title: "デザイン調整", summary: "見た目を改善。", body: "ユーティリティクラスで余白や配置を整えます。", user_id: 1 },
  { title: "学びのまとめ", summary: "ここまでの振り返り。", body: "MVCの流れを理解し、次は認証やデプロイへ。", user_id: 1 }
])

puts "記事を #{Article.count} 件作成しました。"

# タグ投入
tag_rails        = Tag.find_or_create_by!(name: "Rails")
tag_ruby         = Tag.find_or_create_by!(name: "Ruby")
tag_mvc          = Tag.find_or_create_by!(name: "MVC")
tag_activerecord = Tag.find_or_create_by!(name: "ActiveRecord")
tag_git          = Tag.find_or_create_by!(name: "Git")

puts "タグを #{Tag.count} 件作成しました。"

# 記事にタグを紐づけ
a1 = Article.find_by!(title: "Ruby入門")
a2 = Article.find_by!(title: "Rails基礎")
a4 = Article.find_by!(title: "Seed活用")
a8 = Article.find_by!(title: "学びのまとめ")

a1.tags = [tag_ruby]
a2.tags = [tag_rails, tag_mvc, tag_activerecord]
a4.tags = [tag_rails]
a8.tags = [tag_mvc, tag_git]

puts "タグ付けを反映しました。"