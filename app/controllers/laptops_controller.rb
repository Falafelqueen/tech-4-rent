class LaptopsController < ApplicationController
  before_action :set_laptop, only: :destroy
  before_action :set_list, only: [:new, :create]

  def new
    @laptop = Laptop.new
  end

  def create
    @laptop = Laptop.new(laptop_params)
    @laptop.list = @laptops
    if laptop.save
      redirect_to laptop_path(@laptops)
    else
      render :new
    end
  end

  def detroy
    @laptop.destroy
    redirect_to laptop_path
  end
end

private

def laptop_params
  params.require(:laptop).permit(:title, :price, :user)
end

def set_laptop
  @laptop = Laptop.find(params[:id])
end

def set_list
  @laptops = Laptop.find(params[:laptop_id])
end
