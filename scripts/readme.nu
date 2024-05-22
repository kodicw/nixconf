let dirs: table = ls
let readme = open README.md

def walk_dirs [dirs: table state: list] {
    mut f: list = $state
    for dir in $dirs {
        if $dir.type == file {
            $f = ($f | append $dir.name)
        }
        if $dir.type == dir {
            $f = (walk_dirs (ls $dir.name) $f)
        }
    }
    return $f
}	

#TODO filter function that takes a record {contains: [] absent: []}
walk_dirs $dirs [] 
| filter {|d| not ("hardware" in $d) and not ("home" in $d) and not ("server" in $d) and not ("angel" in $d)}
| filter {|d| ($d =~ configuration ) or ($d =~ just) or ($d =~ ".sh")}
| each {|d|
    {
        path: $d 
        content: (cat $d)
    }
} 
| to text
| $in + $readme

