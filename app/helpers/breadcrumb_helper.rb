module BreadcrumbHelper
  def breadcrumb_label
    params[:controller]
  end

  def breadcrumb_root_path
    send(:"#{params[:controller]}_path")
  end
end