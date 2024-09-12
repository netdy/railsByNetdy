# app/controllers/pwa_controller.rb
class PwaController < ApplicationController
  def manifest
    render json: File.read(Rails.root.join("public", "manifest.json")), content_type: "application/json"
  end

  def service_worker
    render js: File.read(Rails.root.join("public", "service-worker.js")), content_type: "application/javascript"
  end
end
