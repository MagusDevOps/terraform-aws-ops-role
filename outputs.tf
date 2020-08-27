output "grant_assumable_policy_arn" {
  value = "${aws_iam_policy.devops_role_assumable_policy.arn}"
}

output "assumable_role_name" {
  value = "${aws_iam_role.devops_roles.name}"
}

output "assumable_role_arn" {
  value = "${aws_iam_role.devops_roles.arn}"
}
