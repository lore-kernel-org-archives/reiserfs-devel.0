From: Ragnar =?iso-8859-15?Q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Subject: Re: reiserfs vs NTFS vs WAFL
Date: Thu, 22 May 2003 19:07:24 +0200
Message-ID: <20030522170723.GH7706@vestdata.no>
References: <3ECBC1DF.3060607@namesys.com> <003b01c32070$052d59b0$0101a8c0@bummer>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14207-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <003b01c32070$052d59b0$0101a8c0@bummer>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: darren <teodarren@myrealbox.com>
Cc: 'Hans Reiser' <reiser@namesys.com>, 'reiserfs' <reiserfs-list@namesys.com>, 'Mike Jadon' <mikej@umem.com>

On Thu, May 22, 2003 at 10:39:56PM +0800, darren wrote:
> Hi all,
>=20
> Thanx for replying to my mail.
>=20
> I am doing some tests on this three FS now (to see if we would want to
> spend $$$$$ on a netapp).

Be sure to post whatever you find here. I'm sure I'm not the only
curious one.

> My test is based on the simultaneous creation and deletion of small
> files 50Kb, as per my actual usage of the file server for my application
> servers.

There is a small frontend-script to bonnie++ available at
http://www.stud.ntnu.no/~ragnarkj/download/dbonnie++/dbonnie++.py if
you're interested.

It aims to assist in running bonnie++ at multiple clients at once.

It's very old, so it may or may not work with recent versions of
bonnie++.

Alternatively SPEC sfs is probably a good way to test NFS-performance
(but it costs $$).

> My main problem with using Linux/Reiserfs3 is with the performance of
> Samba when under heavy load. CIFS operation is required as some of our
> application servers are windows based. Netapp's CIFS performance is
> really incredible.

That is realy surprising.=20
Samba is just another userspace application. I can't see how reiserfs
could perform worse with samba than with other applications?=20

Did you test other filesystems as well? e.g. xfs?

It would be really interesting to know more about what the problem is.=20


> With NFS, we can sometimes beat the netapp F87 with a
> Linux/ReiserFs/RAID0 config with the same number of harddisk.

I take it that means it's slower with RAID5?
Even so, you can probably get a linux-system with RAID10 (and twice the
number of disks) for the price of a netapp...

> Will post more details when I thru with it.
Please do.

> In the mean time, will really appreciate any suggestions to improving
> Samba's performance in order to make a CIFS file server based on
> Linux/Reiser/Samba possible.

There are some generic samba-tuning information available at:
http://hr.uoregon.edu/davidrl/samba/samba-optimize.html


I would also suggest trying to figgure out exactly what it is that is
slow with samba on reiserfs. Are there specific operations that are very
expensive? Is the server network-, cpu- or disk-bound?
Things like that.



--=20
Ragnar Kj=F8rstad
Zet.no
