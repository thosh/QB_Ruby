require 'quickbase_client'
require 'rexml/document'
include REXML

tableDBID = "bfz3gftzv"

location_ids = ["6090", "6091", "6092", "6093", "6094", "6095", "6096", "6097", "6098", "6099", "6100", "6101", "6102", "6103", "6104", "6105", "6106", "6107", "6108", "6109", "6110", "6111", "6112", "6113", "6114", "6115", "6116", "6117", "6118", "6119", "6120", "6121", "6122", "6123", "6124", "6125", "6126", "6127", "6128", "6129", "6130", "6131", "6132", "6133", "6134", "6135", "6136", "6137", "6138", "6139", "6140", "6141", "6142", "6143", "6144", "6145", "6146", "6147", "6148", "6149", "6150", "6151", "6152", "6153", "6154", "6155", "6156", "6157", "6158", "6159", "6160", "6161", "6162", "6163", "6164", "6165", "6166", "6167", "6168", "6169", "6170", "6171", "6172", "6173", "6174", "6175", "6176", "6177", "6178", "6179", "6180", "6181", "6182", "6183", "6184", "6185", "6186", "6187", "6188", "6189", "6190", "6191", "6192", "6193", "6194", "6195", "6196", "6197", "6198", "6199", "6200", "6201", "6202", "6203", "6204", "6205", "6206", "6207", "6208", "6209", "6210", "6211", "6212", "6213", "6214", "6215", "6216", "6217", "6218", "6219", "6220", "6221", "6222", "6223", "6224", "6225", "6226", "6227", "6228", "6229", "6230", "6231", "6232", "6233", "6234", "6235", "6236", "6237", "6238", "6239", "6240", "6241", "6242", "6243", "6244", "6245", "6246", "6247", "6248", "6249", "6250", "6251", "6252"]

username = "tom.shannon@regencylighting.com"
password = "R3g3ncy.c0m"

#new QB requirement: must include "org", i.e. www.regencylighting.quickbase.com
qbc = QuickBase::Client.init({"username" => username, "password" => password,  "org" => "regencylighting"})
qbc.printRequestsAndResponses = false

