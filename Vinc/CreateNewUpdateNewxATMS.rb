require 'quickbase_client'
require 'rexml/document'
include REXML

caspr_tableDBID = "bhvmvz37h"
falocation_tableDBID = "bhvmv6dbi"
proj_nos_tableDBID = "bhvmwfiur"
milestones_tableDBID = "bhvm3btxc"

proj_nos = []
fa_locations = []
milestones = []

username = "tom.p.shannon@gmail.com"
password = "e7AI2GOQ"

#new QB requirement: must include "org", i.e. www.vinculums.quickbase.com
qbc = QuickBase::Client.init({"username" => username, "password" => password,  "org" => "vinculums"})
qbc.printRequestsAndResponses = false

doc = Document.new("<xml>" + qbc.doQuery( caspr_tableDBID, nil, 66, nil, nil, nil, nil, nil ).join + "</xml>") #check for new CASPR no FA Loctions

#gather new FA Locations into an array
doc.elements.each("xml/record/fa_location") do |ele|
	fa_locations << ele.text
end

#add each new FA Location only once (uniq)
fa_locations.uniq.each do |fa|
	qbc.addFieldValuePair("fa_location",nil,nil,fa)
	qbc.addRecord(falocation_tableDBID,qbc.fvlist)
	qbc.clearFieldValuePairList
end

fa_locations.clear

doc2 = Document.new("<xml>" + qbc.doQuery( caspr_tableDBID, nil, 67, nil, nil, nil, nil, nil ).join + "</xml>") #check for new CASPR no Vinc Project Updates

#gather proj_nos into an array
doc2.elements.each("xml/record/proj_no") do |ele|
	proj_nos << ele.text
end

#gather FA Locations into an array
doc2.elements.each("xml/record/fa_location") do |ele|
	fa_locations << ele.text
end

#for each new proj_no, add new Vinc Project Update with the related CASPR proj_no data and FA Location
proj_nos.each_index {|i|
	qbc.addFieldValuePair("proj_no",nil,nil,proj_nos[i])
	qbc.addFieldValuePair("fa_location",nil,nil,fa_locations[i])
	qbc.addRecord(proj_nos_tableDBID,qbc.fvlist)
	qbc.clearFieldValuePairList
}

#add a milestone (total of 57 with Record IDs 1-57) for each new Vinc Project Update
milestones = *1..57
milestones << 111
milestones << 112
proj_nos.each_index {|i|
	milestones.each {|x|
		qbc.addFieldValuePair("proj_no",nil,nil,proj_nos[i])
		qbc.addFieldValuePair("Related CASPR",nil,nil,proj_nos[i])
		qbc.addFieldValuePair("Related Component",nil,nil,x.to_s)
		qbc.addRecord(milestones_tableDBID,qbc.fvlist)
		qbc.clearFieldValuePairList
	}
}