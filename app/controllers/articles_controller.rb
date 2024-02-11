class ArticlesController < ApplicationController
    def index
        @articles = Article.order(:id)
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    # def create
    # @article = Article.new
    # @article.title = params[:title]
    # @article.body = params[:body]

    #     if @article.save
    #     redirect_to '/articles'
    #     else
    #         render :new
    #     end
    # end
    def create
        @article = Article.new(article_params)
        if @article.save
            redirect_to articles_path
        else
            render :edit, status: :unprocessable_entity
        end

    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])

        if @article.update(article_params)
            redirect_to articles_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to articles_path, notice: 'Article was successfully deleted.'
    end

    private
    def article_params
        params.require(:article).permit(:title, :body)
    end

  
end
