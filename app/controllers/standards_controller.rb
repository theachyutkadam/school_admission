class StandardsController < ApplicationController
  before_action :find_standard, only: %i[edit update]
  before_action :build_standard, only: %i[new create]

  def index
    @standards = Standard.all
  end

  def new; end

  def edit; end

  def create
    @standard = Standard.new(standard_params)
    if @standard.save
      redirect_to standards_path
      flash[:success] = 'Standard Create Successfully'
    else
      render :new
      flash[:notice] = 'Standard Not Create'
    end
  end

  def update
    if @standard.update_attributes(standard_params)
      redirect_to standards_path
      flash[:success] = 'Standard Update Successfully'
    else
      render :edit
      flash[:notice] = 'Standard Not Update'
    end
  end

  private

  def find_standard
    @standard = Standard.find(params[:id])
  end

  def build_standard
    @standard = Standard.new
  end

  def standard_params
    params.require(:standard).permit(:name, :classroom_id)
  end
end
