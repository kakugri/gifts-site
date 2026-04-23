# GIFTS Workflow Findings Report

- Source file: `examples/gifts_session_contract_example.jsonl`
- Sessions scored: `2`
- Risk mix: `critical=0`, `high=1`, `medium=0`, `low=1`

## Triage Queue

| Session | Risk | Score | Top signals | Recommended first action |
| --- | --- | ---: | --- | --- |
| `session-blackout-attack-001` | `high` | 62 | missing_or_blacked_out_events, suspicious_principal_label, external_or_tor_source | Open an identity-security triage item for this session. |
| `session-normal-001` | `low` | 6 | sensitive_actions | Retain as baseline context unless correlated with another alert. |

## Session `session-blackout-attack-001`

- Risk: `high` / `62`
- Label: `attack`
- Attack type: `resource_hijack`
- Events: `5` total, `3` missing or blacked out

Signals:
- `missing_or_blacked_out_events` (+30): Session contains intentionally missing or blacked-out event slots. Evidence: missing_indices=[1, 2, 3]
- `suspicious_principal_label` (+18): Principal naming suggests an unknown, suspicious, or stolen-token context in the example data. Evidence: parn:arn:aws:sts::111122223333:assumed-role/suspicious-role/session
- `external_or_tor_source` (+14): Session includes access from an external or Tor-like source category. Evidence: ip:external

Recommended actions:
- Open an identity-security triage item for this session.
- Review the principal, source IP category, user agent, and target resources.
- Check whether logging gaps, suppressed telemetry, or event-delivery delays explain the missing segment.
- Correlate the source network with VPN, geolocation, and known corporate egress paths.

## Session `session-normal-001`

- Risk: `low` / `6`
- Label: `normal`
- Attack type: `normal`
- Events: `4` total, `0` missing or blacked out

Signals:
- `sensitive_actions` (+6): Session contains actions that often deserve identity-security review. Evidence: [03] s3:PutObject

Recommended actions:
- Retain as baseline context unless correlated with another alert.

## Interpretation Guardrail

These findings are workflow-prioritization outputs from the public GIFTS reference package. They are intended to help analysts decide what to review, not to serve as final forensic conclusions or production detection guarantees.
