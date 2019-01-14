class LikesController < ApplicationController

	def create
		#puts params.inspect
		@article = Article.find(params[:article_id])
		@like = Like.new(:user_id => current_user.id, :article_id => @article.id)

		respond_to do |format|
			if @like.save!
				format.html {redirect_to article_path(params[:article_id])}
				format.js
			else
				#flash[:notice] = "Unable to like! Try again"
				format.html {redirect_to article_path(params[:article_id])}
				format.js

			end
		end
	end

	def destroy
		@article = Article.find(params[:article_id])
		@like = Like.find_by(:user_id => current_user.id, :article_id => @article.id)
		respond_to do |format|
			if @like.destroy!
				format.html {redirect_to article_path(params[:article_id])}
				format.js
			else

			end

		end
	end

end
