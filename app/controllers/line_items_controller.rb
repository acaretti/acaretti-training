class LineItemsController < ApplicationController
  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @line_items }
    end
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/new
  # GET /line_items/new.json
  def new
    @line_item = LineItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/1/edit
  def edit
    @line_item = LineItem.find(params[:id])
  end

  # POST /line_items
  # POST /line_items.json
  def create
    if params[:product_id].nil?
      @line_item = LineItem.new(params[:line_item])
      respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item, notice: 'Line item was successfully created.' }
        format.json { render json: @line_item, status: :created, location: @line_item }
      else
        format.html { render action: "new" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
    else
      product = Product.find(params[:product_id])
      saved = add_product product
      respond_to do |format|
      if saved
        #redirect_to :action=>"index"
        format.html { redirect_to @cart, notice: 'Line item was successfully added to the cart.' }
        #format.json { render json: cart, status: :created, location: cart }
      else
        format.html { render action: "new" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
    end  

  end

  # PUT /line_items/1
  # PUT /line_items/1.json
  def update
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to line_items_url }
      format.json { head :no_content }
    end
  end
end

def current_cart
  @cart = Carts.first
  
  if @cart == nil
    @cart = Carts.new
    @cart.save
  end
  
  @cart
end

def add_product(product)
  line = LineItem.where(:product_id => product.id)
  line_item = line[0]
  @cart = current_cart
  if !line_item.nil?
    line_item.quantity += 1
    line_item.price = line_item.quantity * product.price
  else
    line_item = LineItem.new(:product_id => product.id, :price => product.price, :quantity => 1, :carts_id => @cart.id)
  end
    line_item.save
end
