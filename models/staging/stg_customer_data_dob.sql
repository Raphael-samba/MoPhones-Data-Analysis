with source as (

    select
        _id,
        provider,
        date_of_birth,
        trim("Loan Id ") as loan_id,
        "createdAt UTC" as created_at_utc

    from {{ ref('Customer_Data_DOB') }}

)

select *
from source