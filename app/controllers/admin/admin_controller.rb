class Admin::AdminController < ApplicationController
  layout 'admin'

  # Disable the admin area for now
  before_action :reject

  def reject
    raise ActionController::RoutingError.new('Not Found') unless Rails.env.development?
  end
end
