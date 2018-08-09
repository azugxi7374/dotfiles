def rectype:
    if type=="object" then
        map_values(rec_type)
    elif type=="array" then
        map(rec_type) | unique
    else
        type
    end;
