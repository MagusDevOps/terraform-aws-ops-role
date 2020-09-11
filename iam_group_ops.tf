resource "aws_iam_group" "group" {
  name = "${local.prefix}-ops"
}

resource "aws_iam_group_policy_attachment" "attach_assumable_policy" {
  group      = "${aws_iam_group.group.name}"
  policy_arn = "${aws_iam_policy.role_assumable_policy.arn}"
}

resource "aws_iam_group_policy_attachment" "attach_rds_connect_policy" {
  group      = "${aws_iam_group.group.name}"
  policy_arn = "${aws_iam_policy.rds_connect_policy.arn}"
}
