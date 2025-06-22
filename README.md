# Blockchain-Based Project Portfolio Resource Management

A comprehensive decentralized system for managing project portfolio resources using Clarity smart contracts on the Stacks blockchain.

## Overview

This system provides a complete solution for resource management across project portfolios, featuring:

- **Resource Manager Verification**: Validates and manages portfolio resource managers
- **Capacity Planning**: Plans and optimizes portfolio resource capacity
- **Allocation Optimization**: Optimizes resource allocation across projects
- **Utilization Tracking**: Tracks and monitors resource utilization
- **Conflict Resolution**: Resolves resource allocation conflicts automatically and manually

## Architecture

### Smart Contracts

1. **resource-manager-verification.clar**
    - Verifies resource managers
    - Tracks manager reputation and performance
    - Manages manager skills and capacity limits

2. **capacity-planning.clar**
    - Creates and manages capacity plans
    - Handles capacity allocation and release
    - Calculates utilization rates

3. **allocation-optimization.clar**
    - Optimizes resource allocation
    - Runs optimization algorithms
    - Tracks efficiency scores

4. **utilization-tracking.clar**
    - Monitors resource utilization
    - Generates utilization reports
    - Calculates efficiency metrics

5. **conflict-resolution.clar**
    - Reports and manages conflicts
    - Auto-resolves conflicts by priority
    - Tracks resolution outcomes

## Features

### Resource Manager Verification
- Verify managers with skills and experience levels
- Track reputation scores based on project outcomes
- Manage maximum project capacity per manager

### Capacity Planning
- Create detailed capacity plans for projects
- Allocate and release capacity dynamically
- Monitor capacity utilization in real-time

### Allocation Optimization
- Optimize resource allocation across multiple projects
- Priority-based allocation algorithms
- Efficiency scoring and tracking

### Utilization Tracking
- Real-time utilization monitoring
- Comprehensive utilization reports
- Performance efficiency calculations

### Conflict Resolution
- Automated conflict detection and reporting
- Priority-based auto-resolution
- Manual resolution with reasoning tracking

## Getting Started

### Prerequisites
- Stacks blockchain node
- Clarity CLI tools
- Node.js and npm for testing

### Installation

