require 'quickbase_client'
require 'rexml/document'
include REXML

milestones_tableDBID = "bhvm3btxc"
workorders_tableDBID = "bhd8qy5aa"

#from V2.5
trf_pa__milestone_combos = []
workorder_ids = []
text_wo_forecast_dates = []
text_wo_completion_dates = []

#from ATMS
proj_no_and_milestones = []
caspr_forecast_texts = []
caspr_actual_texts = []

username = ""
password = ""

#new QB requirement: must include "org", i.e. www.vinculums.quickbase.com
qbc = QuickBase::Client.init({"username" => username, "password" => password,  "org" => "vinculums"})
qbc.printRequestsAndResponses = false

#gathers paypoint WOs from V2.5 in query q=210
doc = Document.new("<xml>" + qbc.doQuery( workorders_tableDBID, nil, 210, nil, nil, nil, nil, nil ).join + "</xml>")

# puts doc

# gathers the special IDs (trf_pa__milestone_combos)
doc.elements.each("xml/record/trf_pa__milestone_combo") do |ele|
	trf_pa__milestone_combos << ele.text
end

# ... their WOIDs
doc.elements.each("xml/record/workorder_id") do |ele|
	workorder_ids << ele.text
end

# ... their forecast dates
doc.elements.each("xml/record/text_wo_forecast_date") do |ele|
	text_wo_forecast_dates << ele.text
end

# ... their completion dates
doc.elements.each("xml/record/text_wo_completion_date") do |ele|
	text_wo_completion_dates << ele.text
end

#gathers paypoint milestones from ATMs in query q=210
doc2 = Document.new("<xml>" + qbc.doQuery( milestones_tableDBID, nil, 29, nil, nil, nil, nil, nil ).join + "</xml>")

# puts doc2

# gathers the special IDs (proj_no_and_milestones)
doc2.elements.each("xml/record/proj_no_and_milestone") do |ele|
	proj_no_and_milestones << ele.text
end

# ... their forecast dates
doc2.elements.each("xml/record/caspr_forecast_text") do |ele|
	caspr_forecast_texts << ele.text
end

# ... their completion dates
doc2.elements.each("xml/record/caspr_actual_text") do |ele|
	caspr_actual_texts << ele.text
end

