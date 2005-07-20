From: Ragnar =?iso-8859-15?Q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Subject: Re: Fastest way to "find / -mtime +7".....
Date: Wed, 20 Jul 2005 22:44:51 +0200
Message-ID: <20050720204451.GT1508@vestdata.no>
References: <FD5AA849-D432-4881-B70F-E71369520749@surfcity.net> <1121798933.15596.13.camel@localhost> <20050719200902.GM1508@vestdata.no> <1121810424.15596.19.camel@localhost> <20050720162644.GC6704@schatzie.adilger.int>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25216-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20050720162644.GC6704@schatzie.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jonathan Briggs <jbriggs@esoft.com>, Ed Walker <ewalker@surfcity.net>, reiserfs-list@namesys.com

On Wed, Jul 20, 2005 at 12:26:44PM -0400, Andreas Dilger wrote:
> On Jul 19, 2005  16:00 -0600, Jonathan Briggs wrote:
> > How about some kind of stat-data readahead logic?  If the first two or
> > three directory entries are stat'd, queue up the rest (or next
> > hundred/thousand) of them.  If the disk queue is given the whole pile of
> > stat requests at once instead of one at a time, it should be able to
> > sort them into a reasonable order.
> >=20
> > This might even be a VFS thing to do instead of per-FS.
>=20
> This is something I would be very interested in.  Having a pipeline of
> stats generated when an app does readdir + in-order stat would help
> reduce latency a great deal for network filesystems.

What about just adding an asyncron stat to aio ?



--=20
Ragnar Kj=F8rstad
Software Engineer
Scali - http://www.scali.com
Scaling the Linux Datacenter
