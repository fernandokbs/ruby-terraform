require_relative 'terraform_generator'

provider("digitalocean", {
    "token" => "${var.do_token}"
})

variable("do_toke", {
    "token" => "77e027c7447f468068a7d4fea41e7149a75a94088082c66fcf555de3977f69d3"
}) 

resource("digital_ocean_droplet", "web", {
    "image" => "ubuntu-18-04-x64",
    "name"  => "web-1"
})

resource("digital_ocean_ssh", "personal", {
    "name" => "Personal"
})

puts output