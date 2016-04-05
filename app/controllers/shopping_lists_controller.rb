class ShoppingListsController < ApplicationController
  before_action :set_shopping_list, only: [:show, :edit, :update, :destroy]

  # GET /shopping_lists
  # GET /shopping_lists.json
  def index
    @shopping_lists = ShoppingList.all
    @items_in_this_list = []
  end

  # GET /shopping_lists/1
  # GET /shopping_lists/1.json
  def show

    redirect_to url_for(:controller => :items, :action => :index, :id => @shopping_list.id)
    #id = @shopping_list.id
    #items = Item.where(shopping_list_id: id)

    #@item_name_arr = []
    #@store_arr = []

    #items.each do |record|
    #  @item_name_arr << record.item_name
    #  @store_arr << record.store
    #end

  end

  # GET /shopping_lists/new
  def new
    @shopping_list = ShoppingList.new

  end

  # GET /shopping_lists/1/edit
  def edit
  end

  # POST /shopping_lists
  # POST /shopping_lists.json
  def create
    @shopping_list = ShoppingList.create(name: params[:shopping_list][:name])

    respond_to do |format|
      if @shopping_list.save
        format.html { redirect_to shopping_lists_url, notice: 'Shopping list was successfully created.' }
        format.json { render :show, status: :created, location: @shopping_list }
      else
        format.html { render :new }
        format.json { render json: @shopping_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shopping_lists/1
  # PATCH/PUT /shopping_lists/1.json
  def update
    id = @shopping_list.id
    new_name = params[:shopping_list][:name]
    ShoppingList.find(id).update(name: new_name)

    respond_to do |format|
      format.html { redirect_to shopping_lists_url, notice: 'Name was successfully updated' }
      format.json { head :no_content }
    end
    #redirect_to :action => 'index'

  end

  # DELETE /shopping_lists/1
  # DELETE /shopping_lists/1.json
  def destroy
    id = @shopping_list.id
    @shopping_list.destroy
    Item.where(shopping_list_id: id).delete_all
    respond_to do |format|
      format.html { redirect_to shopping_lists_url, notice: 'Shopping list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  helper_method :get_items_for_list

  def get_items_for_list(list_id)
    i = Item.where(shopping_list_id: list_id).select(:item_name)

    if !@items_in_this_list.empty?
      size = @items_in_this_list.length
      for counter in 0..size
        @items_in_this_list.pop
      end

      i.each do |record|
      @items_in_this_list << record.item_name
      end
    else

      i.each do |record|
        @items_in_this_list << record.item_name
        end
    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.
    def set_shopping_list
      @shopping_list = ShoppingList.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @shopping_list = ShoppingList.new
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shopping_list_params
      params.fetch(:shopping_list, {})
    end
end
