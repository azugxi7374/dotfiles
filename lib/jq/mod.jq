def rmv(pre; post):
    if type=="object" or type=="array" then
        pre | map_values(rmv(pre; post)) | post
    else
        pre | post
    end
;

def rmv(post):
    rmv(.; post)
;

def rtype:
    def post:
        if type=="object" then .
        elif type=="array" then unique
        else type end
    ;
    rmv(post)
;


