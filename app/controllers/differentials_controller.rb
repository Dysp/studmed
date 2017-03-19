class DifferentialsController < ApplicationController
  def create
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
  end


end
