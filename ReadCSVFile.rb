require 'quickbase_client'

orig_tableDBID = "bhssyx5wu"
target_tableDBID = "bhsuqjn62"
username = "USERNAME"
password = "PASSWORD"

qbc = QuickBase::Client.new(username,password)
qbc.printRequestsAndResponses = false

doc = Document.new("<xml>" + qbc.doQuery( orig_tableDBID, nil, 90, nil, nil, nil, nil, nil ).join + "</xml>")

doc.elements.each("xml/record/proj_no") do |ele|
	qbc.addFieldValuePair("proj_no",nil,nil,ele.text)
	qbc.addRecord(target_tableDBID,qbc.fvlist)
	qbc.clearFieldValuePairList
end
