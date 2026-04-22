# GIFTS Forensic Report (Conditional Inpainting Diffusion)

- **Attack type**: `resource_hijack` | label=1

- **Blackout interval**: `(1, 3)`

- **Hypotheses generated**: `7`


---
## Observed Actions

- [00] sts:AssumeRole
- [01] <BLACKOUT>
- [02] <BLACKOUT>
- [03] ec2:CreateTags
- [04] cloudwatch:PutMetricData
- [05] <PAD>
- [06] <PAD>
- [07] <PAD>
- [08] <PAD>
- [09] <PAD>


## Ground Truth Full Actions

- [00] sts:AssumeRole
- [01] ec2:DescribeInstances
- [02] ec2:RunInstances
- [03] ec2:CreateTags
- [04] cloudwatch:PutMetricData
- [05] <PAD>
- [06] <PAD>
- [07] <PAD>
- [08] <PAD>
- [09] <PAD>


---
## Reconstructed Actions (Multi-Hypothesis Inpainting)

### Most plausible reconstruction

- [00] cloudwatch:PutMetricData
- [01] ec2:RunInstances
- [02] s3:GetObject
- [03] athena:StartQueryExecution
- [04] iam:GetPolicy
- [05] s3:GetObject
- [06] cloudwatch:PutMetricData
- [07] cloudtrail:LookupEvents
- [08] iam:GetRole
- [09] athena:GetQueryResults


### Most suspicious reconstruction

- [00] cloudwatch:PutMetricData
- [01] ec2:RunInstances
- [02] s3:GetObject
- [03] athena:StartQueryExecution
- [04] iam:GetPolicy
- [05] s3:GetObject
- [06] cloudwatch:PutMetricData
- [07] cloudtrail:LookupEvents
- [08] ec2:RunInstances
- [09] athena:GetQueryResults


### Consensus reconstruction (recommended)

- [00] cloudwatch:PutMetricData
- [01] ec2:RunInstances
- [02] s3:GetObject
- [03] athena:StartQueryExecution
- [04] iam:GetPolicy
- [05] s3:GetObject
- [06] cloudwatch:PutMetricData
- [07] cloudtrail:LookupEvents
- [08] ec2:RunInstances
- [09] athena:GetQueryResults


---
## Blackout Segment Reconstruction

Missing indices: `[1, 2]`


### Ground Truth Missing

- [01] ec2:DescribeInstances
- [02] ec2:RunInstances

### Consensus Missing (Recommended)

- [01] ec2:RunInstances
- [02] s3:GetObject

### Consensus + Uncertainty per Missing Slot

- [01] consensus=ec2:RunInstances | uncertainty=0.61 | ec2:RunInstances (vote=0.79), iam:ListUsers (vote=0.47), cloudwatch:PutMetricData (vote=0.39), <PAD> (vote=0.16), athena:StartQueryExecution (vote=0.08)
- [02] consensus=s3:GetObject | uncertainty=0.56 | s3:GetObject (vote=1.11), iam:GetPolicy (vote=0.73), athena:GetQueryResults (vote=0.67)


---
## All hypotheses (missing-slot predictions)

- Hypothesis 01: plaus=0.14 | susp=1.00 | missing=['ec2:RunInstances', 's3:GetObject']
- Hypothesis 02: plaus=0.13 | susp=1.00 | missing=['ec2:RunInstances', 's3:GetObject']
- Hypothesis 03: plaus=0.14 | susp=0.00 | missing=['iam:ListUsers', 's3:GetObject']
- Hypothesis 04: plaus=0.14 | susp=1.00 | missing=['ec2:RunInstances', 's3:GetObject']
- Hypothesis 05: plaus=0.16 | susp=1.00 | missing=['ec2:RunInstances', 's3:GetObject']
- Hypothesis 06: plaus=0.14 | susp=1.00 | missing=['ec2:RunInstances', 's3:GetObject']
- Hypothesis 07: plaus=0.16 | susp=1.00 | missing=['ec2:RunInstances', 's3:GetObject']
