class OwnersController < ApplicationController
  before_action :find_owner, only:[:show, :edit, :update, :destroy]

  def index
    @owners = Owner.all
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.create(owner_params)

      respond_to do |format|
        if @owner.valid?
          @owner.save!
          format.html {redirect_to @owner, notice: "You have successfully created an Owner Profile😇"}
        else
          flash[:errors] = @owner.errors.full_messages
          format.html {render :new}
        end
      end
  end

  def show
  end

  def edit
  end

  def update
    @owner.update(owner_params)

    respond_to do |format|
      if @owner.valid?
        @owner.save!
        format.html { redirect_to @owner, notice: "you have successfully updated your form."}
      else
        flash[:errors] = @owner.errors.full_messages
        format.html render :edit
      end
    end
  end

  def destroy
    @owner.destroy
    redirect_to owners_path
  end




  private

  def find_owner
    @owner = Owner.find(params[:id])
  end

  def owner_params
    params.require(:owner).permit(:address, :city, :user_id, :name)
  end



end
