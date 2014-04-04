class User::RegistrationsController < Devise::RegistrationsController
  before_action :set_resources, only: [:new, :create, :edit, :update]

  def new
    build_resource({})
    3.times { resource.wish_universities.build }
    respond_with self.resource
  end

private
  def set_resources
    @universities = University.all
  end
end