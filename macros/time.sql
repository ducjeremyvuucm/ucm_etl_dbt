{% macro parse_duration(duration) %}
    {% set hours = 0 %}
    {% set minutes = 0 %}
    {% set seconds = 0 %}

    {% if "H" in duration %}
        {% set hours = duration.split("H")[0] | replace("PT", "") | int %}
    {% endif %}
    {% if "M" in duration %}
        {% set minutes = duration.split("M")[0].split("H")[-1] | int %}
    {% endif %}
    {% if "S" in duration %}
        {% set seconds = duration.split("S")[0].split("M")[-1] | int %}
    {% endif %}

    {{ return({"hours": hours, "minutes": minutes, "seconds": seconds}) }}
{% endmacro %}

{% macro duration_to_decimal_hours(duration) %}
    {% set duration_parts = parse_duration(duration) %}
    {% set hours = duration_parts.hours | float %}  -- Convert to float
    {% set minutes = duration_parts.minutes | float %}  -- Convert to float
    {% set seconds = duration_parts.seconds | float %}  -- Convert to float
    {% set decimal_hours = hours + (minutes / 60.0) + (seconds / 3600.0) %}
    {{ return(decimal_hours | float) }}  -- Ensure the final result is a float
{% endmacro %}


{% macro convert_timestamp_to_unix_to_datetime(timestamp_column) %}
    datetime(timestamp_seconds(unix_seconds({{ timestamp_column }})))
{% endmacro %}


{% macro convert_unix_to_datetime(unix_timestamp_column) %}
    datetime(timestamp_seconds(cast({{ unix_timestamp_column }} as int64)))
{% endmacro %}
