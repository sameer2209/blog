class CommentsController < ApplicationController

	# before_action :authenticate_user!, only: [:create]

	def create
		# render json: "my name is khan"
		respond_to do |format|
			if current_user.present?
				@comment = Comment.new(:content => params[:comment][:content])
				@comment.article_id = params[:article_id]
				@article = Article.find(params[:article_id])
				@comment.user_id = current_user.id
				if @comment.save!
					format.html {redirect_to article_path(@comment.article)}
					#format.html {puts "inside 1"}
					format.js
					#format.js{puts "inside 2"}
				else
					format.html {render 'articles/comment'}
					#format.html {puts "inside 3"}
					format.js
					#format.js{puts "inside 4"}
				end
			else
				format.js
			end
		end	
		#redirect_to article_path(@comment.article)
	end

	def destroy
		@comment = Comment.find(params[:id])
		@article = Article.find(params[:article_id])
		respond_to do |format|
			
			if @comment.destroy
				format.html {redirect_to article_path(@comment.article)}
				format.js
			else

			end
		end

	end


end
