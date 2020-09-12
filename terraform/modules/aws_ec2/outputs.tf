# Information of the webserver instance created
output "webserver" {
  value = aws_instance.webserver
  description = "Webserver resource information"
}
