class ItemsController < ApplicationController
before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    puts params
    puts current_user
    if params[:query].present?
      @items = Item.perform_search(params[:query])
      final_arr = []
      most_final_arr = []
      if params[:console].present?
        @consoles = Item.where(console: params[:console])
        @items.each do |item|
          if @consoles.include?(item)
            final_arr << item
          end
        end
        @users = User.near([current_user.latitude, current_user.longitude], params[:distance].to_i)
        final_arr.each do |item|
          if @users.include?(item.user)
            most_final_arr << item
          end
        end
        @items = most_final_arr
      end
    else
      @items = Item.all
    end

    @Users = User.where.not(latitude: nil, longitude: nil)

    @markers = @items.map do |item|
      {
        lat: item.user.latitude,
        lng: item.user.longitude#,
        # infoWindow: { content: render_to_string(partial: "/Users/map_box", locals: { user: user }) }
      }
    end
  end

  def show
    @markers =
      [{
        lat: @item.user.latitude,
        lng: @item.user.longitude#,
        # infoWindow: { content: render_to_string(partial: "/Users/map_box", locals: { user: user }) }
      }]
   end


  def new
    @item = Item.new
    @user = current_user
  end

  def create
    @item = Item.new(item_params)
    @user = current_user
    @item.user = @user
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :photo, :price, :console, :category)
  end
end
