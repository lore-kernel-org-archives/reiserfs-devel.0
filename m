From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: NFS setup for a reiserfs-based /home
Date: Wed, 25 Sep 2002 15:33:19 +0200
Message-ID: <200209251533.19567.Dieter.Nuetzel@hamburg.de>
References: <20020924215756.GA24963@jerry.marcet.dyndns.org> <20020925114009.B23339@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11531-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020925114009.B23339@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Oleg Drokin <green@namesys.com>, Javier Marcet <jmarcet@pobox.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Am Mittwoch, 25. September 2002 09:40 schrieb Oleg Drokin:
> Hello!
>
> On Tue, Sep 24, 2002 at 11:57:56PM +0200, Javier Marcet wrote:
> > As I said, I'm a newbie on NFS, and I've been reading quite a lot abo=
ut
> > the interactions of it with journalling file systems. Namely, last th=
ing
> > I remeber is I should put the journal on a different volume, if at al=
l
>
> No, this is not required for NFS (And never was).
> There is nothing special about running NFS off reiserfs (v3.6 on-disk
> format) filesystems. (in case of kernel nfsd, there are some difficulti=
es
> with userspace nfsd, so it should be avoided).

Excuse me but this is not clear for me.
Oleg, you told him to avoid knfsd?
Then I have to say fix what ever is needed.
Knfsd is so much superior.

> > That's my question then. What do you suggest me to get the most out o=
f
> > reiserfs (with which I'm really happy) for a server storing /home.
> > Even if at the beginning it'll be small (only a few students), it'll
> > most probably will be deployed campus-wide later on, hence I'd much
> > prefer to set it up in a scalable way - storage space and speed-wise =
-
> > from day one.
>
> You may want to put your /home volume on some kind of RAID1 device to
> increase data safeness from hardware errors and to increase access (rea=
d)
> speed. (but this is storage space ineffective of course).

I'll suggest RAID5 (4 or more disks plus 1 or more spare) for all your=20
storage.

Regards,
=09Dieter

--=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel at hamburg.de (replace at with @)

