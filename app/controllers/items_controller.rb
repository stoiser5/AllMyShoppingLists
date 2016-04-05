class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    id = params[:id]
    @items = Item.where(shopping_list_id: id)
    #id = 1
    #params = (1)
  end

  # GET /items/1
  # GET /items/1.json
  def show
    #@item = Item.find(params[:id])
  end

  # GET /items/new
  def new
  @item = Item.new
  end

  # GET /items/1/edit
  def edit

  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new
    id = params[:item][:shopping_list_id]
    new_item = params[:item][:item_name]
    store = params[:item][:store]
    @item.shopping_list_id=id
    @item.item_name=new_item
    @item.store=store
    @item.save

    respond_to do |format|
      if @item.save
        format.html { redirect_to shopping_lists_url, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    new_name = params[:item][:item_name]
    new_store = params[:item][:store]
    Item.find_by_item_name(@item.item_name).update(item_name: new_name, store: new_store)

    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item_path, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to shopping_lists_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @item = Item.new
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:shopping_list_id)
    end
end
