Gibbon::Request.api_key = "0e9e0833c3c2a648a40494bb4bb697aa-us12"
Gibbon::Request.timeout = 15
Gibbon::Request.open_timeout = 15
Gibbon::Request.symbolize_keys = true
Gibbon::Request.debug = false


gibbon.lists("a326877226").members.create(body: {email_address: "franky@gmail.com", status: "subscribed", merge_fields: {FNAME: "Frank", LNAME: "James", PHONE: "813-559-0129"}})
