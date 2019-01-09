class CommentsController < ApplicationController

	def create
		# render json: params[:comment][:content]
		@comment = Comment.new(:content => params[:comment][:content])
		@comment.article_id = params[:article_id]
		@comment.user_id = current_user.id
		@comment.save!

		redirect_to article_path(@comment.article)
	end


end
