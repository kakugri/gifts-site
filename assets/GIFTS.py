"""Compatibility entry point for the GIFTS reference package.

Use this file together with the full downloadable package, not as a standalone script.
"""

from gifts.cli import main


if __name__ == "__main__":
    raise SystemExit(main())
