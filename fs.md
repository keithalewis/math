---
title: Financial System
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Framework
...

A general framework for financial systems.


## Tables

A _position_ is an _amount_, _instrument_, _holder_, and _role_.
The `positions` table is append only.
The amount is an integer multiple of the smallest traded unit of the instrument.
The holder identifies who owns the position. The role
can be _buyer_, _seller_, _broker_, etc.

```sql
CREATE TABLE positions (
	id INT PRIMARY KEY,
	amount BIGINT,      -- multiple of smallest tradable unit
	instrument INT,     -- unique instrument identifier (FIGI)
	holder INT,         -- identity of who owns the position
	role INT,           -- buyer, seller, broker, ...
);
```

Instruments are uniquely identified by their [FIGI](https://www.openfigi.com/).

```sql
CREATE TABLE instruments (
	id INT PRIMARY KEY,
	FIGI CHAR(12), 
	-- ...other metadata...
	FOREIGN KEY(id) REFERENCES positions(instrument)
);
```

```sql
CREATE TABLE holders (
	id INT PRIMARY KEY,
	LEI CHAR(20), -- legal entity controlling holder [LEI](https://www.iso.org/standard/59771.html)
	-- group
	-- department
	-- other metadata...
	FOREIGN KEY(id) REFERENCES positions(holder)
);
```

An _exchange_ is a _timestamp_, a _buyer_ position, and a _seller_ positiion.

```sql
CREATE TABLE exchanges (
	id INT PRIMARY KEY,
	time DATETIME NOT NULL,
	buyer INT NOT NULL,
	seller INT NOT NULL,
	FOREIGN KEY(buyer) REFERENCES positions(id),
	FOREIGN KEY(seller) REFERENCES positions(id),
);
```

An exchange adds 4 entries in the positions table:

```sql
INSERT INTO positions VALUES (
	(-buyer.amount, buyer.instrument, buyer.holder),
	(seller.amount, seller.instrument, buyer.holder),
	(-seller.amount, seller.instrument, seller.holder),
	(buyer.amount, buyer.instrument, seller.holder),
);
```

This simplifies net position and profit-and-loss calculations.
Just use `SUM(amount)` in the query.

Split a position $a$ into positions $a'$ and $a - a'$.

```sql
INSERT INTO positions VALUES (
	(-a, instrument, holder),
	(a', instrument, holder),
	(a - a', instrument, holder),
```
Ensure $0 < a' \le a$?

## Analytics

A _model_ is parameterized (tuned) by market data. E.g., a yield curve
bootstrapped by market instruments.
An _analytic_ is a function from an instrument, model, and analytic parameters.


