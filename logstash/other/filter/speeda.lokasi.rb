# the filter method receives an event and must return a list of events.
# Dropping an event means not including it in the return array,
# while creating new ones only requires you to add a new instance of
# LogStash::Event to the returned array
def filter(event)
  id = event.get("pos_id")
	lat = (event.get("pos_lat")).round(5)
	lon = (event.get("pos_long")).round(5)
  location = {
    "lat" => lat,
    "lon" => lon
  }
  stamp = event.get("pos_utc_time")
  unless stamp
    stamp = event.get("pos_insert")
  end
  t = Time.at(stamp.to_i)
  d = DateTime.parse(t.to_s)
  l = d.new_offset("+07:00")
  datetime = l.strftime("%FT%T.%L%:z")
  dayofweek = l.strftime("%u")
  hourofday = l.strftime("%H")
  src = event.get("pos_src")
  trx = event.get("pos_trx")
  bike_id = event.get("bike_id")
  bike_longid = event.get("bike_longid")
  bike_name = event.get("bike_name")
  bike_mode = event.get("bike_mode")
  bike ={
    "id" => bike_id,
    "longid" => bike_longid,
    "name" => bike_name,
    "mode" => bike_mode
  }
  operator_id = event.get("loc_id")
  operator_code = event.get("loc_code")
  operator_name = event.get("loc_name")
  operator = {
    "id" => operator_id,
    "code" => operator_code,
    "name" => operator_name
  }

  event.set("id", id)
  event.set("location", location)
  event.set("datetime", datetime)
  event.set("dayofweek", dayofweek)
  event.set("hourofday", hourofday)
  event.set("src", src)
  event.set("trx", trx)
  event.set("bike", bike)
  event.set("operator", operator)
  
  event.remove("pos_id")
	event.remove("pos_bike")
	event.remove("pos_user")
	event.remove("pos_lat")
	event.remove("pos_long")
	event.remove("pos_alt")
	event.remove("pos_course")
	event.remove("pos_speed")
	event.remove("pos_ip")
	event.remove("pos_bat")
	event.remove("pos_tz")
	event.remove("pos_utc_time")
	event.remove("pos_bt")
	event.remove("pos_src")
	event.remove("pos_satellite")
	event.remove("pos_realtime")
	event.remove("pos_inposition")
	event.remove("pos_lbs")
	event.remove("pos_wifi")
	event.remove("pos_insert")
	event.remove("pos_addr")
	event.remove("pos_desc")
	event.remove("pos_trx")
  event.remove("bike_id")
	event.remove("bike_longid")
	event.remove("bike_frame")
	event.remove("bike_mode")
	event.remove("bike_lock")
	event.remove("bike_bt_name")
	event.remove("bike_bt_pass")
	event.remove("bike_name")
	event.remove("bike_desc")
	event.remove("bike_assets_status")
	event.remove("bike_maintenance")
	event.remove("bike_asset_date")
	event.remove("bike_add_date")
	event.remove("bike_update_date")
	event.remove("bike_delete")
	event.remove("bike_delete_user")
	event.remove("bike_delete_date")
	event.remove("bike_loc")
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
  