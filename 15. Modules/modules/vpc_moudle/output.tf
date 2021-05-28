output "privateid" {
    value = aws_subnet.private_subnet.id  
}

output "publicid" {
  value = aws_subnet.public_subnet.id
}