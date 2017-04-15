class DifferentialsController < ApplicationController
  def create
    @illness = Illness.where(id: params[:illness_id]).first
    @differential = @illness.differentials.build(:differential_id => params[:differential_id])
    if @differential.save
      flash[:notice] = "Added diff."
      redirect_to root_url
    else
      flash[:error] = "Unable to add friend."
      redirect_to root_url
    end
  end

  def destroy
    @illness = Differential.find(params[:differential_id]).destroy
  end


end
