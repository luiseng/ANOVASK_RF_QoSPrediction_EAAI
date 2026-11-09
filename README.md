# Hyperparameter Optimization & Statistical Analysis Workflow (ANOVASK)

This repository contains the code and methodology used to analyze and evaluate hyperparameter optimization performance for quality of service (QoS) prediction in vehicular networks. The workflow combines machine learning experiments (Random Forest) with robust statistical evaluation, including Analysis of Variance (ANOVA) and the Scott-Knott (SK) mean grouping test.

## 📂 Repository Structure & Versions

To facilitate usage and execution, the codebase is divided into two distinct versions, available in their respective folders:

### [📁 v2.0-unified-pipeline/](./v2.0-unified-pipeline/) (Recommended)
**Integrated Python & R Pipeline**
* Contains the script `rf_anovask_doutorado_ingles.py`.
* **Description:** A fully integrated pipeline that performs data preprocessing (Berlin V2X dataset), hyperparameter screening, combination testing, and statistical clustering in a single run. It uses the `rpy2` bridge to execute the R-based ANOVA and Scott-Knott algorithms directly within the Python environment (ideal for Google Colab).(Note: The refactoring and integration of this unified version was assisted by Google Gemini)
* **Requirements:** Python 3.8+, `pandas`, `numpy`, `scikit-learn`, `rpy2`, and R 4.0+ with the `ScottKnott` package.

### [📁 v1.0-classic-split/](./v1.0-classic-split/)
**Original Two-Step Process**
* Contains the original Python script/notebook and the separate R script (`.R`).
* **Description:** The classic workflow where machine learning training and metric extraction are performed in Python, exported to a spreadsheet (`.csv`/`.xlsx`), and subsequently imported into an independent R environment for statistical evaluation.
* **Requirements:** Python 3.8+ (for ML execution) and an independent R 4.0+ environment (for statistical analysis).

---

## 📋 Execution Workflows

Please navigate to the specific folder of the version you wish to use. 

* **For Version 2.0:** Simply execute the `rf_anovask_doutorado_ingles.py` script. It will automatically handle the dataset, generate the combinations, and run the statistical tests internally.
* **For Version 1.0:** Run the Python script first to generate the metric results spreadsheet, then load that file into the provided R script to extract the final rankings and statistical groupings.

---

## 📚 Citation

Code developed by Luis Alves Correia Filho, adapted from the original R implementation authored by André L. C. Ottoni.

If you use this codebase or methodology in your research, please cite our published article:

> Novo, M. S., Correia Filho, L. A., Ottoni, A. L., Schösser, A., Schulz, P., & Fettweis, G. (2026). Random forest for quality of service prediction in vehicular communication: A statistical approach to hyperparameter tuning. *Engineering Applications of Artificial Intelligence*, 181, 115754. https://doi.org/10.1016/j.engappai.2026.115754

**BibTeX reference:**
```bibtex
@article{RFANOVASK_EAAI2026, 
  title = {Random forest for quality of service prediction in vehicular communication: A statistical approach to hyperparameter tuning}, 
  author = {Novo, Marcela S. and Correia Filho, Luis A. and Ottoni, Andr{\'e} L. and Sch{\"o}sser, Anton and Schulz, Philipp and Fettweis, Gerhard}, 
  journal = {Engineering Applications of Artificial Intelligence}, 
  volume = {181}, 
  pages = {115754}, 
  year = {2026}, 
  issn = {0952-1976}, 
  doi = {10.1016/j.engappai.2026.115754}, 
  url = {[https://www.sciencedirect.com/science/article/abs/pii/S0952197626020385](https://www.sciencedirect.com/science/article/abs/pii/S0952197626020385)} 
}
