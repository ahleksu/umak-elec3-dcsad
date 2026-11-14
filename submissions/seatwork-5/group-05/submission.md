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

When CloudFormation attempts to deploy the stack, the deployment will fail and initiate an automatic rollback. This happens because both the DynamoDB table (`umak-elec3-dcsad-g05-messages`) and the S3 bucket (`umak-elec3-dcsad-g05-linktree`) already exist in AWS from our previous manual setup in Lab 4 and Seatwork 3. CloudFormation attempts to create new resources using these specified physical names. Because S3 bucket names are globally unique across all AWS accounts and DynamoDB table names must be unique within an account and Region, AWS returns a resource conflict error (such as `AlreadyExistsException` or `BucketAlreadyOwnedByYou`). To manage existing resources under CloudFormation without recreating them, CloudFormation requires performing a resource import rather than a standard deploy.

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architected pillar does it serve?

Defining infrastructure changes in a template and reviewing them through a Pull Request is significantly safer than making changes in the console for several key reasons:
- **Peer review and error detection**: Teammates can inspect the exact configuration changes, catching syntax errors, security oversights (such as unintentionally exposing resources), and typos before anything touches cloud infrastructure. In contrast, manual clicks in the console have no preview or approval mechanism and are prone to human error.
- **Auditability and version control**: Every change is tracked in Git with commit messages, creating an immutable history of who changed what, when, and why. If a change introduces an issue, Git makes it straightforward to inspect the diff and quickly roll back to a previous known-good commit.
- **Repeatability and consistency**: Templates eliminate configuration drift and guarantee that environments can be reproduced identically in any Region without relying on manual steps or memory.

This practice directly serves the **Operational Excellence** pillar of the AWS Well-Architected Framework, specifically embodying the core design principle to **"Perform operations as code."**

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| JoeyRVisayaJr | Wrote the CloudFormation template (`template.yaml`) defining the DynamoDB table and S3 website bucket with public access and policy |
| TrishchanJimenez | Wrote the Terraform configuration (`main.tf`) with equivalent provider, resources, dependencies, and tags |
| jjcabalo | Researched and answered Question 1 regarding stack deployment conflicts with pre-existing resources |
| scaoile | Researched and answered Question 2 regarding Pull Request safety and the Operational Excellence pillar |
