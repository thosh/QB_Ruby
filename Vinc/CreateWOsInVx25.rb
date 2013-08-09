require 'quickbase_client'
require 'rexml/document'
include REXML

wos_tableDBID = "bhd8qy5aa"

awarded_units = ["3163","3164","3165","3166","3167","3168","3169","3170","3171","3172","3173","3174","3175","3176","3177","3178","3179","3180","3181","3182","3183","3184","3185","3186","3187","3188","3189","3190","3191","3192","3193","3194","3195","3196","3197","3198","3199","3200","3201","3202","3203","3204","3205","3206","3207","3208","3209","3210","3211","3212","3213","3214","3215","3216","3217","3218","3219","3220","3221","3222"]
milestones = ["1810","1811","1812","1813","1814","1815","1816","1817","1818","1819","1820","1821","1753","1822","1823","1824","1825","1826","1827","1828","1829","1830","1831","1832","1833","1834","1835","1836","1837","1754","1838","1839","1840","1841","1842","1843","1844","1845","1846","1847","1848","1849","1850","1851","1852","1853","1854","1855","1856","1857","1858","1859","1860","1861","1862","1863","1864"]


username = "tom.p.shannon@gmail.com"
password = "e7AI2GOQ"

#new QB requirement: must include "org", i.e. www.vinculums.quickbase.com
qbc = QuickBase::Client.init({"username" => username, "password" => password,  "org" => "vinculums"})
qbc.printRequestsAndResponses = false

awarded_units.each {|au|
	milestones.each {|m|
		qbc.addFieldValuePair("Related Project Milestone",nil,nil,m)
		qbc.addFieldValuePair("Related Awarded Unit",nil,nil,au)
		qbc.addFieldValuePair("Related Project",nil,nil,"33")
		qbc.addRecord(wos_tableDBID,qbc.fvlist)
		qbc.clearFieldValuePairList
	}
}