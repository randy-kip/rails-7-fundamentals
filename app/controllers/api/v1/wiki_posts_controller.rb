class Api::V1::WikiPostsController < ApplicationController
    skip_before_action :verify_authenticity_token

    # GET /api/v1/wiki_posts
    def index
        @wiki_posts = WikiPost.all
        render json: @wiki_posts
    end

    # GET /api/v1/wiki_posts/1
    def show
        @wiki_post = WikiPost.find(params[:id])
        render json: @wiki_post
    end

    # POST /api/v1/wiki_posts
    def create
        @wiki_post = WikiPost.new(wiki_post_params)

        if @wiki_post.save
            render json: @wiki_post, status: :created
        else
            render json: { errors: @wiki_post.errors }, status: :unprocessable_entity
        end
    end

    # PUT/PATCH /api/v1/wiki_posts/1
    def update
        @wiki_post = WikiPost.find(params[:id])

        if @wiki_post.update(wiki_post_params)
            render json: @wiki_post, status: :created
        else
            render json: @wiki_post.errors, status: :unprocessable_entity
        end
    end

    # DELETE /api/v1/wiki_posts/1
    def destroy
        @wiki_post = WikiPost.find(params[:id])
        @wiki_post.destroy
        head :no_content
    end

    private

    def wiki_post_params
        params.permit(:title, :description, :author, :image)
    end
end
