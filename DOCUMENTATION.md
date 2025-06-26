# Static Website Deployment on AWS - Project Documentation

## Project Overview
This project demonstrates deploying a static website on AWS using a three-tier architecture with high availability across multiple Availability Zones.

## Architecture
![VPC Reference Architecture](docs/VPC_Reference_Architecture.jpg)

## Infrastructure Components

### VPC Setup
- Created a VPC with an Internet Gateway
- Established 6 subnets across 2 Availability Zones:
  - 2 public subnets (1a, 1b)
  - 2 private subnets for web application (2a, 2b)
  - 2 private subnets for database (3a, 3b)

### Routing Configuration
- Public Route Table: Associated with public subnets, routes to Internet Gateway
- Private Route Table 1: Associated with private subnets 2a and 3a
- Private Route Table 2: Associated with private subnets 2b and 3b

### Security Groups
1. **ALB Security Group**
   - Inbound: HTTP (80), HTTPS (443) from anywhere
   - Outbound: All traffic

2. **SSH Security Group**
   - Inbound: SSH (22) from specific IPs
   - Outbound: All traffic

3. **Web App Security Group**
   - Inbound: HTTP (80), HTTPS (443) from ALB Security Group
   - Inbound: SSH (22) from SSH Security Group
   - Outbound: All traffic

### EC2 Instances
- Launched t2.micro instances (Amazon Linux 2)
- Placed in private subnets (2a, 2b)
- Attached appropriate security groups
- Configured with user data script for automatic website deployment

### Load Balancing
- Created Target Group pointing to EC2 instances
- Configured Application Load Balancer (ALB) in public subnets
- Set up health checks and routing rules

## Deployment Process
1. Website files were customized and pushed to GitHub
2. EC2 instances pull website files from GitHub during initialization
3. Apache web server serves the website content
4. ALB distributes traffic between instances for high availability

## Website Customization
The website was customized from a template with:
- Personalized content and branding
- Custom color scheme
- Responsive design elements
- Updated service offerings and contact information

## GitHub Workflow
The website code is maintained in a GitHub repository with proper version control:
- [Repository Link](https://github.com/OrsarRasro/emmanuel-portfolio)
- Deployment script included for automated setup

## Conclusion
This project demonstrates cloud architecture design, high availability implementation, and automated deployment of web applications on AWS infrastructure.
