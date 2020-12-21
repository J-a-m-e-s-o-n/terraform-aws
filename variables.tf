variable "region" {
}

variable "amis" {
	type = map(string)
	default = {
		"us-east-1" = "ami-b374d5a5"
		"us-west-2" = "ami-fc0b939c"
	}
}