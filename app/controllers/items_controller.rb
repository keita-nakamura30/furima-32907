class ItemsController < ApplicationController
  before_action :authenticate_user!,  only: [:new,:create,:edit,:user]
  before_action :set_item, only:[:show, :edit,:update]
  before_action :move_to_index,only:[:edit,:update]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else 
      render :new
    end
  end
 
  def show
    
  end

  def edit
    
  end

  def update
   if @item.update(item_params)
    redirect_to item_path(@item.id)
   else
    render :edit
  end
end

  def item_params
    params.require(:item).permit(:image,:category_id, :sales_status_id,:prefecture_id,:delivery_date_id,:item_info,:item_name,:delivery_fee_id,:price).merge(user_id: current_user.id)
  end
  def move_to_index
    unless current_user == @item.user
      redirect_to action: :index
    end
  end

  def set_item
    @item =Item.find(params[:id])
  end

end
  