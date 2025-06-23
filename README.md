# Blockchain-Based Education Competency Assessment System

A comprehensive blockchain-based system for managing educational competency assessments, skill evaluations, and development planning using Clarity smart contracts.

## Overview

This system provides a decentralized platform for:
- Managing assessment managers and their verification
- Evaluating learner skills and competencies
- Mapping competency requirements for different roles
- Analyzing competency gaps
- Planning competency development

## Smart Contracts

### 1. Assessment Manager Contract (`assessment-manager.clar`)
Manages the verification and permissions of assessment managers.

**Key Features:**
- Register new assessment managers
- Verify manager credentials
- Set manager permissions
- Track manager information

### 2. Skill Evaluation Contract (`skill-evaluation.clar`)
Handles skill evaluations and scoring for learners.

**Key Features:**
- Evaluate learner skills with scores
- Validate evaluations
- Track learner skill portfolios
- Calculate skill percentages

### 3. Competency Mapping Contract (`competency-mapping.clar`)
Maps competency requirements for different roles and frameworks.

**Key Features:**
- Create competency frameworks
- Define skill requirements
- Set minimum scores and weights
- Manage skill definitions

### 4. Gap Analysis Contract (`gap-analysis.clar`)
Analyzes competency gaps and provides recommendations.

**Key Features:**
- Perform gap analysis
- Calculate overall competency levels
- Generate recommendations
- Track analysis history

### 5. Development Planning Contract (`development-planning.clar`)
Plans and tracks competency development for learners.

**Key Features:**
- Create development plans
- Add learning activities
- Track progress
- Manage plan status

## Data Structures

### Assessment Managers
- Name, institution, credentials
- Verification status
- Permissions list

### Skill Evaluations
- Learner and skill identification
- Scores and evaluation details
- Validation status

### Competency Requirements
- Framework and role mapping
- Required skills and minimum scores
- Weight factors for scoring

### Gap Analysis
- Identified gaps and priorities
- Recommendations and resources
- Timeline estimates

### Development Plans
- Learning objectives and activities
- Progress tracking
- Completion status

## Usage Examples

### Registering an Assessment Manager
\`\`\`clarity
(contract-call? .assessment-manager register-manager
'SP1234...
"Dr. Smith"
"University ABC"
"PhD in Education, 10 years experience")
\`\`\`

### Evaluating a Skill
\`\`\`clarity
(contract-call? .skill-evaluation evaluate-skill
'SP5678...
"programming"
u85
u100
"Strong performance in coding assessment")
\`\`\`

### Creating a Development Plan
\`\`\`clarity
(contract-call? .development-planning create-development-plan
'SP5678...
"plan-001"
"Web Development Skills"
"Comprehensive web development competency plan"
(list "html" "css" "javascript" "react")
u180)
\`\`\`

## Security Features

- Contract owner restrictions for sensitive operations
- Verification requirements for assessment managers
- Validation mechanisms for evaluations
- Permission-based access control

## Getting Started

1. Deploy the contracts to a Stacks blockchain
2. Register assessment managers
3. Create competency frameworks
4. Begin skill evaluations
5. Perform gap analysis
6. Create development plans

## Testing

The system includes comprehensive tests using Vitest. Run tests with:

\`\`\`bash
npm test
\`\`\`

## Contributing

Please read the contributing guidelines before submitting pull requests.

## License

This project is licensed under the MIT License.
\`\`\`

Now the PR details file:
