# Information of the webserver instance created by the module
output "webserver" {
  value       = module.ec2_instance.webserver
  description = "Webserver resource information from the module."
}
