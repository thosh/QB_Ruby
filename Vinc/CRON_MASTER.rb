loop{
t = Time.now
puts t.strftime("%H:%M%p")

if t.strftime("%H") == "10"
	puts "CreateNewUpdateNewxATMS.rb"
	load 'CreateNewUpdateNewxATMS.rb'
	puts "CreateNewATMS_NSB_Milestones.rb"
	load'CreateNewATMS_NSB_Milestones.rb'
end

sleep 60*59
}