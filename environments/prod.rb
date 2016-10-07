name "Production"
description "For Production!!!"
cookbook "Thiru-Apache", "= 0.1.0"
override_attributes({
	"pci" => {
		"in_scope" => true
	}
})