class ScenariosController < ApplicationController
  before_action :current_user
  before_action :find_project
  before_action :find_scenarios, only: [:edit, :destroy]

  def edit
    rendirect_to project_path(@project) if @scenarios.empty?
  end

  def update
    binding.pry
    @project.update(scenario_params)
    redirect_to project_path(@project), flash: { success: 'Scenario updated!' }
  end

  def destroy
    @scenarios.delete_all
    projects_path
  end

  private

  def find_scenarios
    @scenarios = @project.scenarios.where(title: params[:title]).order(:order)
  end

  def find_project
    @project = current_user.projects.find(params[:project_id])
  end

  def scenario_params
    params.require(:project).permit(scenarios_attributes: [:id, :title, :order, :step, :_destroy])
  end
end
