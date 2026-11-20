# Seatwork 5 Submission

## About us

- Group number: 05
- Section: IV-DCSAD
- Group IAM user: dcsad-g05
- Table name: umak-elec3-dcsad-g05-messages
- Bucket name: umak-elec3-dcsad-g05-linktree

## Files

- [`template.yaml`](template.yaml): our CloudFormation template
- [`main.tf`](main.tf): our Terraform file

## Questions

1. Suppose that our group user could create stacks, and we ran `aws cloudformation deploy` with our template today. What happens, and why?

If our group user would create stacks and  ran `aws cloudformation deploy` today, it would fail and CloudFormation would just roll the stack back. The DynamoDB table `umak-elec3-dcsad-g05-messages` and the S3 bucket `umak-elec3-dcsad-g05-linktree` already exist because we set them up manually in Lab 4 and Seatwork 3. Our template tells CloudFormation to create both with those exact names, but AWS doesn’t allow duplicates. S3 bucket names have to be unique across all AWS accounts, and DynamoDB table names have to be unique within an account and Region. So CloudFormation hits an `AlreadyExistsException` on the table, the bucket fails the same way, and the whole stack rolls back. To manage the resources we already have, we would need a resource import instead of a normal deploy.

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architected pillar does it serve?

A change written in a template and reviewed in a Pull Request is safer than applying the same change in the console because other people see it before it touches anything in AWS. A teammate can catch a typo or a risky setting, like a bucket accidentally made public, while it’s still just a diff. The console has no preview and no approval step, so one wrong click goes straight to live infrastructure.

Git also keeps a record of every change, like who made it, when, and the commit message explaining why. If something breaks, we can just read the diff and roll back to the last working commit. And since the template is the source of truth, we can rebuild the same setup in any Region without relying on memory or manual steps, so there’s no configuration drift.

This serves the Operational Excellence pillar, specifically the design principle of “perform operations as code.”

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| JoeyRVisayaJr | Wrote the CloudFormation template (`template.yaml`) defining the DynamoDB table and S3 website bucket with public access and policy |
| TrishchanJimenez | Wrote the Terraform configuration (`main.tf`) with equivalent provider, resources, dependencies, and tags |
| jjcabalo | Researched and answered Question 1 regarding stack deployment conflicts with pre-existing resources |
| scaoile | Researched and answered Question 2 regarding Pull Request safety and the Operational Excellence pillar |
