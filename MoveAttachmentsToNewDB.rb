require 'quickbase_client'

orig_tableDBID = "bgrhxym7s"
target_tableDBID = "bhx9udwg6"
username = "tom.p.shannon@gmail.com"
password = "e7AI2GOQ"

#new QB requirement: must include "org", i.e. www.vinculums.quickbase.com
qbc = QuickBase::Client.init({"username" => username, "password" => password,  "org" => "vinculums"})
qbc.printRequestsAndResponses = false
fid = qbc.lookupFieldIDByName("Attachment",orig_tableDBID)  
  
qbc.iterateRecords(orig_tableDBID,["Record ID#","Attachment","Checkbox", "Related Awarded Unit", "Type", "Description","LinksProjectsJoin - Project | Link"]){|source_record|
if source_record["Checkbox"] == "1"
qbc.downLoadFile(orig_tableDBID,source_record["Record ID#"],fid)
if qbc.fileContents
File.open(source_record["LinksProjectsJoin - Project | Link"].gsub(/[\\\/\|\n\r]/,"-") + " - " + source_record["Type"] + " - " + source_record["Description"].gsub(/[\\\/\|\n\r]/,"-") + " - " + source_record["Record ID#"] + " - " + source_record["Attachment"], "wb" ){|f| 
		f.write(qbc.fileContents) 
		f.flush}
# qbc.uploadFile(target_tableDBID,source_record["Attachment"],"Attachment", { "Related Awarded Unit" => "1", "Type" => source_record["Type"], "Related Project" => "8", "Description" => source_record["Description"] })
end   
end
puts source_record["Record ID#"]
}