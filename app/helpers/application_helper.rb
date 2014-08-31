module ApplicationHelper
  TEMPLATE_DIR = File.join(File.dirname(__FILE__), "../views")
  LAYOUT_DIR   = File.join(TEMPLATE_DIR, "layouts")

  def template name, layout=:application
    render File.join(LAYOUT_DIR, "#{layout}.haml") do
      render File.join(TEMPLATE_DIR, "#{name}.haml")
    end
  end

  def stylesheet name
    %Q{<link type="text/css" rel="stylesheet" href="/assets/#{name}.css">}
  end

  def javascript name
    %Q{<script src="/assets/#{name}.js"></script>}
  end
end