1. Clone the repository:
   \`\`\`bash
   git clone <repository-url>
   cd blockchain-resource-management
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

3. Deploy contracts:
   \`\`\`bash
   clarinet deploy
   \`\`\`

### Testing

Run the test suite:
\`\`\`bash
npm test
\`\`\`

Run specific test files:
\`\`\`bash
npm test resource-manager-verification.test.ts
npm test capacity-planning.test.ts
npm test allocation-optimization.test.ts
npm test utilization-tracking.test.ts
npm test conflict-resolution.test.ts
\`\`\`

## Usage Examples

### Verifying a Resource Manager

\`\`\`clarity
(contract-call? .resource-manager-verification verify-manager
'ST1SJ3DTE5DN7X54YDH5D64R3BCB6A2AG2ZQ8YPD5
(list "JavaScript" "Project Management" "Team Leadership")
u5
u3)
\`\`\`

### Creating a Capacity Plan

\`\`\`clarity
(contract-call? .capacity-planning create-capacity-plan
u1  ;; project-id
'ST1SJ3DTE5DN7X54YDH5D64R3BCB6A2AG2ZQ8YPD5  ;; manager
u100  ;; total-capacity
(list "Developer" "Designer" "QA")  ;; resource-types
u1000)  ;; valid-duration
\`\`\`

### Reporting a Conflict

\`\`\`clarity
(contract-call? .conflict-resolution report-conflict
u1  ;; project-a
u2  ;; project-b
"Developer"  ;; resource-type
u50  ;; conflicted-amount
u8  ;; priority-a
u6)  ;; priority-b
\`\`\`

## API Reference

### Resource Manager Verification

- \`verify-manager\`: Verify a new resource manager
- \`update-reputation\`: Update manager reputation based on project outcomes
- \`is-verified-manager\`: Check if a manager is verified
- \`get-manager-info\`: Get manager information
- \`get-manager-reputation\`: Get manager reputation data

### Capacity Planning

- \`create-capacity-plan\`: Create a new capacity plan
- \`allocate-capacity\`: Allocate capacity from a plan
- \`release-capacity\`: Release allocated capacity
- \`get-capacity-plan\`: Get capacity plan details
- \`calculate-utilization-rate\`: Calculate utilization rate

### Allocation Optimization

- \`create-allocation\`: Create a new resource allocation
- \`optimize-allocation\`: Optimize an existing allocation
- \`run-optimization-algorithm\`: Run optimization across multiple projects
- \`get-allocation\`: Get allocation details
- \`calculate-allocation-efficiency\`: Calculate allocation efficiency

### Utilization Tracking

- \`start-utilization-tracking\`: Start tracking resource utilization
- \`update-utilization\`: Update utilization data
- \`generate-utilization-summary\`: Generate project utilization summary
- \`get-utilization-record\`: Get utilization record
- \`calculate-efficiency-score\`: Calculate efficiency score

### Conflict Resolution

- \`report-conflict\`: Report a resource conflict
- \`resolve-conflict\`: Manually resolve a conflict
- \`auto-resolve-by-priority\`: Auto-resolve conflict by priority
- \`get-conflict\`: Get conflict details
- \`calculate-resolution-score\`: Calculate resolution effectiveness score

## Error Codes

### Resource Manager Verification (100-199)
- \`ERR_UNAUTHORIZED (100)\`: Unauthorized access
- \`ERR_ALREADY_VERIFIED (101)\`: Manager already verified
- \`ERR_NOT_FOUND (102)\`: Manager not found
- \`ERR_INVALID_MANAGER (103)\`: Invalid manager data

### Capacity Planning (200-299)
- \`ERR_UNAUTHORIZED (200)\`: Unauthorized access
- \`ERR_INVALID_CAPACITY (201)\`: Invalid capacity data
- \`ERR_PLAN_NOT_FOUND (202)\`: Capacity plan not found
- \`ERR_INSUFFICIENT_CAPACITY (203)\`: Insufficient capacity

### Allocation Optimization (300-399)
- \`ERR_UNAUTHORIZED (300)\`: Unauthorized access
- \`ERR_INVALID_ALLOCATION (301)\`: Invalid allocation data
- \`ERR_ALLOCATION_NOT_FOUND (302)\`: Allocation not found
- \`ERR_OPTIMIZATION_FAILED (303)\`: Optimization failed

### Utilization Tracking (400-499)
- \`ERR_UNAUTHORIZED (400)\`: Unauthorized access
- \`ERR_INVALID_UTILIZATION (401)\`: Invalid utilization data
- \`ERR_TRACKING_NOT_FOUND (402)\`: Tracking record not found

### Conflict Resolution (500-599)
- \`ERR_UNAUTHORIZED (500)\`: Unauthorized access
- \`ERR_INVALID_CONFLICT (501)\`: Invalid conflict data
- \`ERR_CONFLICT_NOT_FOUND (502)\`: Conflict not found
- \`ERR_ALREADY_RESOLVED (503)\`: Conflict already resolved

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Run the test suite
6. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Security Considerations

- All contracts include proper authorization checks
- Input validation is performed on all public functions
- State changes are atomic and consistent
- Error handling prevents invalid state transitions

## Roadmap

- [ ] Advanced optimization algorithms
- [ ] Integration with external resource management systems
- [ ] Real-time notifications for conflicts
- [ ] Advanced analytics and reporting
- [ ] Mobile application interface
- [ ] Multi-chain deployment support

## Support

For questions and support, please open an issue in the GitHub repository or contact the development team.
\`\`\`

Finally, let's create the PR details file:
