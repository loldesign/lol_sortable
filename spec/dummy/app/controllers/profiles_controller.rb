#encoding: utf-8
class ProfilesController < ApplicationController
  before_filter :create_profiles

  def index
    @profiles = Profile.prioritized
  end

  private

  def create_profiles
     10.times.collect{|x| Profile.create } if Profile.count <= 0
  end 
end