# Contributing to KMM-Template

Thank you for your interest in contributing to **KMM-Template**! We welcome contributions that help improve the project, fix issues, or add new features.

## How to Contribute

### 1. Reporting Issues
If you encounter any bugs or have suggestions for new features, please open an issue on our [GitHub Issues](https://github.com/daresaydigital/KMM-Template/issues) page. Be sure to include as much detail as possible to help us understand and resolve the issue.

### 2. Fork the Repository
To work on the code, first fork the repository on GitHub. Then, clone your fork to your local machine.
```bash
git clone https://github.com/your-username/KMM-Template.git
```
### 3. Create a Branch
Please select the branch to which you want to add dependency configurations or update existing configurations. We have branches that are based on the default configuration of the KMM project, such as `detekt` and `detekt_swift_ui`. Name your branches by adding a suffix that reflects the main idea of your changes. For example: `detekt_add_configuration` or `detekt_swift_ui_add_configuration`
```bash
git checkout <branch> #or <branch>_swift_ui
git checkout -b <branch>_<reason_of_changes>
```
### 4. Make Changes
Make your changes, and ensure your code follows the project's coding style and standards. For any significant changes, please discuss them with the maintainers before starting.

### 5. Test Your Changes
Ensure that your code passes all tests and linting checks. If applicable, add new tests to cover your changes.

### 6. Commit and Push
Commit your changes to your branch and push them to your forked repository.
```bash
git add .
git commit -m "Description of your changes"
git push origin <branch>_<reason_of_changes>
```
### 7. Open a Pull Request
Once your changes are ready, open a pull request (PR) to the KMM-Template repository. Include a brief description of your changes and any relevant issue numbers. A project maintainer will review your PR, provide feedback if needed, and merge it once approved.

### 8. Repeat for other configuration
Please remember that we have two basic configurations for the KMM project: one with only Compose and another with Compose and SwiftUI. If you make changes to the dependency configurations for one of these versions, please ensure that you make the same changes for the other version to keep the code consistent and identical across both implementations. Submit these changes as a separate pull request, following the previous steps.

## Code of Conduct
By contributing, you agree to follow our [Code of Conduct](https://github.com/daresaydigital/KMM-Template/blob/master/.github/CODE_OF_CONDUCT.md) to ensure a welcoming and respectful environment for everyone.

## Contact
If you have any questions, please feel free to reach out via the GitHub Issues or contact the maintainer at yauheni.slizh@knightec.se.

We look forward to your contributions!
