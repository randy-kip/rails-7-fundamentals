class Api::V1::WikiPostsController < ActionController::API
include ActionController::HttpAuthentication::Token::ControllerMethods
    require 'csv'
    before_action :authenticate

    TOKEN = ENV['WIKI_API_KEY']

    # GET /api/v1/wiki_posts
    def index
        page = params[:page].to_i
        limit = params[:limit].to_i
        offset = (page - 1) * limit
        @wiki_posts = WikiPost.limit(limit).offset(offset)
        render json: @wiki_posts
    end

    # GET /api/v1/wiki_posts/1
    def show
        @wiki_post = WikiPost.find(params[:id])
        serialized = WikiPostSerializer.serialize(@wiki_post)
        render json: serialized
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

    def xml_index
        @wiki_posts = WikiPost.all
        render xml: @wiki_posts
    end

    def csv_index
        @wiki_posts = WikiPost.all
        csv_data = CSV.generate do |csv|
            csv << ["ID", "Title", "Description", "Author"]
            @wiki_posts.each do |post|
                csv << [post.id, post.title, post.description, post.author]
            end
        end
        send_data csv_data, filename: "wiki_posts.csv", type: "text/csv"
    end

    private

    def wiki_post_params
        params.permit(:title, :description, :author, :image)
    end

    def authenticate
        authenticate_or_request_with_http_token do |token, options|
            ActiveSupport::SecurityUtils.secure_compare(token, TOKEN)
        end
    end
end
