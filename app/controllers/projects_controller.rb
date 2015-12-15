class ProjectsController < ApplicationController
  before_action :current_user
  before_action :find_project, only: [:edit, :update, :destroy]
  before_action :find_project_with_scenarios, only: :show

  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  def show
    @titles = @project.scenarios.pluck(:title).uniq
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to projects_path, flash: { success: 'Project was created successfully!' }
    else
      render :new
    end
  end

  def edit
    render :new
  end

  def update
    if @project.update(project_params)
      redirect_to projects_path, flash: { success: 'Project was updated successfully!' }
    else
      render :new
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path(current_user)
  end

  def scenario
    @scenarios = @project.scenarios.where(title: params[:title])
  end

  private

  def find_project
    @project = current_user.projects.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to projects_path, flash: { error: 'Record not foud.' }
  end

  def find_project_with_scenarios
    @project = current_user.projects.includes(:scenarios).find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to projects_path, flash: { error: 'Record not foud.' }
  end

  def project_params
    params.require(:project).permit(:title, scenarios_params: [:id, :title, :step, :order, :_destroy])
  end
end
