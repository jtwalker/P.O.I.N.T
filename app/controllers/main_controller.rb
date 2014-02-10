class MainController < ApplicationController
  # GET /main/home
  def home
    populate_google_map_with_pois()
  end

  # GET /main/rules
  def rules

  end

  # GET /main/underconstruction
  def underconstruction

  end

  private

  def populate_google_map_with_pois()
    @gmappois = PointOfInterest.all
    @hash = Gmaps4rails.build_markers(@gmappois) do |gmappoi, marker| 
      @gmappoi = gmappoi
      marker.lat gmappoi.latitude
      marker.lng gmappoi.longitude
      marker.title gmappoi.summary
      marker.infowindow render_to_string(:partial => "/gmaps/infowindow", :locals => { :gmappoi => gmappoi })
      # marker.infowindow view_context.link_to(gmappoi.summary, "point_of_interests/" + gmappoi.id.to_s)
      marker.json({ title: gmappoi.id })
    end
  end
end
