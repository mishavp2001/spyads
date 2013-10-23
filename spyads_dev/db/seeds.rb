# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
rs1 = Ruleset.create(:name => "Default")

ad1 = Ad.create(product_image: "http://s3.amazonaws.com/Interstitial/bs_gopay_2012.jpg", product_link: "http://gopayment.intuit.com", product_name: "GoPayment", ad_title: "GoPay 160x160", ad_tracking: "", ad_body: "", is_active: true)
ad2 = Ad.create(product_image: "http://s3.amazonaws.com/Interstitial/bs_payroll.jpg", product_link: "http://payroll.intuit.com", product_name: "Payroll", ad_title: "Payroll 160x160", ad_tracking: "", ad_body: "", is_active: true)
ad3 = Ad.create(product_image: "", product_link: "", product_name: "Payroll", ad_title: "Payroll 160x160", ad_tracking: "", ad_body: "<a href=\"http://payroll.intuit.com/\" style=\"display:block;height:249px;overflow:hidden;\"><img src=\"http://blog.intuit.com/wp-content/blogs.dir/1/uploads/Payroll_Banners_300x250.jpg\" border=\"0\"></a>", is_active: true)
ad5 = Ad.create(product_image: "https://s3.amazonaws.com/RightRail/Websites.jpg", product_link: "http://websites.intuit.com", product_name: "IWS", ad_title: "IWS 250x500", ad_tracking: "", ad_body: "", is_active: true)
ad6 = Ad.create(product_image: "https://s3.amazonaws.com/RightRail/quickbooks_ad_1.jpg", product_link: "http://quickbooks.intuit.com", product_name: "Quickbooks", ad_title: "QB 250x328", ad_tracking: "", ad_body: "", is_active: true)

Rule.create(:product_ownership => '{"tenure": ">100", "productGroup":"payroll", "productGroup": "!GYB"}', :ruleset => rs1, :ad => ad1)
Rule.create(:product_ownership => '{"tenure": ">1", "productGroup":"QB Pro", "productGroup": "!GYB"}', :ruleset => rs1, :ad => ad1)
Rule.create(:product_ownership => '{"tenure": ">0", "productGroup":"QB Pro", "productGroup": "!QBES"}', :ruleset => rs1, :ad => ad6)
Rule.create(:product_ownership => '{"tenure": ">1000", "productGroup":"QB Pro", "productGroup": "!Payments"}', :ruleset => rs1, :ad => ad6)