class BookingsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:show]
    before_action :set_booking, only:[:show]
    # before_action :set_goy, only: [:create, :new]

  def create
    @booking = Booking.new(booking_params)
    @booking.status = "pending"
    @booking.jew = current_user if current_user.class == Jew

    if @booking.save
      redirect_to bookings_path, notice: "Booking was created sucessfully."
    else
      render :new
    end
  end

  def new
    @booking  = Booking.new
  end

  def show
  end

  def index
    @bookings = current_user.bookings.order(start_date: :asc)
    @booking = Booking.new
    @goy = current_user
  end

  def update

  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  def book
    @booking = Booking.find(params[:id])
    @booking.jew = current_user
    if @booking.save
      redirect_to @booking, notice: "Booking was created sucessfully."
    else
      redirect_to @booking, notice: "Booking was not created sucussfully."
    end
  end

  private
  def set_booking
    @booking = Booking.find(params[:booking_id] || params[:id])
  end

  def set_jew
    @jew = Jew.find(params[:jew_id])
  end

  def set_goy
    @goy = Goy.find(params[:goy_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :goy_id)
  end
end
