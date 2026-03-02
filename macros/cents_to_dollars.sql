{% macro cents_to_dollars(column_name) %}

    {{ return(" (" ~ column_name ~ " / 100)::numeric(16,2) ") }}

{% endmacro %}