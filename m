From: Oleg Drokin <green@namesys.com>
Subject: Re: bug report: attributes ( chattr +a ) not respected by reiserfs 3.6, but this isn't listed in man mkreiserfs
Date: Fri, 18 Jul 2003 20:06:54 +0400
Message-ID: <20030718160654.GI2268@namesys.com>
References: <200307161057.03293.marvin@synapse.net> <200307162129.h6GLTcR3027410@elijah.imse.ksu.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14965-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200307162129.h6GLTcR3027410@elijah.imse.ksu.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Stegman <matts@ksu.edu>
Cc: reiserfs-list@namesys.com, marvin@synapse.net

Hello!

On Wed, Jul 16, 2003 at 04:29:38PM -0500, Matt Stegman wrote:

> I get the same behaviour, but it appears that *only* the append-only
> attribute is ignored. Other attributes are respected fine.  However,
> there are still some wierd things with reiserfs and attributes.  This is
> a pretty long email detailing what I found.

Thanks a lot for a lot of details.

> # mkreiserfs /dev/hdc1
> <-------------mkreiserfs, 2003------------->
> reiserfsprogs 3.6.8
> mkreiserfs: Guessing about desired format.. 
> mkreiserfs: Kernel 2.4.20-xfs-r3 is running.
> Format 3.6 with standard journal
> ...<snip>...
> # mount -t reiserfs -o attrs /dev/hdc1 /mnt/reiser
> # cd /mnt/reiser
> # echo hello > file
> -bash: file: Permission denied
> Huh?  I'm root, this is a new filesystem, why would permission be
> denied?  Wait a minute...
> # lsattr -d /mnt/reiser
> suS-iadAcjIt- /mnt/reiser

Yes, this is a problem in mkreiserfs.
Surprisingly 2.6.4 works ok.
This of course will be fixed.

> # chattr +i file
> # echo line2 > file
> -bash: file: Permission denied
> Append only (a) is not respected.
> 
> # chattr -i +a file
> # lsattr file
> s-S--adAc--t- file
> # echo test > file
> # ls -l file
> -rw-r--r--    1 root     root            5 Jul 16 16:09 file

Hm... Indeed. Sigh. 

>   a : file can only be opened in append mode
>       Ignored by reiserfs.

Yes, this is a bug.

>   d : tell "dump" to ignore this file
>       Does dump even work on reiserfs?

We use this for marking the file as not needing tail packing.

>   t : do not merge tails on this file
>       I don't know if this is supported or not.

Hm, my "chattr" documentation does not have this flag.

> Finally, 'reiserfsck --clean-attributes' will produce the following:
> # umount /mnt/reiser
> # reiserfsck --clean-attributes /dev/hdc1
> ...<snip>...
> # mount -t reiserfs -o attrs /dev/hdc1 /mnt/reiser
> # lsattr -d /mnt/reiser
> ------------- /mnt/reiser
> # lsattr /mnt/reiser/file
> ------------- /mnt/reiser/file

Yes, this is expected.
Older kernels, that are unaware of reiserfs attributes (pre 2.4.17 ones)
write various garbage in sd_attrs field in stat data. So this needs to be cleaned.
And we even invented a superblock flag to indicate that such a cleaning was performed already.
Now we also see that new mkreiserfs also writes garbage there.

Bye,
    Oleg
