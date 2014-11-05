class CommentsController < ApplicationController

  def index
    @comments = Comment.all
    render json: @comments
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end


  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      render json: @comment, status: :created, location: @comment
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    if @comment.destroy
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end


  private

  def comment_params
     params.require(:comment).permit(:content, :user_id, :submission_id, :comment_id )
  end

end
