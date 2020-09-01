resource "aws_iam_group" "ops_group" {
  name = "${local.prefix}-ops"
}

resource "aws_iam_group_policy_attachment" "attach_ops_assumable_policy" {
  group      = "${aws_iam_group.ops_group.name}"
  policy_arn = "${aws_iam_policy.devops_role_assumable_policy.arn}"
}
