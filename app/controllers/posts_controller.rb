class PostsController < ApplicationController
    # frozen_string_literal: true
    before_action :set_post, only: %i[show update destroy]
  
    # GET /vehicles
    def index
      @posts = Post.all
  
      render json: @posts
    end
  
    # GET /vehicles/1
    def show
      render json: @post
    end
  
    # POST /vehicles
    def create
      @post = Post.new(vehicle_params)
  
      if @post.save
        render json: @post, status: :created
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /vehicles/1
    def update
      if @post.update(post_params)
        @post.update(group_id: nil) if @vehicle.group_id == 0
        render json: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /vehicles/1
    def destroy
      @post.destroy
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
  
    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(
        :name,
        :email,
        :address,
      )
    end
  
  
end
