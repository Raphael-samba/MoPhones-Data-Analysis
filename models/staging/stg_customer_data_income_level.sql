select
    "Loan Id" as loan_id,
    duration,
    received,
    "Persons Received From Total" as persons_received_total,
    "Banks Received" as banks_received,
    "Paybills Received Others" as paybills_received_others
from {{ ref('Customer_Data_Income_Level') }}