From: Russell Coker <bofh@coker.com.au>
Subject: Re: Reiserfs with Samba vs NetApp Filer
Date: Sat, 12 Oct 2002 16:00:39 +0200
Message-ID: <200210121600.39712.bofh@coker.com.au>
References: <Pine.LNX.4.33L2.0210100853240.1670-100000@localhost.localdomain> <200210121052.22603.bofh@coker.com.au> <20021012150028.G14731@vestdata.no>
Reply-To: Russell Coker <bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11661-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021012150028.G14731@vestdata.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ragnar =?iso-8859-1?q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

On Sat, 12 Oct 2002 15:00, Ragnar Kj=F8rstad wrote:
> > I think that's about to change (if it hasn't already).  3ware sells RAID
> > controllers that do 8 or 12 drives.  200G ATA drives are now on sale, a=
nd
> > 320G drives will be available soon.
> >
> > 12 * 320G should solve the disk space issue for most people...
>
> The disk-space / cabeling-issue is mostly an IDE-problem anyway. If you
> go SCSI/FC there is practically no limit on how much storage you can put
> on a single server. (performance-issues aside)
>
> Sure, IDE is less expensive, but when comparing to NetApp there is
> plenty of room to go for SCSI/FC - so diskspace should defenitively not
> be an argument for going for NetApp.

Actually the problem then becomes case space.  On the linux IDE arrays list=
=20
there are a few people having 2 or more 3ware cards, they have 16 or more I=
DE=20
drives in a system.  With 24 inch cables they can get by with regular IDE=20
cabling (and S-ATA will solve this properly soon).  3ware cards allow suppo=
rt=20
for enough disks.  The problem then becomes what to house the disks in and =

how to supply enough power.

Here's the URL for subscribing to the IDE arrays list, I think that many=20
people here will be interested (Ragnar - you might want to make 3ware not b=
e=20
the only IDE RAID hardware that's supported on the list).
http://lists.math.uh.edu/cgi-bin/mj_wwwusr

--=20
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page

