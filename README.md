# March Madness Final Four Prediction

Predicting NCAA March Madness Final Four teams using machine learning with 17 years of tournament data (2008-2024).

## Overview

Built and compared three ML models to predict which teams make the Final Four:
- **Logistic Regression**
- **Random Forest** 
- **XGBoost**

**Data**: KenPom advanced basketball metrics (barthag, adjusted efficiency, strength of schedule, etc.)

NOTE: Used RStudio to run .R files


## Key Findings

1. **Overall team strength dominates** - barthag indicates high importance
2. **Simpler models competed well** - Logistic Regression had highest AUC despite being least complex
3. **High AUC can mislead** - With 99% class imbalance, precision/recall are more honest metrics
4. **58% recall beats expert brackets** - Better than most human predictions

## Methodology

- **Train/Test Split**: Time-based (train: 2008-2021, test: 2022-2024)
- **Class Imbalance**: SMOTE oversampling (4 Final Four teams per year out of 68)
- **Feature Scaling**: StandardScaler
- **Threshold Tuning**: Adjusted from default 0.5 to optimize precision/recall tradeoff

## Data Dictionary

### Target Variable
| Variable | Description |
|----------|-------------|
| `made_final_four` | Binary (1 = Final Four, 0 = Not Final Four) |

### Features
| Feature | Description | Range/Type |
|---------|-------------|------------|
| **barthag** | Overall team rating (Bartholomew) | 0-1, higher = stronger |
| **adj_o** | Adjusted offensive efficiency (points/100 possessions) | 90-125, higher = better |
| **adj_d** | Adjusted defensive efficiency (points allowed/100 possessions) | 85-110, lower = better |
| **adj_t** | Adjusted tempo (possessions/40 min) | 60-75, higher = faster |
| **seed_filled** | Tournament seed | 1-16 (lower = better), 17 = didn't make tournament |
| **elite_seed** | Top 4 seed indicator | Binary (1 = seeds 1-4, 0 = other) |
| **wab** | Wins above bubble | Continuous, positive = tournament quality |
| **ov_cur_sos** | Overall strength of schedule | 0-1, higher = tougher opponents |

### Metadata (Not Used in Modeling)
| Variable | Description |
|----------|-------------|
| `team` | Team name |
| `year` | Tournament year (2008-2024) |

## Installation

```bash
pip install pandas numpy scikit-learn xgboost imbalanced-learn matplotlib seaborn jupyter
jupyter notebook
```

## Key Lessons

- Feature quality > model complexity
- SMOTE requires threshold tuning (default 0.5 assumes balanced classes)
- For imbalanced data, prioritize precision/recall over accuracy
- March Madness remains beautifully unpredictable