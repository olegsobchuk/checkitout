class ScenariosController < ApplicationController
  before_action :current_user
  before_action :find_scenario
  before_action :find_project

  def new
    @scenario = Scenario.new
  end

  def create
    @scenario = @project.scenarios.build(scenario_params)
    if @scenario.save
      redirect_to user_project_scenario_path(current_user, @project, @scenario), flash: { success: 'Scenario created!' }
    else
      render :new
    end
  end

  def update
    @scenario.update(scenario_params)
    redirect_to user_project_scenario_path(current_user, @project, @scenario), flash: { success: 'Scenario updated!' }
  end

  def edit
    render :new
  end

  def destroy
    @scenario.destroy
     user_projects_path(current_user)
  end

  private

  def find_scenario
    @scenario = Scenario.includes(:project).find(params[:id])
  end

  def find_project
    @scenario.project
  end

  def scenario_params
    params.require(:scenario).permit!
  end
end