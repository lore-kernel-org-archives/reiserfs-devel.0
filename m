From: Kurt <kpalmer@advance.net>
Subject: Re: Filesystem Corruption
Date: Tue, 11 Jun 2002 12:49:48 -0400
Message-ID: <200206111249.48229.kpalmer@advance.net>
References: <200206061400.01445.kpalmer@advance.net> <20020607111539.B12869@namesys.com>
Reply-To: kpalmer@advance.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10717-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020607111539.B12869@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Thanks Oleg,
=09=09sorry for the late response (i was out of the office) , you may fin=
d the=20
following information on the last crash useful :-
+++++++++++++++
3 04:32:37 devo kernel: vs-13075: reiserfs_read_inode2: dead inode read f=
rom=20
disk [854 1695654 0x0 SD]. This is likely to be race with knfsd. Ignore
Jun  3 04:32:39 devo kernel: vs-13060: reiserfs_update_sd: stat data of o=
bject=20
[854 1695654 0x0 SD] (nlink =3D=3D 1) not found (pos 1)
Jun  3 04:41:38 devo kernel: vs-13060: reiserfs_update_sd: stat data of o=
bject=20
[854 1695654 0x0 SD] (nlink =3D=3D 1) not found (pos 1)
Jun  3 04:41:43 devo kernel: vs-13060: reiserfs_update_sd: stat data of o=
bject=20
[854 1695654 0x0 SD] (nlink =3D=3D 1) not found (pos 1)
++++++++++++
I will upgrade the kernel and reiserfs tools this week and inform you of =
the=20
result after a fsck.
-Kurt

On Friday 07 June 2002 3:15 am, Oleg Drokin wrote:
> Hello!
>
> On Thu, Jun 06, 2002 at 02:00:01PM -0400, Kurt wrote:
> > error stating the file pointed to nowhere.
> > I was unable to complete a reiserfsck --fix-fixable because of the le=
ngth
> > of time that this (fsck) process took since this was an unscheduled
> > downtime. During the weekend i will attempt to do the fsck again, how=
ever
> > i really needed to know if this problem has been observed by anyone e=
lse,
> > and what steps they took to fix the problem.
>
> We recommend you to upgrade your kernel to 2.4.18.
> To know what exact problem is it would be very useful if you'd posted
> excerpts from kernel logs with actual errors.
> Thank you.
>
> Bye,
>     Oleg

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Kurt Palmer                                      SysAdmin
kpalmer@advance.net                Advance Internet
201-459-2846

