data "aws_iam_policy_document" "devops_role_assumable_document" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    condition {
      test     = "StringEqualsIgnoreCase"
      values   = ["&{aws:username}"]
      variable = "sts:RolesSessionName"
    }

    resources = [
      "${aws_iam_role.devops_roles.arn}",
    ]
  }

  statement {
    effect    = "Deny"
    actions   = ["*"]
    resources = ["*"]

    condition {
      test     = "NotIpAddress"
      values   = "${var.cidr_restrictions}"
      variable = "aws:SourceIp"
    }

    condition {
      test = "Bool"
      values = ["false"]
      variable = "aws:ViaAWSService"
    }
  }
}

resource "aws_iam_policy" "devops_role_assumable_policy" {
  name   = "${local.prefix}-devops-assumable-role"
  path   = "${local.policy_path}"
  policy = "${data.aws_iam_policy_document.devops_role_assumable_document.json}"
}
