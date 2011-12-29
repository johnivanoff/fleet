module LocationsHelper
  
  def edit_link(c)
    link_to "Edit", edit_location_path(c)
  end
  
  def show_link(c)
    link_to "Show", location_path(c)
  end
  
  def destroy_link(c)
    link_to "Destroy", c, :confirm => 'Are you sure?', :method => :delete
  end
 
  def completed?(location)
#    RedCloth.new(check_box_tag("location["+location.id.to_s+"][completed]", "1", location["completed"]==true, "onclick" => "document.location.href='#{complete_location_path(location)}'") + 
#    " " + 
#    location.name).to_html
#    check_box_tag("location["+location.id.to_s+"][completed]", "1", location["completed"]==true, "onclick" => "document.location.href='#{completed_location_path(location)}'") + 
#   " " + 
    location.name
  end

  def location_tree location
    content_tag :ul do
      location.children.map do |c|
        content_tag(:li, completed?(c).html_safe + " " + edit_link(c) + " " + show_link(c) + " " + destroy_link(c)) +
        (location_tree c unless c.children.empty?).to_s
      end.join.html_safe
    end
  end
  
end
