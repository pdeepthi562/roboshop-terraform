output "alb" {
  value = lookup(look(lookup(module.alb, "private", null), "alb" ,null) ,"dns_name", null)
}