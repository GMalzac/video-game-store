class BookingsController < ApplicationController

  before_action :set_item

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.item = @item
    @booking.user_id = current_user.id
    if @booking.save
      redirect_to items_path
    else
      render :new
    end
  end

  def index_by_user
    @bookings = Booking.where(user_id: current_user.id)
  end

  def index
    @bookings = Booking.all
  end

  def show
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def booking_params
    params.require(:booking).permit(:item_id, :start_date, :end_date)
  end

end
