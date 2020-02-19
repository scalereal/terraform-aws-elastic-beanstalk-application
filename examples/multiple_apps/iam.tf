data "aws_iam_policy_document" "this" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = ["elasticbeanstalk.amazonaws.com"]
      type        = "Service"
    }
    effect = "Allow"
  }
}

resource "aws_iam_role" "this" {
  name               = "eb_appversion_deletion_role"
  assume_role_policy = data.aws_iam_policy_document.this.json
}
