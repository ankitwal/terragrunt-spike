## Terragrunt Spike  
Experiment and validation of terragrunt by grunt works  

### Use Cases   
List of use cases tried and their results
```
├── README.md
├── terraform
│   └── lf258
│       ├── init.tf
│       ├── lf258.tfvars
│       ├── main.tf
│       ├── ...
└── terragrunt
    ├── dev
    │   └── terragrunt.hcl
    └── terragrunt.hcl
```

#### Remote State configuration  
Configure and create s3 backend with terragrunt. 
- Is useful to create bucket, however how the life cycle of the bucket is maintained is unclear.
- Default configuration failed, and errored on first terraform apply, as bucker could not 
fetch its encryption key : aws/s3  

```shell script
KMS.NotFoundException) Invalid keyId aws/s3
```

#### Supply tfvars  

- Is fairly useful,
- Can prevent missopperation of supply incorrect tf var file
- However its more config over convention. Might be more 
transparent and easier to understand for a team to have string conventions about environment
specific conventions rather than hidden clever configuration?
- No IDE support for writting terragrunt hcl
- Directory structure magic hard to understand
- What does it mean for pipeline orchestration 

