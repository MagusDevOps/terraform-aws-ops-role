data "aws_iam_policy_document" "rds_connect_document" {
  statement {
    effect  = "Allow"
    actions = ["rds-db:connect"]

    resources = [
      "arn:aws:rds-db:*:${var.account_id}:dbuser:${local.prefix}*/ops_&{aws:username}",
    ]
  }

  statement {
    effect = "Deny"

    actions = [
      "rds-db:connect",
    ]

    resources = ["*"]

    condition {
      test     = "NotIpAddressIfExists"
      values   = "${var.cidr_restrictions}"
      variable = "aws:SourceIp"
    }
  }
}

resource "aws_iam_policy" "rds_connect_policy" {
  name   = "${local.prefix}-ops-rds-connect-policy"
  path   = "${local.policy_path}"
  policy = "${data.aws_iam_policy_document.rds_connect_document.json}"
}
