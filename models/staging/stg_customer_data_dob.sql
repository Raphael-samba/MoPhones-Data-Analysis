select
    "Loan Id" as loan_id,
    date_of_birth
from {{ ref('Customer_Data_DOB') }}