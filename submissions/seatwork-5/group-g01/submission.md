# Seatwork 5 Submission

## About us

* Group number: 01
* Section: IV-DCSAD
* Group IAM user: dcsad-g01
* Table name: umak-elec3-dcsad-g01-messages
* Bucket name: umak-elec3-dcsad-g01-linktree

## Files

* [template.yaml](template.yaml) : our CloudFormation template
* [main.tf](main.tf) : our Terraform file

## Questions

1. Suppose that our group user could create stacks, and we ran `aws cloudformation deploy` with our template today. What happens, and why?

The stack creation fails and rolls back with a resource-already-exists error because `umak-elec3-dcsad-g01-messages` and `umak-elec3-dcsad-g01-linktree` already exist in AWS with those exact explicit physical names, and CloudFormation will not adopt or overwrite pre-existing resources that it did not originally create.

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architectured pillar does it serve?

A template change reviewed in a Pull Request creates a version-controlled audit trail and lets teammates catch misconfigurations (such as overly permissive bucket policies or wrong resource names) before deployment, whereas manual console edits are immediate, unreviewed, and error-prone. This serves the **Operational Excellence** pillar of the AWS Well-Architected Framework.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| RoadriguezGlenn | Authored `template.yaml` and `main.tf`, answered the Seatwork 5 questions, and opened the Pull Request. |
| <jhone-github-username> | Verified DynamoDB table and S3 bucket resource definitions and tag attributes. |
| <jean-lee-github-username> | Reviewed `submission.md` formatting, YAML/HCL syntax, and checked that no account numbers or secrets were included. |
