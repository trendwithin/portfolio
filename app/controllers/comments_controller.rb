class CommentsController < ApplicationController
  before_action :set_article
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create
    @comment = @article.comments.build(env_params)
    if @comment.save
      redirect_to @article, notice: "Comment sent"
    else
      redirect_to @article, alert: "Unable to send the comment"
    end
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :artcle_id)
  end

  def env_params
    comment_params.merge(
      commenter_name:  current_user.to_s,
      commenter_url:   request.env['HTTP_ORIGIN'],
      commenter_email: current_user.try(:email),
      user_ip:         request.env['REMOTE_ADDR'],
      user_agent:      request.env['HTTP_USER_AGENT'],
      referrer:        request.env['HTTP_REFERRER'],
      approved:        false,
    )
  end
end
