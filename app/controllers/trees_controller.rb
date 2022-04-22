class TreesController < ApplicationController
  before_action :set_tree, only: %i[edit update show]
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :edit]

  def index
    @trees = Tree.all
    if params[:query].present?
      @trees = Tree.all.where("address ILIKE ?", "%#{params[:query]}%")
      if @trees.count == 0
        @trees = Tree.all
        flash.alert = "no tree in #{params[:query]}.."
      end
    end

    # @markers = @trees.geocoded.map do |tree|
    #   {
    #     lat: tree.latitude,
    #     lng: tree.longitude
    #   }
    # end
  end

  def show
  end

  def new
    @tree = Tree.new
  end

  def create
    @user = current_user
    @tree = Tree.new(tree_params)
    @tree.user = @user
    if @tree.save
      redirect_to tree_path(@tree)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @tree.update(tree_params)
    if @tree.save
      redirect_to tree_path(@tree)
    else
      render :edit
    end

  end

  private

  def tree_params
    params.require(:tree).permit(:name,
                                 :address,
                                 :price,
                                 :quantity_by_year,
                                 :fruit,
                                 :description,
                                 :photo)
  end

  def set_tree
    @tree = Tree.find(params[:id])
  end
end
