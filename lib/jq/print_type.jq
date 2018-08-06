def rec_map_values(after):
    if type=="object" or type=="array" then
        map_values(rec_map_values(after)) | after
    else
        after
    end;

rec_map_values
