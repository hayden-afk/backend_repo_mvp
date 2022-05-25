class CommentsController < ApplicationController

    def create
        @post = Post.find(params)
end
