class ScenariosController < ApplicationController
  before_action :current_user
  before_action :find_project
  before_action :find_scenarios, only: [:edit, :destroy]

  def edit
  end

  def update
    @project.update(scenario_params)
    redirect_to project_path(@project), flash: { success: 'Scenario updated!' }
  end

  def destroy
    @scenarios.delete_all
    redirect_to projects_path
  end

  private

  def find_scenarios
    @scenarios = @project.scenarios.where(title: params[:title]).order(:order)
    @scenarios << @project.scenarios.build(title: params[:title], step: "# init scenario - #{params[:title]}") if @scenarios.empty?
  end

  def find_project
    @project = current_user.projects.find(params[:project_id])
  end

  def scenario_params
    set_orders
    params.require(:project).permit(scenarios_attributes: [:id, :title, :order, :step, :_destroy])
  end

  def set_orders
    params[:project][:scenarios_attributes].each_with_index.map do |step, index|
      step['order'] = index + 1
    end
  end
end
