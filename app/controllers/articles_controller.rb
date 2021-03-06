class ArticlesController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show]

	def index
		@articles = Article.all
	end

	def show
		params.inspect
		@article = Article.find(params[:id])
		@comment = Comment.new
		puts @article.id
		@comment.article_id = @article.id
		if user_signed_in?
			@like = Like.find_by(:user_id => current_user.id, :article_id => @article.id)
		end
	end

	def new
		@article = Article.new
	end

	def create
		@article = current_user.articles.new(article_params)
		if @article.save
			flash[:notice] = "Article was successfully created"
			redirect_to article_path(@article)
		else
			render('new')
		end

	end

	def edit
		@article = Article.find(params[:id])
		
		unless current_user == @article.user
			redirect_to(@article, notice: "You are not authorized to edit this article") and return
		end
	end

	def update
		@article = Article.find(params[:id])
		if @article.update_attributes(article_params)
			flash[:notice] = "Article was successfully updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])

		unless current_user == @article.user
			redirect_to(articles_path, notice: "You are not authorized to delete this article") and return
		end

		if @article.destroy
			flash[:notice] = "Article '#{@article.title}' deleted successfully."
			redirect_to articles_path
		else
			flash[:notice] = "Error occurred"
		end

	end

	private

	def article_params
		params.require(:article).permit(:title, :content)
	end

end
