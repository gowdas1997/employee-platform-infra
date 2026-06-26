#########################################
# Key Pair Outputs
#########################################

output "key_name" {
  description = "AWS EC2 Key Pair Name"
  value       = aws_key_pair.this.key_name
}

output "key_pair_id" {
  description = "AWS EC2 Key Pair ID"
  value       = aws_key_pair.this.key_pair_id
}

output "fingerprint" {
  description = "Key Pair Fingerprint"
  value       = aws_key_pair.this.fingerprint
}
