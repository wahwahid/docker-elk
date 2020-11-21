# the filter method receives an event and must return a list of events.
# Dropping an event means not including it in the return array,
# while creating new ones only requires you to add a new instance of
# LogStash::Event to the returned array
def filter(event)
id = event.get("loc_id")
code = event.get("loc_code")
name = event.get("loc_name")
event.set('id', id)
event.set('code', code)
event.set('name', name)

event.remove('loc_desc')
event.remove('loc_icon')
event.remove('loc_cms_domain')
event.remove('loc_created')
event.remove('loc_logo')
event.remove('loc_name')
event.remove('loc_max_bike')
event.remove('loc_id')
event.remove('loc_code')
event.remove('loc_max_station')
event.remove('loc_colors')
return [event]  
end
