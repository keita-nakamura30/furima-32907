class ItemsController < ApplicationController
  before_action :authenticate_user!,  only: [:new,:create]

 def index
  @items 
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


private

  def item_params
    params.require(:item).permit(:image,:category_id, :sales_status_id,:prefecture_id,:delivery_date_id,:item_info,:item_name,:delivery_fee_id,:price).merge(user_id: current_user.id)
end
end
