class FlowersController < ApplicationController
  before_action :find_flower, only: [:show, :edit, :update, :destroy]

  def index
    @flowers = Flower.all.oder("create_at DESC")
  end

  def new
    @flower = Flower.new
  end

  def create
    @flower = Flower.new flower_params
    if @flower.save
      # flash[:success] = t ".flash"
      redirect_to index_flower_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @flower.update(flower_params)
      redirect_to flower_path(@flower)
    else
      render "edit"
    end
  end

  def destroy
    @flower.destroy
    redirect_to index_flower_path
  end

  private

  def flower_params
    params.require(:flower).permit :name, :description, :image, :price, :discount
  end

  def find_flower
    @flower = Flower.find params[:id]
  end
end
