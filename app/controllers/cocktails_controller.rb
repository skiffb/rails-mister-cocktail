class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = @cocktail.doses
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to cocktail_path(@cocktail)

    # respond_to do |format|
    #   if @cocktail.save
    #     format.html { redirect_to @cocktail, notice 'Cocktail has been added'}
    #     format.json { render :show, sttatus: :created, location: @cocktail }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @cocktail.errors, status: :unprocessable_entity}
    #   end
    # end

  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
