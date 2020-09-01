output "grant_assumable_policy_arn" {
  value = "${aws_iam_policy.devops_role_assumable_policy.arn}"
}

output "assumable_role_name" {
  value = "${aws_iam_role.devops_role.name}"
}

output "assumable_role_arn" {
  value = "${aws_iam_role.devops_role.arn}"
}

output "group_name" {
  value = "${aws_iam_group.ops_group.name}"
}
