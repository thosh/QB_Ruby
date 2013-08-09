require 'quickbase_client'
require 'rexml/document'
include REXML

proj_nos_tableDBID = "bhvmwfiur"
milestones_tableDBID = "bhvm3btxc"

proj_nos = []
fa_locations = []
milestones = [66,67,68,69,70,71,72,58,73,59,74,75,76,77,78,79,80,81,82,83,84,85,86,105,60,87,61,88,89,90,91,92,93,62,106,63,94,64,95,96,97,65,98,99,100,107,108,109,101,102,103,104,105,106,107,108,109,110,111]

username = "tom.p.shannon@gmail.com"
password = "e7AI2GOQ"

#new QB requirement: must include "org", i.e. www.vinculums.quickbase.com
qbc = QuickBase::Client.init({"username" => username, "password" => password,  "org" => "vinculums"})
qbc.printRequestsAndResponses = false

doc = Document.new("<xml>" + qbc.doQuery( proj_nos_tableDBID, nil, 29, nil, nil, nil, nil, nil ).join + "</xml>") 

doc.elements.each("xml/record/proj_no") do |ele|
	proj_nos << ele.text
end

proj_nos.each_index {|i|
	milestones.each {|x|
		qbc.addFieldValuePair("proj_no",nil,nil,proj_nos[i])
		qbc.addFieldValuePair("Related CASPR",nil,nil,proj_nos[i])
		qbc.addFieldValuePair("Related Component",nil,nil,x.to_s)
		qbc.addRecord(milestones_tableDBID,qbc.fvlist)
		qbc.clearFieldValuePairList
	}
}