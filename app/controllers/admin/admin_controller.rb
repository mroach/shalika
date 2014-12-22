class Admin::AdminController < ApplicationController
  layout 'admin'

  http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASS']
end
