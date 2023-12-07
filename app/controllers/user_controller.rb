# frozen_string_literal: true
# Top-level documentation comment for UserController

class UserController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # GET /vehicles
  def index
    @user = User.all

    render json: @user
  end

  # GET /vehicles/1
  def show
    render json: @user
  end

  # POST /vehicles
  def create
    @user = User.new(vehicle_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vehicles/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vehicles/1
  def destroy
    @user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def vehicle_params
    params.require(:user).permit(
      :name,
      :email
    )
  end
end
