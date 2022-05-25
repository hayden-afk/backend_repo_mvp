class PostsController < ApplicationController

    def index
        @posts = Post.all
        render json: @posts
    end
    def show
        if @post
            render json: @post
        else
            render json: @post.errors
        end
    end
    def new
        @post = Post.new
        render json: @post
    end
    def create
        @post = Post.create!(post_params)
        if @post
            render json: @post
        else
            render json: @post.errors
        end
    end

    def edit
        render json: @post
    end

    def destroy
        byebug
        if @post.destroy
            render json: {message: 'Post Deleted.'}
        else
            render json: @post.error
        end
    end

    def update
        if @post.update(post_params)
            render json: @post
        else
            render json: @post.errors
        end
    end

    private

    def find_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :author, :content, :image)
    end
end
