json.array!(@periods) do |period|
	json.extract! period, :id, :title
	json.title period.title
	json.start period.commence_datetime
	json.editable true
	json.url period_url(period, format: :html)
end
