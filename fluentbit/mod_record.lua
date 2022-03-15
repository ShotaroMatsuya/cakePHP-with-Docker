function add_logged_at(tag,timestamp,record)
    a,b = math.modf(timestamp)
    record["inserted_at"] = string.format(
        "%s.%06dZ",
        os.date("%FT%T", a),
        math.floor(b * 1000 * 1000)
    )
    return 1, timestamp, record
end