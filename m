From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Subject: Re: Agressive selective pre-allocation
Date: Sat, 14 Dec 2002 03:06:52 +0100
Message-ID: <20021214030652.H2727@vestdata.no>
References: <20021210074600.J26400@vestdata.no> <3DF5F679.1000700@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12160-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3DF5F679.1000700@namesys.com>; from reiser@namesys.com on Tue, Dec 10, 2002 at 05:13:13PM +0300
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

On Tue, Dec 10, 2002 at 05:13:13PM +0300, Hans Reiser wrote:
> >An alternative would be the possibility to tell the fs about the
> >properties of the files. Maybe an ioctl to notify the fs that for this
> >particular file the fs should allocate X blocks at the time? That would
> >ensure that the files only get limited fragmentation and performance
> >stays optimal.
>
> Veritas did this, and then their architect regretted that nobody=20
> actually used that code and advised me not to do it.  You may have an=20
> advantage with open source though in that you can modify the important=20
> user space programs to use it.

I was more thinking along the lines of:
find /var/log -type f | xargs ioctl REISERFS_SLOW_GROWING

But I guess syslog or whatever is used would have to be modified
for it to happen automaticly on new files. My guess is that
syslog-maintainers would not take patches for features like this unless
it was done in a more generic way that could potentially be used by
other filesystems as well.=20


> We have some block preallocation code in V3 for files that are kept open =

> while being written to.  You can look at that code if you want.  You can =

> also write a plugin for v4 that does what you want.

Are you talking about the allocate on flush code? I'll check that out;
allthough at this point it is of course more interesting to write code
for reiserfs4 than v3 - in particular if the new improved infrastructure
makes it easier.

> While I will not take someone off another task to work on this, I will=20
> be open to patches from others.

As I wrote in my original mail I don't have time to really work on this
now, but maybe later.



--=20
Ragnar Kj=F8rstad
