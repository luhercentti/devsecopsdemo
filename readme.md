Example of a DEVSECOPS with open source tools

- Tools used:

| Tool                   | Purpose in the Pipeline                               | Type of Analysis | Language/Scope                    |
| ---------------------- | ----------------------------------------------------- | ---------------- | --------------------------------- |
| **Bandit**             | Scan Python code for known insecure patterns          | SAST             | Python-only                       |
| **Gitleaks**           | Detect secrets in code (e.g., API keys, passwords)    | Secrets scanning | Language-agnostic                 |
| **Semgrep**            | Scan code for security and quality issues             | SAST             | Multi-language (Python, JS, etc.) |
| **Safety**             | Check Python dependencies for known vulnerabilities   | Dependency scan  | Python requirements               |
| **Trivy**              | Scan Docker images for vulnerabilities                | Container scan   | OS & language packages            |
| **pytest + coverage**  | Run tests and generate code coverage                  | Testing          | Python                            |
| **ZAP**                | Simulate attacks on the running app (e.g., XSS, SQLi) | DAST             | Runtime endpoints                 |
| **tfsec**              | Analyze Terraform IaC for security misconfigs         | IaC static scan  | Terraform                         |
| **Checkov**            | Deep scan of Terraform with more complex rules        | IaC static scan  | Terraform                         |
| **SonarQube**          | Code quality + security + test coverage               | SAST + Quality   | Multi-language                    |
| **combined-report.md** | Consolidated summary of all tools                     | Reporting        | Human-readable report             |

Some tools overlap in this example, therefore we can just simplify to use only these:

| Categoría        | Opción recomendada                |
| ---------------- | --------------------------------- |
| SAST             | Only **Semgrep** or **SonarQube** |
| Secrets scanning | Keep **Gitleaks**                 |
| Docker Scanning  | Keep **Trivy**                    |
| IaC              | Keep **Checkov** (more complete)  |
| Testing          | Keep **pytest**                   |
| DAST             | Keep **ZAP**                      |
| Report           | Combined Report in Markdown       |


These We can leave behind:
| Tool          | Why remove it?                                                                                                                                  |
| ------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| **Bandit**    | Semgrep can cover its security rules for Python, and it's more flexible.                                                                        |
| **Safety**    | Trivy already scans for vulnerabilities in dependencies (e.g., `requirements.txt`) and container images.                                        |
| **tfsec**     | Checkov covers the same Terraform security validations and more, such as compliance frameworks (e.g., CIS benchmarks).                          |
| **SonarQube** | If you're using Semgrep + pytest + coverage, you can skip SonarQube. Unless you need a centralized dashboard for code quality and metrics.      |

