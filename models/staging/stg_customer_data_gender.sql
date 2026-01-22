select
    "Loan Id" as loan_id,
    gender,
    citizenship
from {{ ref('Customer_Data_Gender') }}