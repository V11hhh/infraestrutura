variable "env" {
  type = string
}

data "template_file" "conditional" {
    template = file("./vm/condi.json")
    count = var.env == "prod" ? 1 : 0
    vars = {
      "value" = "Producao"
    }
}

output "conditional" {
    value = data.template_file.conditional.*.rendered
}
