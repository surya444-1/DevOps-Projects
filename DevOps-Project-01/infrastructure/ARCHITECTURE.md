Architecture diagram and rendering instructions for the two-VPC setup

Overview
- Bastion VPC
  - CIDR: 192.168.0.0/16
  - 2 public subnets (bastion hosts)
  - Internet Gateway (IGW)

- App VPC
  - CIDR: 172.32.0.0/16
  - 2 public subnets
  - 6 private subnets (2 app, 2 web, 2 db)
  - Internet Gateway (IGW)
  - Single NAT Gateway (used by all private subnets)

Files
- `architecture.puml` — PlantUML source for the diagram
- `ARCHITECTURE.md` — this file with a short ASCII preview and render instructions

ASCII preview

  [User] 
     |
  [Internet]
     |
  +---------------------+        +---------------------------+
  | Bastion VPC         |        | App VPC                   |
  | 192.168.0.0/16      |        | 172.32.0.0/16             |
  |  - public-1 (pub)   |        |  - public-1 (pub)         |
  |  - public-2 (pub)   |        |  - public-2 (pub)         |
  |  - IGW              |        |  - IGW                    |
  +---------------------+        |  - public-1 (nat-host)    |
                                 |  - private app (x2)       |
                                 |  - private web (x2)       |
                                 |  - private db  (x2)       |
                                 |  - NAT Gateway            |
                                 +---------------------------+

Render locally
- With Java + PlantUML installed:
  plantuml architecture.puml
- Using VS Code: install "PlantUML" extension, open `architecture.puml` and use preview.

Adjusting the diagram
- The diagram is intentionally simple. If you want AZ boxes drawn or component icons (RDS, EC2 ASG, etc.) I can extend the PlantUML source.
