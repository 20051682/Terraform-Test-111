resource "aws_key_pair" "my_key" {
  key_name   = "Terraform-Test-Project-key-pair-111"
  public_key = file("/Users/hiroshkoshila/terraform-test-project-111/KeyPair/Terraform-Test-Project-key-pair-111.pem") 
}
