From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: We need help benchmarking and debugging reiser4
Date: Mon, 4 Nov 2002 21:14:43 +0300
Message-ID: <15814.47379.35523.580531@laputa.namesys.com>
References: <reiser@namesys.com>
	<3DBF98A7.8060906@namesys.com>
	<200211012236.gA1MaqT20507@mail.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11911-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200211012236.gA1MaqT20507@mail.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Cliff White <cliffw@osdl.org>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, Oleg Drokin <green@namesys.com>, Benoit Poulot-Cazajous <Benoit.Poulot-Cazajous@Jaluna.COM>

Cliff White writes:
 > > Can some of you help us by doing such things as replicating our 
 > > benchmarks, and helping us debug it as we enter the last stretch before 
 > > Halloween?
 > > 
 > 
 > We are interested in helping, but i haven't seen the follow-up mail 
 > mentioned below - if you could send us some more specifics, we'd be
 > glad to join the fun.

Sorry for delay.

Benchmarks Hans is talking about consist of reading some directory tree
from given file system (foofs, foo={reiser{4,fs},ext{2,3}}). Reading is
done by copying data to the ramfs. One can do the same with tar, but be
warned that "tar cf /dev/null ." is special cased in gnu tar: no actual
reads take place if output is /dev/null.

Another (very important, as it turned out) point is that directory tree
has to be in read optimal order for foofs: files were created in the
order of their directory entries.

Probably example is the best way to describe this: to create
read-optimal directory tree in foofs do:

$ cd /mnt/foofs-mount-point
$ cp -a /somewhere/directory-tree .
$ tar cf directory-tree /somewhere/directory-tree-foofs-read-optimal.tar
$ cd /
$ umount /mnt/foofs-mount-point
$ /sbin/mkfs.foofs /dev/device
$ mount /dev/device /mnt/foofs-mount-point
$ cd /mnt/foofs-mount-point
$ tar xf /somewhere/directory-tree-foofs-read-optimal.tar

Now, /mnt/foofs-mount-point/directory-tree contains read-optimal
directory tree for foofs.

We are also generally interested in results of any standard file system
benchmarks/stress tests.

Reiser4 has known rough corners with running out of disk space.

And of course, SMP scalability measurements on OSDL hardware would be
very interesting. Just simple kernel compilation would pass as rough
test, I think.

 > cliffw
 > OSDL
 > 
 > > Nikita and Oleg will describe the details of what to do to replicate the 
 > > benchmarks, please be sure to use reiser4 readdir order for writes to 
 > > reiser4 (that means don't use tarballs made from ext2 (Remember that 
 > > writes determine subsequent read performance.)), and to use the latest 
 > > hard drives and fast processors with udma 5 turned on.  We are quite 
 > > sensitive to transfer speed since we do a good job of avoiding seeks.  
 > > We are sensitive to readdir order because we sort directory entries 
 > > (which is necessary for having efficient large directory lookups).   In 
 > > reiser4.1 we will ship a repacker, and then it won't matter what order 
 > > you do writes in so long as the repacker gets a chance to run at night.  
 > > 
 > > -- 
 > > Hans
 > > 

Nikita.
