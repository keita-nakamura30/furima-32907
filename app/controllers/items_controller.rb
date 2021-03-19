class ItemsController < ApplicationController
  before_action :authenticate_user!,  except: [:index]

 def index
  @items 
 end
end
