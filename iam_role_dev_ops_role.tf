data "aws_iam_policy_document" "role_document" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      identifiers = ["arn:aws:iam::${var.account_id}:root"]
      type        = "AWS"
    }
  }
}

resource "aws_iam_role" "role" {
  name               = "${local.prefix}-devops-role"
  assume_role_policy = "${data.aws_iam_policy_document.role_document.json}"
  tags               = "${local.tags}"
}

resource "aws_iam_role_policy_attachment" "attach_aws_admin_access_to_role" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = "${aws_iam_role.role.name}"
}
