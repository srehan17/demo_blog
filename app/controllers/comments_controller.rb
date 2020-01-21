# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:name, :comment, :post_id))

    # @comment = Comment.new(comment_params)
    # @comment.post_id = params[:post_id]

    redirect_to post_path(@post)
  end

  def destroy
    # @post = Post.find(params(:post_id))
    # @comment = @posts.comments.find(params[:id])
    # @comment.destroy
    # redirect_to post_path(@post)

    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    redirect_to post_path(@post)
    end

  private

  def comment_params
    params.require(:comment).permit(:name, :comment, :id, :post_id)
  end
end
