# the filter method receives an event and must return a list of events.
# Dropping an event means not including it in the return array,
# while creating new ones only requires you to add a new instance of
# LogStash::Event to the returned array
def filter(event)
  id = event.get("sta_id")
  name = event.get("sta_name")
  status = event.get("sta_status")
	lat = event.get("sta_lat")
	lon = event.get("sta_long")
  location = {
    "lat" => lat,
    "lon" => lon
  }
  operator_id = event.get("loc_id")
  operator_code = event.get("loc_code")
  operator_name = event.get("loc_name")
  operator ={
    "id" => operator_id,
    "code" => operator_code,
    "name" => operator_name
  }
  warehouse = event.get("is_warehouse")
 
  event.set("id", id)
  event.set("name", name)
  event.set("status", status)
  event.set("location", location)
  event.set("operator", operator)
  event.set("warehouse", warehouse)
  
  event.remove("sta_id")
	event.remove("sta_name")
	event.remove("sta_desc")
	event.remove("sta_add_user")
	event.remove("sta_add_date")
	event.remove("sta_update_user")
	event.remove("sta_update_date")
	event.remove("sta_status")
	event.remove("sta_lat")
	event.remove("sta_long")
	event.remove("sta_location_desc")
	event.remove("sta_loc")
	event.remove("sta_icon")
	event.remove("sta_deleted")
	event.remove("is_warehouse")
	event.remove("sta_hide")
  event.remove("loc_desc")
  event.remove("loc_icon")
  event.remove("loc_cms_domain")
  event.remove("loc_created")
  event.remove("loc_logo")
  event.remove("loc_name")
  event.remove("loc_max_bike")
  event.remove("loc_id")
  event.remove("loc_code")
  event.remove("loc_max_station")
  event.remove("loc_colors")

  return [event]  
  end
  