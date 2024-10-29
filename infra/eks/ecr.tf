resource "aws_ecr_repository" "main" {
  name = "sherpany-polls"

  image_tag_mutability = "MUTABLE" # or "IMMUTABLE"

  tags = {
    Environment = "global"
    App       = "sherpany"
  }
}
