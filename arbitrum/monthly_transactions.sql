with monthly_transactions as (
    select
        date_trunc('month', block_time) as init_block_date,
        count(*) as transaction_cnt
    from arbitrum.transactions
    group by init_block_date
    order by init_block_date
)

select
    init_block_date,
    transaction_cnt,
    sum(transaction_cnt) over (order by init_block_date) as cumulative_transaction_cnt
from monthly_transactions
order by init_block_date