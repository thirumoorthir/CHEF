name "webserver"
description "Web Server"
run_list "role[base-role]", "recipe[Thiru-Apache]"
default_attributes({
	"apache" => {
		"sites" => {
			"admin" => {
				"port" => 8000
			},
			"bears" => {
				"port" => 8081
			}
		}
	}
})

# role are used to manage the run-list, this is the main reason behind architechture of roles