Exec {
    path => [
        '/bin/',
        '/sbin/' ,
        '/usr/bin/',
        '/usr/local/bin',
        '/usr/local/sbin',
        '/usr/sbin/',
    ]
}

File {
    owner => 'root',
    group => 'root',
    mode  => 0644,
}

node default {
    include ferm
    include hostname
    include monitoring
    include packages
    include ssh
    include timezone
    include users
    include vegguide

    Class['ferm'] -> Class['monitoring'] -> Class['packages'] -> Class['vegguide']
}
