class ArticlesController < ApplicationController
    def index
        @articles = Article.all
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
            render :new
        end

    end

    def edit
        #Exercise here
    end

    def update
        #Exercise here
    end

    def destroy
        #Exercise here
    end

    private
    def article_params
        params.require(:article).permit(:title, :body)
    end

  
end
