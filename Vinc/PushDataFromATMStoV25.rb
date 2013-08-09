require 'quickbase_client'
require 'rexml/document'
include REXML

milestones_tableDBID = "bhvm3btxc"
workorders_tableDBID = "bhd8qy5aa"

special_vx25_ids = []
vx25_record_ids = []
vx25_wos = []
vx25_wo_fcst = []
vx25_wo_act = []
vx25_wo_fcst_dates = []
vx25_wo_act_dates = []


username = "tom.p.shannon@gmail.com"
password = "e7AI2GOQ"

#new QB requirement: must include "org", i.e. www.vinculums.quickbase.com
qbc = QuickBase::Client.init({"username" => username, "password" => password,  "org" => "vinculums"})
qbc.printRequestsAndResponses = false

#gathers paypoint WOs from V2.5 in query q=179
doc = Document.new("<xml>" + qbc.doQuery( workorders_tableDBID, nil, 179, nil, nil, nil, nil, nil ).join + "</xml>")

puts doc

#gathers the project code-CASPR_proj_no-milestone relations and...
# doc.elements.each("xml/record/atms_v25_ms_code_projno_ms") do |ele|
	# special_vx25_ids << ele.text
# end

# ... their WOIDs
# doc.elements.each("xml/record/workorder_id") do |ele|
	# vx25_record_ids << ele.text
# end

# matches the ATMS-milestone to the WO, inserting the Record ID# 
# for the milestone into the WO's Related ATMSproj_noMilestone
# special_vx25_ids.each_index {|i|
	# rid = []
	# checks ATMS for the Record ID# (fid 3) 
	# that matches that unique (in ATMS) project code-CASPR_proj_no-milestone
	# to the WOs that share the project code-CASPR_proj_no-milestone
	# the_query = Document.new("<xml>" +  qbc.doQuery(milestones_tableDBID,"{'155'.EX.\'" + special_vx25_ids[i] + "\'}",nil,nil,"3",nil, nil, nil ).join + "</xml>").elements.each("xml/record/record_id_") { |ele| rid << ele.text}
	# if rid[0]
		# qbc.addFieldValuePair("Related ATMSproj_noMilestone",nil,nil,rid[0])
		# qbc.editRecord(workorders_tableDBID, vx25_record_ids[i],qbc.fvlist)
	# end
# }

# doc2 = Document.new("<xml>" + qbc.doQuery( workorders_tableDBID, nil, 192, nil, nil, nil, nil, nil ).join + "</xml>")
# doc3 = Document.new("<xml>" + qbc.doQuery( workorders_tableDBID, nil, 193, nil, nil, nil, nil, nil ).join + "</xml>")
# puts doc2
# puts doc3

# doc2.elements.each("xml/record/workorder_id") do |ele|
	# vx25_wo_fcst << ele.text
# end

# doc2.elements.each("xml/record/atms_proposed_wo_completion_date") do |ele|
	# vx25_wo_fcst_dates << ele.text
# end

# doc3.elements.each("xml/record/workorder_id") do |ele|
	# vx25_wo_act << ele.text
# end

# doc3.elements.each("xml/record/atms_proposed_wo_forecast_date") do |ele|
	# vx25_wo_act_dates << ele.text
# end

# vx25_wo_fcst.each_index {|i|
# puts vx25_wo_fcst[i] + " " + vx25_wo_fcst_dates[i]
# puts vx25_wo_act, vx25_wo_act_dates
# }