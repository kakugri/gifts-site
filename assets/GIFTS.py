"""Entry point for GIFTS training/evaluation pipeline.

Refactored into modules under `code/gifts/`.
"""

from gifts.pipeline import run_pipeline


if __name__ == "__main__":
    run_pipeline(report_path="GIFTS_Forensic_Report_Inpaint.md")
