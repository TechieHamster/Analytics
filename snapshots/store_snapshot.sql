{% snapshot store_snapshot %}

{{
    config(
        target_schema='snapshots',
        unique_key = 'id',
        strategy = 'timestamp',
        updated_at = 'opened_at'
    )
}}

select * from {{ source('ecom' , 'raw_stores')}}

{% endsnapshot %}