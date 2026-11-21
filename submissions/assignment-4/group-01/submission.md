# Assignment 4 Submission

## About us

- Group number: 1
- Section: IV-DCSAD

## Estimate 1: the Lab 4 endpoint

Asia Pacific (Singapore), 1 million requests a month: 800,000 GET and 200,000 POST.

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon API Gateway | HTTP API, 1 million requests, 1 KB each | 1.25 |
| AWS Lambda | Without Free Tier, x86, 1,000,000 requests, 100 ms, 128 MB | 0.41 |
| Amazon DynamoDB | On-demand, Standard, 1 GB, 1 KB items, 0.2 million writes, 0.8 million eventually consistent reads | 0.48 |
| **Total** | | **2.14** |

## Estimate 2: the Lab 2 setup

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon EC2 | 1 `t3.micro`, Linux, On-Demand, 100% utilization, 8 GB gp3, detailed monitoring on | 12.51 |

Share link of our estimate: https://calculator.aws/#/estimate?id=4a729bb75c48eac30b17492cf5383a56b5511827

## Question

In a month with no requests at all, which costs remain in each setup, and why?

In the Lab 4 serverless setup, only the Amazon DynamoDB data storage cost for the 1 GB table remains (about 0.28 USD in Singapore), while Amazon API Gateway, AWS Lambda, and DynamoDB read/write request charges drop to 0.00 USD because those services are billed purely per request and compute duration. In the Lab 2 EC2 setup, the entire 12.51 USD monthly cost remains because an On-Demand `t3.micro` instance, its attached 8 GB gp3 EBS volume, and detailed CloudWatch monitoring are billed continuously by the hour and month regardless of whether any visitors send traffic.

## Recommendation

The Lab 4 serverless setup fits our message API best at 1 million requests a month because it costs only 2.14 USD per month compared to 12.51 USD per month for the Lab 2 EC2 setup, saving our group 10.37 USD every month. During quiet periods or months with zero traffic, the serverless stack drops to just the tiny DynamoDB storage fee for 1 GB of data, whereas the EC2 instance still charges the full 12.51 USD just to stay running. Even better, API Gateway, Lambda, and on-demand DynamoDB scale automatically to absorb sudden traffic spikes without forcing us to configure Auto Scaling groups or manage capacity limits. The serverless architecture also eliminates server maintenance overhead for our group because AWS manages the underlying operating system, runtime security patches, and high availability across Availability Zones. By contrast, choosing the EC2 setup would require us to pay nearly six times more while still manually patching Linux, monitoring disk space, and maintaining the web server process ourselves.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| @RoadriguezGlenn | Built both cost estimates in the AWS Pricing Calculator, generated the public share link, answered the idle-cost and recommendation questions, and wrote `submission.md` |
```[cite: 16, 17, 18]

### Final Submission Checklist
* **Branch & Path:** Create branch **`assignment-4-group-01`** off `main` and save this file at **`submissions/assignment-4/group-01/submission.md`**[cite: 16, 17].
* **Verify Share Link:** Open `[https://calculator.aws/#/estimate?id=4a729bb75c48eac30b17492cf5383a56b5511827](https://calculator.aws/#/estimate?id=4a729bb75c48eac30b17492cf5383a56b5511827)` in an incognito/private browser window to confirm all four services appear[cite: 17].
* **Submit PR:** Open one Pull Request on GitHub (do **not** merge it) and paste the PR link into `[https://forms.gle/rJ65gHyxdz6UCzC99](https://forms.gle/rJ65gHyxdz6UCzC99)`[cite: 17].
