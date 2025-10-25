class CommentsController < ApplicationController
    before_action :set_article

    def create
        @comment = @article.comments.build(comment_params)

        if @comment.save
        redirect_to @article, notice: "コメントを投稿しました。"
            else
                # 記事詳細を再描画しバリデーションエラーを表示
                flash.now[:alert] = "コメント投稿失敗しました。"
                render "articles/show", status: :unprocessable_entity
            end
        end
    def destroy
        comment = @article.comments.find(params[:id])
        comment.destroy
        redirect_to @article, notice: "コメントを削除しました。"
    end

    private
    def set_article
        @article = Article.find(params[:article_id])
    end

    def comment_params
        params.require(:comment).permit(:commenter, :body)
    end
end