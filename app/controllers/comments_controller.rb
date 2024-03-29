class CommentsController < ApplicationController
  def index
  	@comments = Comment.all
  end

  def create
  	product = Product.find(params[:id]) #find the product I'm add a comment for!
  	product.comments.create(comment_params)
  	redirect_to product_path(params[:id]) 
  	#takes me to the show method for the product whose id is params[:id]
  	#this uses the url helpers generated by rails (the prefix column in rake routes)
  end

  private

  	def comment_params
  		params.require(:comment).permit(:comment)
  	end
end