location_ids.each_index {|i|
qbc.addFieldValuePair("Related Location",nil,nil,location_ids[i])
qbc.addFieldValuePair("Task Number",nil,nil,"2")
qbc.addFieldValuePair("Project Phase",nil,nil,"Planning")
qbc.addFieldValuePair("Task Name",nil,nil,"Audit Order Entered")
qbc.addFieldValuePair("Start Date",nil,nil,"02-01-2013")
qbc.addFieldValuePair("Duration",nil,nil,"1")
qbc.addFieldValuePair("Point Person",nil,nil,"PA")
qbc.addFieldValuePair("Status",nil,nil,"Completed")
qbc.addFieldValuePair("Task_Typle",nil,nil,"FALSE")
qbc.addRecord(tableDBID,qbc.fvlist)
qbc.clearFieldValuePairList

qbc.addFieldValuePair("Related Location",nil,nil,location_ids[i])
qbc.addFieldValuePair("Task Number",nil,nil,"3")
qbc.addFieldValuePair("Project Phase",nil,nil,"Planning")
qbc.addFieldValuePair("Task Name",nil,nil,"Audit Billed")
qbc.addFieldValuePair("Start Date",nil,nil,"03-01-2013")
qbc.addFieldValuePair("Duration",nil,nil,"30")
qbc.addFieldValuePair("Point Person",nil,nil,"PA")
qbc.addFieldValuePair("Status",nil,nil,"Not Started")
qbc.addFieldValuePair("Task_Typle",nil,nil,"FALSE")
qbc.addRecord(tableDBID,qbc.fvlist)
qbc.clearFieldValuePairList

qbc.addFieldValuePair("Related Location",nil,nil,location_ids[i])
qbc.addFieldValuePair("Task Number",nil,nil,"4")
qbc.addFieldValuePair("Project Phase",nil,nil,"Planning")
qbc.addFieldValuePair("Task Name",nil,nil,"Audit Data Transferred to Share Drive")
qbc.addFieldValuePair("Start Date",nil,nil,"02-02-2013")
qbc.addFieldValuePair("Duration",nil,nil,"1")
qbc.addFieldValuePair("Point Person",nil,nil,"PA")
qbc.addFieldValuePair("Status",nil,nil,"Not Started")
qbc.addFieldValuePair("Task_Typle",nil,nil,"FALSE")
qbc.addRecord(tableDBID,qbc.fvlist)
qbc.clearFieldValuePairList

qbc.addFieldValuePair("Related Location",nil,nil,location_ids[i])
qbc.addFieldValuePair("Task Number",nil,nil,"5")
qbc.addFieldValuePair("Project Phase",nil,nil,"Planning")
qbc.addFieldValuePair("Task Name",nil,nil,"Audit Data Reviewed and Entered into E4")
qbc.addFieldValuePair("Start Date",nil,nil,"03-02-2013")
qbc.addFieldValuePair("Duration",nil,nil,"0")
qbc.addFieldValuePair("Point Person",nil,nil,"PC")
qbc.addFieldValuePair("Status",nil,nil,"Not Started")
qbc.addFieldValuePair("Task_Typle",nil,nil,"FALSE")
qbc.addRecord(tableDBID,qbc.fvlist)
qbc.clearFieldValuePairList

qbc.addFieldValuePair("Related Location",nil,nil,location_ids[i])
qbc.addFieldValuePair("Task Number",nil,nil,"6")
qbc.addFieldValuePair("Project Phase",nil,nil,"Planning")
qbc.addFieldValuePair("Task Name",nil,nil,"Project Scheduled for Design")
qbc.addFieldValuePair("Start Date",nil,nil,"03-02-2013")
qbc.addFieldValuePair("Duration",nil,nil,"0")
qbc.addFieldValuePair("Point Person",nil,nil,"PC")
qbc.addFieldValuePair("Status",nil,nil,"Not Started")
qbc.addFieldValuePair("Task_Typle",nil,nil,"FALSE")
qbc.addRecord(tableDBID,qbc.fvlist)
qbc.clearFieldValuePairList

qbc.addFieldValuePair("Related Location",nil,nil,location_ids[i])
qbc.addFieldValuePair("Task Number",nil,nil,"7")
qbc.addFieldValuePair("Project Phase",nil,nil,"Planning")
qbc.addFieldValuePair("Task Name",nil,nil,"Project Scheduled for Review")
qbc.addFieldValuePair("Start Date",nil,nil,"03-02-2013")
qbc.addFieldValuePair("Duration",nil,nil,"0")
qbc.addFieldValuePair("Point Person",nil,nil,"LPM")
qbc.addFieldValuePair("Status",nil,nil,"Not Started")
qbc.addFieldValuePair("Task_Typle",nil,nil,"TRUE")
qbc.addRecord(tableDBID,qbc.fvlist)
qbc.clearFieldValuePairList

qbc.addFieldValuePair("Related Location",nil,nil,location_ids[i])
qbc.addFieldValuePair("Task Number",nil,nil,"5")
qbc.addFieldValuePair("Project Phase",nil,nil,"Planning")
qbc.addFieldValuePair("Task Name",nil,nil,"Specification Notes Reviewed")
qbc.addFieldValuePair("Start Date",nil,nil,"03-02-2013")
qbc.addFieldValuePair("Duration",nil,nil,"0")
qbc.addFieldValuePair("Point Person",nil,nil,"LPM")
qbc.addFieldValuePair("Status",nil,nil,"Not Started")
qbc.addFieldValuePair("Task_Typle",nil,nil,"FALSE")
qbc.addRecord(tableDBID,qbc.fvlist)
qbc.clearFieldValuePairList

qbc.addFieldValuePair("Related Location",nil,nil,location_ids[i])
qbc.addFieldValuePair("Task Number",nil,nil,"6")
qbc.addFieldValuePair("Project Phase",nil,nil,"Planning")
qbc.addFieldValuePair("Task Name",nil,nil,"Proposed Applications Entered into E4")
qbc.addFieldValuePair("Start Date",nil,nil,"03-02-2013")
qbc.addFieldValuePair("Duration",nil,nil,"0")
qbc.addFieldValuePair("Point Person",nil,nil,"PC")
qbc.addFieldValuePair("Status",nil,nil,"Not Started")
qbc.addFieldValuePair("Task_Typle",nil,nil,"FALSE")
qbc.addRecord(tableDBID,qbc.fvlist)
qbc.clearFieldValuePairList

qbc.addFieldValuePair("Related Location",nil,nil,location_ids[i])
qbc.addFieldValuePair("Task Number",nil,nil,"7")
qbc.addFieldValuePair("Project Phase",nil,nil,"Planning")
qbc.addFieldValuePair("Task Name",nil,nil,"Submittal Sent to Customer")
qbc.addFieldValuePair("Start Date",nil,nil,"03-02-2013")
qbc.addFieldValuePair("Duration",nil,nil,"2")
qbc.addFieldValuePair("Point Person",nil,nil,"PC")
qbc.addFieldValuePair("Status",nil,nil,"Not Started")
qbc.addFieldValuePair("Task_Typle",nil,nil,"TRUE")
qbc.addRecord(tableDBID,qbc.fvlist)
qbc.clearFieldValuePairList

qbc.addFieldValuePair("Related Location",nil,nil,location_ids[i])
qbc.addFieldValuePair("Task Number",nil,nil,"8")
qbc.addFieldValuePair("Project Phase",nil,nil,"Execution")
qbc.addFieldValuePair("Task Name",nil,nil,"Purchase Order Received")
qbc.addFieldValuePair("Start Date",nil,nil,"05-02-2013")
qbc.addFieldValuePair("Duration",nil,nil,"14")
qbc.addFieldValuePair("Point Person",nil,nil,"PA")
qbc.addFieldValuePair("Status",nil,nil,"Not Started")
qbc.addFieldValuePair("Task_Typle",nil,nil,"TRUE")
qbc.addRecord(tableDBID,qbc.fvlist)
qbc.clearFieldValuePairList

qbc.addFieldValuePair("Related Location",nil,nil,location_ids[i])
qbc.addFieldValuePair("Task Number",nil,nil,"9")
qbc.addFieldValuePair("Project Phase",nil,nil,"Execution")
qbc.addFieldValuePair("Task Name",nil,nil,"Order Entry Complete")
qbc.addFieldValuePair("Start Date",nil,nil,"19-02-2013")
qbc.addFieldValuePair("Duration",nil,nil,"1")
qbc.addFieldValuePair("Point Person",nil,nil,"PA")
qbc.addFieldValuePair("Status",nil,nil,"Not Started")
qbc.addFieldValuePair("Task_Typle",nil,nil,"FALSE")
qbc.addRecord(tableDBID,qbc.fvlist)
qbc.clearFieldValuePairList

qbc.addFieldValuePair("Related Location",nil,nil,location_ids[i])
qbc.addFieldValuePair("Task Number",nil,nil,"10")
qbc.addFieldValuePair("Project Phase",nil,nil,"Execution")
qbc.addFieldValuePair("Task Name",nil,nil,"Approval Process Complete")
qbc.addFieldValuePair("Start Date",nil,nil,"20-02-2013")
qbc.addFieldValuePair("Duration",nil,nil,"7")
qbc.addFieldValuePair("Point Person",nil,nil,"PC")
qbc.addFieldValuePair("Status",nil,nil,"Not Started")
qbc.addFieldValuePair("Task_Typle",nil,nil,"FALSE")
qbc.addRecord(tableDBID,qbc.fvlist)
qbc.clearFieldValuePairList

qbc.addFieldValuePair("Related Location",nil,nil,location_ids[i])
qbc.addFieldValuePair("Task Number",nil,nil,"11")
qbc.addFieldValuePair("Project Phase",nil,nil,"Execution")
qbc.addFieldValuePair("Task Name",nil,nil,"ETA to RL Warehouse")
qbc.addFieldValuePair("Start Date",nil,nil,"27-02-2013")
qbc.addFieldValuePair("Duration",nil,nil,"1")
qbc.addFieldValuePair("Point Person",nil,nil,"PC")
qbc.addFieldValuePair("Status",nil,nil,"Not Started")
qbc.addFieldValuePair("Task_Typle",nil,nil,"TRUE")
qbc.addRecord(tableDBID,qbc.fvlist)
qbc.clearFieldValuePairList

qbc.addFieldValuePair("Related Location",nil,nil,location_ids[i])
qbc.addFieldValuePair("Task Number",nil,nil,"11")
qbc.addFieldValuePair("Project Phase",nil,nil,"Execution")
qbc.addFieldValuePair("Task Name",nil,nil,"ESD Communicated to Client")
qbc.addFieldValuePair("Start Date",nil,nil,"28-02-2013")
qbc.addFieldValuePair("Duration",nil,nil,"1")
qbc.addFieldValuePair("Point Person",nil,nil,"PC")
qbc.addFieldValuePair("Status",nil,nil,"Not Started")
qbc.addFieldValuePair("Task_Typle",nil,nil,"FALSE")
qbc.addRecord(tableDBID,qbc.fvlist)
qbc.clearFieldValuePairList

qbc.addFieldValuePair("Related Location",nil,nil,location_ids[i])
qbc.addFieldValuePair("Task Number",nil,nil,"12")
qbc.addFieldValuePair("Project Phase",nil,nil,"Execution")
qbc.addFieldValuePair("Task Name",nil,nil,"Materials Shipped")
qbc.addFieldValuePair("Start Date",nil,nil,"01-03-2013")
qbc.addFieldValuePair("Duration",nil,nil,"32")
qbc.addFieldValuePair("Point Person",nil,nil,"PC")
qbc.addFieldValuePair("Status",nil,nil,"Not Started")
qbc.addFieldValuePair("Task_Typle",nil,nil,"TRUE")
qbc.addRecord(tableDBID,qbc.fvlist)
qbc.clearFieldValuePairList

qbc.addFieldValuePair("Related Location",nil,nil,location_ids[i])
qbc.addFieldValuePair("Task Number",nil,nil,"12")
qbc.addFieldValuePair("Project Phase",nil,nil,"Execution")
qbc.addFieldValuePair("Task Name",nil,nil,"Materials Billing Complete")
qbc.addFieldValuePair("Start Date",nil,nil,"02-04-2013")
qbc.addFieldValuePair("Duration",nil,nil,"1")
qbc.addFieldValuePair("Point Person",nil,nil,"PC")
qbc.addFieldValuePair("Status",nil,nil,"Not Started")
qbc.addFieldValuePair("Task_Typle",nil,nil,"TRUE")
qbc.addRecord(tableDBID,qbc.fvlist)
qbc.clearFieldValuePairList

qbc.addFieldValuePair("Related Location",nil,nil,location_ids[i])
qbc.addFieldValuePair("Task Number",nil,nil,"13")
qbc.addFieldValuePair("Project Phase",nil,nil,"Execution")
qbc.addFieldValuePair("Task Name",nil,nil,"Warranty Guide Complete")
qbc.addFieldValuePair("Start Date",nil,nil,"03-04-2013")
qbc.addFieldValuePair("Duration",nil,nil,"0")
qbc.addFieldValuePair("Point Person",nil,nil,"PA")
qbc.addFieldValuePair("Status",nil,nil,"Not Started")
qbc.addFieldValuePair("Task_Typle",nil,nil,"FALSE")
qbc.addRecord(tableDBID,qbc.fvlist)
qbc.clearFieldValuePairList

qbc.addFieldValuePair("Related Location",nil,nil,location_ids[i])
qbc.addFieldValuePair("Task Number",nil,nil,"14")
qbc.addFieldValuePair("Project Phase",nil,nil,"Close-Out")
qbc.addFieldValuePair("Task Name",nil,nil,"Warranty Guide Sent to Client")
qbc.addFieldValuePair("Start Date",nil,nil,"03-04-2013")
qbc.addFieldValuePair("Duration",nil,nil,"0")
qbc.addFieldValuePair("Point Person",nil,nil,"PA")
qbc.addFieldValuePair("Status",nil,nil,"Not Started")
qbc.addFieldValuePair("Task_Typle",nil,nil,"TRUE")
qbc.addRecord(tableDBID,qbc.fvlist)
qbc.clearFieldValuePairList

qbc.addFieldValuePair("Related Location",nil,nil,location_ids[i])
qbc.addFieldValuePair("Task Number",nil,nil,"15")
qbc.addFieldValuePair("Project Phase",nil,nil,"Close-Out")
qbc.addFieldValuePair("Task Name",nil,nil,"Warranty Handoff Complete")
qbc.addFieldValuePair("Start Date",nil,nil,"03-04-2013")
qbc.addFieldValuePair("Duration",nil,nil,"0")
qbc.addFieldValuePair("Point Person",nil,nil,"PA")
qbc.addFieldValuePair("Status",nil,nil,"Not Started")
qbc.addFieldValuePair("Task_Typle",nil,nil,"FALSE")
qbc.addRecord(tableDBID,qbc.fvlist)
qbc.clearFieldValuePairList

qbc.addFieldValuePair("Related Location",nil,nil,location_ids[i])
qbc.addFieldValuePair("Task Number",nil,nil,"16")
qbc.addFieldValuePair("Project Phase",nil,nil,"Close-Out")
qbc.addFieldValuePair("Task Name",nil,nil,"Photometric Readings Certified")
qbc.addFieldValuePair("Start Date",nil,nil,"03-04-2013")
qbc.addFieldValuePair("Duration",nil,nil,"0")
qbc.addFieldValuePair("Point Person",nil,nil,"LPM")
qbc.addFieldValuePair("Status",nil,nil,"Not Started")
qbc.addFieldValuePair("Task_Typle",nil,nil,"TRUE")
qbc.addRecord(tableDBID,qbc.fvlist)
qbc.clearFieldValuePairList

qbc.addFieldValuePair("Related Location",nil,nil,location_ids[i])
qbc.addFieldValuePair("Task Number",nil,nil,"17")
qbc.addFieldValuePair("Project Phase",nil,nil,"Close-Out")
qbc.addFieldValuePair("Task Name",nil,nil,"Customer Contacted for Feedback")
qbc.addFieldValuePair("Start Date",nil,nil,"03-04-2013")
qbc.addFieldValuePair("Duration",nil,nil,"0")
qbc.addFieldValuePair("Point Person",nil,nil,"LPM")
qbc.addFieldValuePair("Status",nil,nil,"Not Started")
qbc.addFieldValuePair("Task_Typle",nil,nil,"FALSE")
qbc.addRecord(tableDBID,qbc.fvlist)
qbc.clearFieldValuePairList

qbc.addFieldValuePair("Related Location",nil,nil,location_ids[i])
qbc.addFieldValuePair("Task Number",nil,nil,"18")
qbc.addFieldValuePair("Project Phase",nil,nil,"Close-Out")
qbc.addFieldValuePair("Task Name",nil,nil,"P/L complete")
qbc.addFieldValuePair("Start Date",nil,nil,"03-04-2013")
qbc.addFieldValuePair("Duration",nil,nil,"0")
qbc.addFieldValuePair("Point Person",nil,nil,"PA")
qbc.addFieldValuePair("Status",nil,nil,"Not Started")
qbc.addFieldValuePair("Task_Typle",nil,nil,"FALSE")
qbc.addRecord(tableDBID,qbc.fvlist)
qbc.clearFieldValuePairList
}