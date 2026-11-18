# Assignment 3 Submission

## About us

- **Group number:** Group 1
- **Section:** IV-DCSAD
- **Lab 3 client:** School Canteen Ordering Application

## Three estimates

Asia Pacific (Singapore), MySQL, OnDemand, 100% utilization, RDS Proxy No, Database Insights No.

| **Option**           | **Instance** | **Deployment** | **Nodes** | **Storage**            | **Total monthly cost (USD)** |
| -------------------- | ------------ | -------------- | --------: | ---------------------- | ---------------------------: |
| A. Small and cheap   | db.t4g.micro | Single-AZ      |         1 | 20 GB gp3              |                       $21.01 |
| B. High availability | db.t4g.micro | Multi-AZ       |         1 | 20 GB gp3              |                       $42.75 |
| C. Read scaling      | db.t4g.micro | Single-AZ      |         2 | 20 GB gp3 per instance |                       $42.02 |

**Combined monthly cost:** $105.78

**12-month cost:** $1,269.36

**Share link of our estimate:**

[https://calculator.aws/#/estimate?utm_source=chatgpt.com&id=849016304586727f5bbdff5b0a528028a73f2275](https://calculator.aws/#/estimate?utm_source=chatgpt.com\&id=849016304586727f5bbdff5b0a528028a73f2275)

## Recommendation

Option B, High Availability, is the best choice for our school canteen ordering application because it provides better availability through a Multi-AZ deployment. The application serves students, canteen staff, and administrators who rely on the system to place, manage, and monitor food orders. Downtime during school breaks and lunch periods could disrupt transactions, delay orders, and inconvenience both students and canteen staff. Although Option C provides a second database node for read scaling, our application's expected read workload does not necessarily justify prioritizing read capacity over availability. Therefore, Option B is the most suitable choice because it provides a standby database for failover and helps minimize service interruptions.

## Question

**Why is a Multi-AZ standby not the same as a read replica?**

A Multi-AZ standby is designed for high availability and disaster recovery, while a read replica is designed to improve read performance and distribute database queries. The Multi-AZ standby normally does not serve read traffic because it is reserved for automatic failover if the primary database becomes unavailable. In contrast, a read replica can serve read-only queries, reducing the workload on the primary database. Therefore, Multi-AZ improves availability, while read replicas improve read scalability.

## Contribution

| **GitHub username** | **What this groupmate did**                   |
| ------------------- | --------------------------------------------- |
| Martinez            | AWS RDS configuration and pricing estimates   |
| Ogang               | Research and comparison of deployment options |
| Martinez            | Recommendation and documentation              |
