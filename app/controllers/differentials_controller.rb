class DifferentialsController < ApplicationController
  def create
    @illness = Illness.find(params[:diff][:illness_id])
    @differential = @illness.differentials.build(:differential_id => params[:diff][:differential_id])
    if @differential.save
      flash[:notice] = "Tilføjede differentialdiagnose"
      redirect_back fallback_location: root_url
    else
      flash[:error] = "Kunne ikke tilføje differentialdiagnose"
      redirect_back fallback_location: root_url
    end
  end

  def destroy
    @illness = Differential.find(params[:differential_id]).destroy
    flash[:notice] = "Fjernede differentialdiagnose"
    redirect_back fallback_location: root_url
  end
end
