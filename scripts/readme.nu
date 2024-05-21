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

walk_dirs $dirs [] 
| filter {|d| not ("home" in $d) and not ("server" in $d) and not ("angel" in $d)}
| filter {|d| ($d =~ configuration ) or ($d =~ just) or ($d =~ .md)}
| each {|d|
    {path: $d text: (cat $d)}
} 
| drop nth 0 
| to text
| $in + $readme

