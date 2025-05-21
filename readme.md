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



Alignment with security frameworks:

OWASP Top 10
✔️ Semgrep → Detects issues like XSS, SQLi, hardcoded secrets (e.g., OWASP A01, A03, A06).

✔️ ZAP → Performs dynamic analysis simulating attacks (e.g., A01: Broken Access Control, A03: Injection).

✔️ Trivy → Detects vulnerable dependencies (A06).

✔️ Gitleaks → Catches hardcoded secrets (A02: Cryptographic Failures).


🔹 NIST Cybersecurity Framework (CSF)
| CSF Function | Your Tools Example                                                |
| ------------ | ----------------------------------------------------------------- |
| **Identify** | Infrastructure as Code scanning (Checkov)                         |
| **Protect**  | Secret scanning (Gitleaks), SAST (Semgrep), image scans (Trivy)   |
| **Detect**   | ZAP for runtime threats, coverage reports                         |
| **Respond**  | Combined report helps with triage and issue tracking              |
| **Recover**  | Not directly covered — would be part of a larger incident process |


🔹 CIS Benchmarks
✔️ Checkov → Checks Terraform against CIS rules (e.g., least privilege in cloud IAM).

✔️ Trivy → Validates Docker image security configuration and packages.

🔹 MITRE ATT&CK
⚠️ Not directly addressed in your current pipeline.

🔁 Can be added by integrating tools like Falco, Wazuh, or OSQuery for runtime detection based on ATT&CK TTPs.

🔹 ISO/IEC 27001
✔️ Evidence from scans, tests, and reports can be used for audit trails and change management.

🔁 Could be improved with traceability features or approval workflows in pipelines (e.g., GitHub Actions with required reviews).

🔹 PCI-DSS (Requirement 6: Secure Development)
✔️ Static code analysis (Semgrep, Bandit)

✔️ Vulnerability scans (Trivy, Safety)

✔️ Secret management (Gitleaks)

✔️ Test automation (pytest)

🔹 SOC 2
✔️ Strong on Security principle (vulnerability detection, test coverage).

🔁 For full alignment, consider logging CI/CD actions, enforcing code review policies, and storing pipeline artifacts for auditing.



🟡 Summary: Strengths & Gaps
| Category          | Status     | Notes                                                              |
| ----------------- | ---------- | ------------------------------------------------------------------ |
| SAST              | ✅ Strong   | Semgrep covers OWASP and general secure coding                     |
| Secrets Scanning  | ✅ Strong   | Gitleaks is simple and effective                                   |
| Dependency Scan   | ✅ Strong   | Trivy and Safety cover multiple package managers                   |
| Container Scan    | ✅ Strong   | Trivy does thorough Docker scanning                                |
| IaC Security      | ✅ Strong   | tfsec + Checkov cover Terraform misconfigurations                  |
| DAST              | ✅ Strong   | ZAP is a powerful open-source DAST tool                            |
| Coverage & Tests  | ✅ Strong   | pytest + coverage is a solid testing base                          |
| Reporting         | ✅ Strong   | combined-report.md is practical for visibility                     |
| Runtime Detection | ⚠️ Missing | Add tools like Falco or OSQuery for runtime/host-based security    |
| Compliance Trace  | ⚠️ Medium  | Could be enhanced with approval gates, logging, policy enforcement |
