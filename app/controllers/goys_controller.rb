class GoysController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_goy, only: [:show]
  # TODO As a USER I can CLICK ON A GOY PAGE so I can see their profile
  def create
  end

  def new
  end

  def index
    @goys = Goy.all
    # select{ |id, g| g[:city] == params[:city] && g[:startint_date] > params[:starting_date && g[:ending_date] < params[:ending_date]] }
  end

  def show

  end

  def update
  end

  def edit
  end

  private
  def set_goy
    @goy = Goy.find(params[:id])
  end
end
