class DifferentialsController < ApplicationController
  def create
    illness_test = Illness.first
    @differential = illness_test.differentials.build(:differential_id => params[:differential_id])
    if @differential.save
      flash[:notice] = "Added diff."
      redirect_to root_url
    else
      flash[:error] = "Unable to add friend."
      redirect_to root_url
    end
  end

  def destroy
  end


end
