json.array! @campaigns do |campaign|
  json.id      campaign.id
  json.title   campaign.title
  json.details campaign.details
end