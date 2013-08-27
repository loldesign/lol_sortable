#encoding: utf-8
class ProjectsController < ApplicationController
  before_filter :create_projects

  def index
    @projects = Project.prioritized
  end

  private

  def create_projects
     10.times.collect{|x| Project.create } if Project.count <= 0
  end 
end