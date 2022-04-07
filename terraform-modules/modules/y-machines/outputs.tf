output vpc_id_output {
  description = "Unique id of the vpc"
  value       = aws_instance.virtual_machine.id
}
