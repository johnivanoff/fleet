module LocationsHelper
  
  def edit_link(c)
    link_to t('.edit_html'), edit_location_path(c)
  end
  
  def show_link(c)
    link_to t('.show_html'), location_path(c)
  end
  
  def destroy_link(c)
    link_to t('.destroy_html'), c, :confirm => 'Are you sure?', :method => :delete
  end
 
  def location_name?(location)
    location.name
  end

  def location_tree location
    content_tag :ul do
      location.children.map do |c|
        content_tag(:li, location_name?(c).html_safe + " " + edit_link(c) + " " + show_link(c) + " " + destroy_link(c)) +
        (location_tree c unless c.children.empty?).to_s
      end.join.html_safe
    end
  end
  
end
