From: Hans Reiser <reiser@namesys.com>
Subject: Re: Agressive selective pre-allocation
Date: Tue, 10 Dec 2002 17:13:13 +0300
Message-ID: <3DF5F679.1000700@namesys.com>
References: <20021210074600.J26400@vestdata.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12137-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021210074600.J26400@vestdata.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Ragnar_Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Cc: reiserfs-list@namesys.com

Ragnar Kj=F8rstad wrote:

>Hi
>
>
>A lot of filesystems have files that grow slowly over time, and this is
>causing serious fragmentation, and thus performance-problems in some
>situations.
>
>A defragmentation-utility could potentially solve this, but maybe there
>is a better way?
>
>Some files, for instance MBOX-type mailboxes and logfiles, are known to
>the user/administrator to grow over time. It is possible to preallocate
>diskspace by creating large files with just zeroes in them, but this is
>not very flexible and requires the application to be awere.
>
>An alternative would be the possibility to tell the fs about the
>properties of the files. Maybe an ioctl to notify the fs that for this
>particular file the fs should allocate X blocks at the time? That would
>ensure that the files only get limited fragmentation and performance
>stays optimal.
>
Veritas did this, and then their architect regretted that nobody=20
actually used that code and advised me not to do it.  You may have an=20
advantage with open source though in that you can modify the important=20
user space programs to use it.

We have some block preallocation code in V3 for files that are kept open=20
while being written to.  You can look at that code if you want.  You can=20
also write a plugin for v4 that does what you want.

While I will not take someone off another task to work on this, I will=20
be open to patches from others.

>
>Does the metadata-format support blocks beeing allocated but not used
>yet? Is it sufficient to add them to the extent-map, mark them free,
>without changing the size of the file?
>
>An even better way would be to mark the blocks as "preallocated" without
>assigning them to the file. This would allow preallocation without
>actually locking the blocks - so if the disk went full the allocator
>could override the preallocation and use them for other data.=20
>
>Blocks are managed in extents in reiserfs4, right? So I assume there is
>an extent-list for free blocks? So maybe one could add an extra
>extent-list for "preallocated blocks", and the change the allocator to
>search that list if, and only if, it is appending to file on the
>previous block or if there are no blocks in the free-list?
>
>
>I have no time to try to implement this right now, but I just got the
>idea and figgured I should write it down while fresh in memory. Any
>reason why this wouldn't work?=20
>
>Personally I think fragmentation is one of the most serious
>performance-problems for filesystems, and this could potentially help a
>lot at least for the slow-growing files like logfiles and mboxes.
>
>
>
> =20
>


