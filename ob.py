import numpy as np
import matplotlib.pyplot as plt
from collections import defaultdict, deque

# --- Simulation parameters ---
np.random.seed(42)
mid_price = 100.0
tick_size = 0.01
max_levels = 10  # levels on each side
lambda_limit = 5   # avg limit orders per time step
lambda_cancel = 2  # avg cancellations per time step
lambda_market = 1  # avg market orders per time step
steps = 200

# Order book: price -> signed volume (bids positive, asks negative)
book = defaultdict(int)

# Initialize with some seed liquidity
for i in range(1, max_levels+1):
    book[mid_price - i*tick_size] = np.random.randint(50, 150)  # bids
    book[mid_price + i*tick_size] = -np.random.randint(50, 150) # asks

def best_bid():
    bids = [p for p,v in book.items() if v > 0]
    return max(bids) if bids else None

def best_ask():
    asks = [p for p,v in book.items() if v < 0]
    return min(asks) if asks else None

def add_limit_order():
    side = np.random.choice(['B','A'])
    level_offset = np.random.randint(1, max_levels+1)
    if side == 'B':
        price = best_bid() - level_offset*tick_size
        vol = np.random.randint(10, 50)
        book[price] += vol
    else:
        price = best_ask() + level_offset*tick_size
        vol = np.random.randint(10, 50)
        book[price] -= vol

def cancel_order():
    if not book:
        return
    price = np.random.choice(list(book.keys()))
    if book[price] > 0:
        cancel_vol = np.random.randint(1, book[price]+1)
        book[price] -= cancel_vol
    elif book[price] < 0:
        cancel_vol = np.random.randint(1, abs(book[price])+1)
        book[price] += cancel_vol
    if book[price] == 0:
        del book[price]

def execute_market_order():
    side = np.random.choice(['B','A'])
    size = np.random.randint(20, 80)
    if side == 'B':  # buy market order hits asks
        while size > 0 and best_ask() is not None:
            ask_p = best_ask()
            avail = abs(book[ask_p])
            take = min(size, avail)
            book[ask_p] += take  # less negative
            size -= take
            if book[ask_p] == 0:
                del book[ask_p]
    else:  # sell market order hits bids
        while size > 0 and best_bid() is not None:
            bid_p = best_bid()
            avail = book[bid_p]
            take = min(size, avail)
            book[bid_p] -= take
            size -= take
            if book[bid_p] == 0:
                del book[bid_p]

def snapshot_depth():
    bids = {p:v for p,v in book.items() if v > 0}
    asks = {p:-v for p,v in book.items() if v < 0}
    bid_prices = sorted(bids.keys(), reverse=True)
    ask_prices = sorted(asks.keys())
    cum_bids, cum_asks = [], []
    cb = 0
    for p in bid_prices:
        cb += bids[p]
        cum_bids.append(cb)
    ca = 0
    for p in ask_prices:
        ca += asks[p]
        cum_asks.append(ca)
    return bid_prices, cum_bids, ask_prices, cum_asks

# --- Run simulation ---
plt.ion()
fig, ax = plt.subplots()

for t in range(steps):
    # Poisson arrivals
    for _ in range(np.random.poisson(lambda_limit)):
        add_limit_order()
    for _ in range(np.random.poisson(lambda_cancel)):
        cancel_order()
    for _ in range(np.random.poisson(lambda_market)):
        execute_market_order()

    ax.clear()
    bid_p, bid_d, ask_p, ask_d = snapshot_depth()
    ax.step(bid_p, bid_d, where='post', color='green', label='Bids')
    ax.step(ask_p, ask_d, where='post', color='red', label='Asks')
    ax.set_xlabel('Price')
    ax.set_ylabel('Cumulative Volume')
    ax.set_title(f'Order Book Depth at step {t}')
    ax.legend()
    ax.grid(True)
    plt.pause(0.05)

plt.ioff()
plt.show()
