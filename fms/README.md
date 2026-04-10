---
title: Finance, Mathematics, Software
abstract: A mathematically rigorous foundation of limited aspects of trading with an eye to computer implementation.
---

We consider the mechanics of how numbers appear in the books and
records of businesses involved with trading, then address the issues
involved with reporting those numbers in a meaningful way

We only consider exchange and over-the-counter trades that account for the
vast majority of trading volume. Our only remark about crypto currencies
is Warren Buffet's quote, "The asset itself is creating nothing. You’re
just hoping the next guy pays more."

The big picture is that legal entities exchange quantities of instruments
over time and need to account for that. The _front office_ involves
traders and risk managers deciding what trades to execute. The
_middle office_ deals with the mechanics of allocation and trade confirmation.
The _back office_ is responsible for settlement and custody.

## Entity

An _entity_ is an individual or company that can hold quantities of instruments.
Every entity can be a _price maker_ that offers to buy or sell some quantity
of an instrument they specify to _price takers_.

Every _entity_ should have a unique
(legal entity identifier)[https://www.gleif.org/en/organizational-identity/lei-vlei/the-legal-entity-identifier-lei)

## Instrument

We make a distinction between securities and instruments.

## Sources

Currencies, bonds, stocks, and other securities come in finite supply.

## Blotter

| Field         | Meaning                                                |
|---------------|--------------------------------------------------------|
| timestamp     | Exact execution time (exchange or system)              |
| instrument    | Symbol, ISIN, or CUSIP identifying the asset           |
| side          | buy or sell                                            |
| quantity      | Filled quantity                                        |
| price         | Execution price                                        |
| order_id      | Identifier of the parent order                         |
| exec_id       | Unique execution identifier from venue or broker       |
| venue         | Exchange, ATS, broker, or RFQ counterparty             |
| account       | Internal account, strategy tag, or book                |
| trader_id     | Trader or algorithm responsible for the execution      |
| order_type    | limit, market, IOC, FOK, peg, etc.                     |
| liquidity_flag| maker or taker (or venue‑specific liquidity code)      |
| fees          | Commissions, exchange fees, and rebates                |
| algo_params   | Optional metadata: slice ID, child‑order info          |
| reg_flags     | Regulatory flags (CAT, MiFID, OATS, best‑ex, etc.)     |

