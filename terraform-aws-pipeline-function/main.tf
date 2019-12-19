resource "aws_iam_policy" "pipeline-function" {
  name        = var.name
  description = "Policy for the ${var.name} Lambda function"

  policy = data.aws_iam_policy_document.pipeline-function.json
}

data "aws_iam_policy_document" "pipeline-function" {
  statement {
    actions   = ["s3:ListBucket"]
    resources = ["arn:aws:s3:::ok-origo-dataplatform-${var.env}"]
  }

  statement {
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::ok-origo-dataplatform-${var.env}/incoming/*"]
  }

  statement {
    actions   = ["s3:PutObject"]
    resources = ["arn:aws:s3:::ok-origo-dataplatform-${var.env}/intermediate/*"]
  }
}
