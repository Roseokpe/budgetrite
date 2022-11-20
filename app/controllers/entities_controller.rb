class EntitiesController < ApplicationController
  def new
    @user = current_user
    @entity = Entity.new
  end

  def create
    @user = current_user
    @group = Group.where(id: params[:entity][:group_id])
    @entity = Entity.new(entity_params)
    @entity.user_id = @user.id
    @entity.groups.push(@group)

    respond_to do |format|
      if @entity.save
        format.html { redirect_to group_path(params[:entity][:group_id]), notice: 'Entity was successfully created.' }
        format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entity.destroy

    respond_to do |format|
      format.html { redirect_to entities_url, notice: 'Entity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
