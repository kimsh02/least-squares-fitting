# Least Squares Fitting

## A1. Best Fit Line Using Least Squares

This task explores two approaches for fitting a line to data points from `line data 2.txt`:

- **Non-Homogenous Least Squares**
  - Minimizes **vertical distance** to points
  - Solved using MATLAB with slope-intercept form: `y = mx + b`
  - Implemented using matrix formulation `Ux = y` and solved with `x = U \ y`

- **Homogenous Least Squares**
  - Minimizes **perpendicular distance** to points
  - Solves for line `ax + by = d` using eigen decomposition on centered data
  - Eigenvector with smallest eigenvalue determines line orientation

### Observations:
- Homogenous least squares produced a visually better fit for noisy data.
- RMSE was calculated with respect to both vertical and perpendicular distances:
  - Non-homogenous performed better for vertical RMSE (as expected)
  - Homogenous performed slightly better for perpendicular RMSE
- Close RMSE values raise uncertainty about the precision of perpendicular error calculations
- Notably, the non-homogenous perpendicular RMSE was slightly lower than its vertical RMSE, possibly due to the line being nearly horizontal or minor computational error.

## B1. Perspective Analysis: `building.jpeg`

Lines were drawn over `building.jpeg` to assess vanishing points:

- Some sets of parallel lines converged as expected
- Others, especially those in the same plane, did not produce colinear vanishing points
- Inconsistencies:
  - Floor heights vary unnaturally
  - Suspicious object placement and reflections
- **Conclusion:** Image is **not in true perspective** and may be **AI-generated or enhanced**

## B2. Perspective Analysis: `chandelier.tiff`

A symmetrical chandelier was analyzed using reference lines:

- No valid vanishing points found
- Asymmetry observed in:
  - Arm elevations
  - Relative distances from the central body
  - Misaligned central point at the chandelier’s tip
- Anomalies (e.g., a rod visually interweaving with a flat structure) are physically implausible
- **Conclusion:** Image is **not symmetrical** or **in perspective** and is likely **AI-generated or manipulated**

---
