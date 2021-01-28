class CommentsController < ApplicationController
  def new
    @comment = Comment.new(user_id: params[:user_id], product_id: params[:product_id])
  end

  def create
    @comment = Comment.create(comment_params)

    if @comment.save
      redirect_to product_path(@comment.product)
    else
      flash.now[:error] = @comment.errors.messages
      render 'new'
    end
  end

  def update;
    @products = Product.find(params[:product_id])
    @comment = @products.comments.find(params[:id])
    @comment.update
    redirect_to product_path(@products)
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :product_id, :body, :rating)
  end
end
