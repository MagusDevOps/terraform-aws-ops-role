data "aws_iam_policy_document" "devops_role_document" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      identifiers = ["arn:aws:iam::${var.account_id}:root"]
      type        = "AWS"
    }
  }
}

resource "aws_iam_role" "devops_role" {
  name               = "${local.prefix}-devops-role"
  assume_role_policy = "${data.aws_iam_policy_document.devops_role_document.json}"
  tags               = "${local.tags}"
}

resource "aws_iam_role_policy_attachment" "attach_aws_admin_access_to_devops_role" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = "${aws_iam_role.devops_role.name}"
}
