class Api::V1::WikiPostsController < ApplicationController
    def index
        @wiki_posts = WikiPost.all
        render json: @wiki_posts
    end
end
