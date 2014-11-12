class Admin::ItemsController < Admin::ApplicationController
  before_action { authorize! :manage, Item }
  before_action :set_item, only: [:edit, :update, :destroy]

  # GET /admin/items
  def index
    @items = Item.order(id: :desc)
    @items = @items.page(params[:page]).per(25)
  end

  # GET /admin/items/new
  def new
    @item = Item.new
  end

  # POST /admin/items
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_url
    else
      render 'new'
    end
  end

  # GET /admin/items/:id/edit
  def edit
  end

  # PUT/PATCH /admin/items/:id
  def update
    if @item.update_attributes(item_params)
      redirect_to admin_items_url
    else
      render 'edit'
    end
  end

  # DELETE /admin/items:/id
  def destroy
    @item.destroy
    redirect_to admin_items_url
  end

  private

    def item_params
      params.require(:item).permit(:title, :main_image, :motto, :volume, :short_description, :price, :quantity, :negative_quantity_allowed, :tag_list)
    end

    def set_item
      @item = Item.find(params[:id])
    end

end
