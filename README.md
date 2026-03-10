# 📈 Regime-Based Sector Allocation Strategy
> Analyzing how interest rate environments shape equity sector performance — and what that means for smarter allocation

![Python](https://img.shields.io/badge/Python-3.10+-blue?logo=python&logoColor=white)
![R](https://img.shields.io/badge/R-Statistical%20Validation-276DC3?logo=r&logoColor=white)
![Data](https://img.shields.io/badge/Data-FRED%20%7C%20S%26P%20500%20ETFs-lightgrey)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

---

## 📌 Overview

Interest rates move markets — but not all sectors respond the same way.

This project examines how **changing interest rate regimes** (rising, falling, stable) affect **sector-level stock performance** across the S&P 500. The goal is to deliver a **consulting-style sector allocation recommendation** grounded in empirical analysis.

### Business Question
> *In different interest rate environments, which equity sectors should be overweighted or underweighted to optimize risk-adjusted returns?*

---

## 🔬 Hypotheses

| # | Hypothesis |
|---|-----------|
| H1 | Interest rate changes affect sector performance **asymmetrically** |
| H2 | During **rising** rate environments, Financials and Energy outperform the market |
| H3 | During **declining** rate environments, Technology-oriented sectors outperform |
| H4 | Rate-sensitive sectors exhibit **higher volatility**, requiring risk-adjusted allocation |

---

## 📂 Data Sources

| Data | Source |
|------|--------|
| **Interest Rates** | Federal Funds Rate (monthly) — [FRED](https://fred.stlouisfed.org/) |
| **Equity Sectors** | S&P 500 sector ETFs (XLK, XLF, XLE, etc.) |
| **Benchmark** | S&P 500 Index |

### Design & Assumptions

- **Frequency:** Monthly data to align rate movements with sector returns
- **Period:** 2005 – present (covers multiple full rate cycles)
- **Regime Classification:**
  - 📈 **Rising** — Fed Funds Rate increased vs. prior month
  - 📉 **Falling** — Fed Funds Rate decreased vs. prior month
  - ➡️ **Stable** — No change in rate
- **Returns:** ETF total return proxies with dividends reinvested

---

## 📊 Findings

### H1 — Asymmetric Sector Response ✅ Confirmed

Sector performance varies meaningfully across rate regimes. Technology stocks perform strongest during **stable rate environments**, while Energy and defensive sectors show relative strength during **declining rate periods**. This confirms that a one-size-fits-all allocation approach is insufficient.

---

### H2 — Financials & Energy in Rising Rate Environments ⚠️ Partially Supported

> *Hypothesized: Financials and Energy outperform during rate hikes.*

The empirical results show **no consistent outperformance** by Financials or Energy during rising rate periods. In several instances, Technology and defensive sectors performed comparably or better. Rising rates alone do not explain sector-level divergence — **broader macroeconomic and earnings dynamics** play an equally critical role.

---

### H3 — Technology in Falling Rate Environments ⚠️ Partially Supported

> *Hypothesized: Technology leads during declining rate periods.*

Technology does not uniformly lead during falling rate environments. Instead, **Energy and Health Care** frequently demonstrated strong returns — likely because rate cuts often coincide with broader economic transitions rather than directly benefiting growth sectors. Context matters.

---

### H4 — Volatility & Risk-Adjusted Performance ✅ Confirmed

Sectors with higher interest rate sensitivity exhibit elevated volatility. Sharpe ratio analysis reinforces the need to **balance return potential with consistency** — raw returns alone are a misleading signal for allocation strategy.

---

## 🧪 Statistical Validation (R)

Robustness was tested using **Welch's two-sample t-tests** in R, comparing returns across regimes and between Technology vs. non-Technology sectors.

```
r/statistical_tests.R
Input: analysis_data.csv (exported from Python)
```

> During falling rate periods, the difference in average monthly returns between Technology and non-Technology sectors was **marginally significant (p ≈ 0.07)** — directionally suggestive, but below the conventional 5% threshold.

This reinforces the need to combine **statistical validation with economic reasoning** rather than relying on significance alone.

---

## 💡 Strategic Implications

A few key takeaways for regime-based allocation:

- **Don't over-rely on rate direction alone** — sector returns are shaped by earnings expectations, macro transitions, and regime-specific dynamics
- **Technology and defensive sectors** can remain competitive even during tightening cycles
- **Adaptive, data-driven frameworks** outperform static sector positioning
- A **regime-based approach** — adjusting exposure to rate environment rather than fixed assumptions — provides meaningful flexibility

---

## ⚠️ Limitations & Future Work

- Analysis uses **sector-level ETF proxies** and monthly frequency, which may mask intra-month dynamics and stock-specific effects
- Future extensions could incorporate:
  - Firm-level (stock-level) data
  - Alternative macro indicators (CPI, yield curve slope, etc.)
  - International market comparisons

---

## 📁 Project Structure

```
regime-sector-allocation/
│
├── python/               # Data collection, analysis, strategy simulation
│
├── r/
│   └── statistical_tests.R   # Welch t-tests, regime comparisons
│
├── data/
│   └── analysis_data.csv     # Shared input for R validation
│
└── README.md
```

---

## 📦 Requirements

**Python**
```
pandas
numpy
matplotlib
seaborn
yfinance
fredapi
```

**R**
```r
install.packages(c("tidyverse", "broom"))
```
