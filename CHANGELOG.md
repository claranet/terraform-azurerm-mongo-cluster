## 8.1.3 (2026-03-27)

### Bug Fixes

* **trivy:** 🐛 drop unsafe trivy pre-commit 🔒️ d8ee5c8

### Code Refactoring

* update module structure and Github actions 👷 e66b60c

### Miscellaneous Chores

* **AI:** 🤖 add AI Agents instructions for Contributing ee8b05f
* **deps:** 🔗 bump tflint rules version 4a2cd61
* **deps:** update dependency trivy to v0.69.2 f908218
* **deps:** update dependency trivy to v0.69.3 ca8ad68
* **deps:** update pre-commit hook crate-ci/committed to v1.1.11 1ea5446

## 8.1.2 (2026-02-13)

### Code Refactoring

* **gitlab MR template:** ♻️ update default reviewers group with Azure Factory 🔧 f543f34

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.10.7 2c7fa46
* **deps:** update dependency opentofu to v1.11.2 f498032
* **deps:** update dependency opentofu to v1.11.3 db56167
* **deps:** update dependency opentofu to v1.11.4 000355d
* **deps:** update dependency opentofu to v1.11.5 c28e2ce
* **deps:** update dependency pre-commit to v4.4.0 7dfffb3
* **deps:** update dependency pre-commit to v4.5.0 d70df93
* **deps:** update dependency pre-commit to v4.5.1 a324d47
* **deps:** update dependency tflint to v0.60.0 7cefe1f
* **deps:** update dependency tflint to v0.61.0 eaca893
* **deps:** update dependency trivy to v0.67.1 2985c8c
* **deps:** update dependency trivy to v0.67.2 ea33678
* **deps:** update dependency trivy to v0.68.1 fb41021
* **deps:** update dependency trivy to v0.68.2 2fb52b8
* **deps:** update dependency trivy to v0.69.0 83961c7
* **deps:** update dependency trivy to v0.69.1 788dd6e
* **deps:** update pre-commit hook crate-ci/committed to v1.1.10 c5e062c
* **deps:** update pre-commit hook crate-ci/committed to v1.1.8 88796db
* **deps:** update pre-commit hook crate-ci/committed to v1.1.9 f9e651a
* **deps:** update pre-commit hook tofuutils/pre-commit-opentofu to v2.2.2 9a0f136
* **deps:** update tools 3add846

## 8.1.1 (2025-10-01)

### Code Refactoring

* **deps:** 🔗 update claranet/azurecaf to ~> 1.3.0 🔧 a2cc506

### Miscellaneous Chores

* **⚙️:** ✏️ update template identifier for MR review 6dd7f2f
* 🗑️ remove old commitlint configuration files 8973c3a
* **deps:** 🔗 bump AzureRM provider version to v4.31+ 7e64829
* **deps:** update dependency opentofu to v1.10.0 de57383
* **deps:** update dependency opentofu to v1.10.1 261df3a
* **deps:** update dependency opentofu to v1.10.3 04a7d1c
* **deps:** update dependency opentofu to v1.10.6 318f024
* **deps:** update dependency tflint to v0.58.1 d631780
* **deps:** update dependency tflint to v0.59.1 59fc461
* **deps:** update dependency trivy to v0.66.0 99e1313
* **deps:** update dependency trivy to v0.67.0 7d72113
* **deps:** update pre-commit hook pre-commit/pre-commit-hooks to v6 432e7d5
* **deps:** update tools 3b97c39
* **deps:** update tools 3b1c9e4
* **deps:** update tools 9776093

## 8.1.0 (2025-06-20)

### Features

* **AZ-1577:** modify connection string output ca1df7e

### Miscellaneous Chores

* **deps:** update pre-commit hook tofuutils/pre-commit-opentofu to v2.2.1 1d8bd7b

## 8.0.0 (2025-06-13)

### ⚠ BREAKING CHANGES

* **AZ-1571:** 💥 ✨  add MongoDB cluster module

### Features

* **AZ-1571:** 💥 ✨  add MongoDB cluster module ec9d141
* **AZ-1571:** module MongoDB Cluster initialization 37e0a4d

### Bug Fixes

* **AZ-1571:** fix minimum azurerm provider version 610da69
* **AZ-1571:** fix required provider version in example and apply suggestions 99baf0b

Added
  * AZ-1571: MongoDB Cluster module first release
