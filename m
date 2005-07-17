From: PFC <lists@boutiquenumerique.com>
Subject: Re: Resize of a reiser4 filesystem?
Date: Sun, 17 Jul 2005 17:34:24 +0200
Message-ID: <op.st2djmj7th1vuj@localhost>
References: <42DA6EBE.7020100@mid.alexander.skwar.name> <op.st2cqe1kth1vuj@localhost> <42DA780D.1070101@mid.alexander.skwar.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-25151-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42DA780D.1070101@mid.alexander.skwar.name>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: reiserfs-list@namesys.com


> In 1.0.3, I also had that manpage - but I had no binary. Do you
> have a binary?

Looks like it is there :

nyuu root # grep resize /var/db/pkg/sys-fs/reiser4progs-1.0.3/CONTENTS
obj /usr/share/man/man8/resizefs.reiser4.8.gz  
2142fde4cd6c41cfe319f34dd082c07c 1110658498
obj /sbin/resizefs.reiser4 c8acc86f223809b70ad1d36cc37da264 1110658498

nyuu root # which resizefs.reiser4
/sbin/resizefs.reiser4

nyuu root # resizefs.reiser4
Usage: resizefs.reiser4 [ options ] FILE size[K|M|G]
Plugins options:
   -p, --print-profile           prints default profile.
   -l, --print-plugins           prints known plugins.
   -o, --override TYPE=PLUGIN    overrides the default plugin of the type
                                 "TYPE" by the plugin "PLUGIN" in the
                                 profile.
Common options:
   -?, -h, --help                prints program usage.
   -V, --version                 prints current version.
   -y, --yes                     assumes an answer 'yes' to all questions.
   -f, --force                   makes resizer to use whole disk, not
                                 block device or mounted partition.
   -c, --cache N                 number of nodes in tree buffer cache

