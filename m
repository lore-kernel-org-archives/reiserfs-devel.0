From: Eric <eric225125@yahoo.com>
Subject: Re: Long writebacks with Reiser4 causing system to be unresponisive.
Date: Wed, 24 Jun 2009 16:04:37 +0000 (UTC)
Message-ID: <loom.20090624T155545-956@post.gmane.org>
References: <loom.20090624T033330-133@post.gmane.org> <a08621850906240128t2b8caafbx3e6b97eef314da5d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-devel@vger.kernel.org

Dushan Tcholich <dusanc <at> gmail.com> writes:

>=20
> On Wed, Jun 24, 2009 at 5:53 AM, Eric<eric225125 <at> yahoo.com> wrot=
e:
> > I have been having problems for the past few months where when I'm
> > doing moderately disk intensive activities (such as downloading a g=
it tree,
> > using a virtual machine), I will get 1-2min periods where basically=
 nothing
> > can access the disk.
> >
> > By watching /proc/meminfo, I can see my dirty memory gradually grow=
ing
> > during these disk intensive activities until it gets very
> > large (several 100MB), then my system will be unresponsive until it=
 all
> > goes through writeback. =C2=A0This same behavior can be reproduced =
by manually
> > running "sync" when the dirty memory is fairly large.
> >
> > Has anyone else experienced these problems? I noticed that some maj=
or
> > changes were made to how Reiser4 uses dirty memory
> > (http://lkml.org/lkml/2009/2/13/106). =C2=A0I believe I started see=
ing
> > this problem around that time. Could that have caused it?
> >
>=20
> Similar simptoms were noticed a year or so ago, but when using atime.
> Can you reproduce it if you mount your partition with noatime?
> Can you make some way to reliably reproduce it?
>=20
> > (Sorry for my vague and probably inaccurate description of the prob=
lem;
> > I know very little about virtual memory and file systems).
> >
> Welcome to the club :)
>=20
> Thanks
>=20
> Dushan
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel" in
> the body of a message to majordomo <at> vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20


My partition is already mounted with noatime.  I also forgot to mention
that I have LZO compression enabled, could that be a problem?

As far as reproducing this problem, I am currently opening a Windows gu=
est
in Virtualbox, loading Rosetta Stone software, and paging through about=
 5
pages of a lesson.  The dirty memory would have now approached 50MB.  B=
y
running "sync" to force writeback, the system will become unresponsive
for about 30-60 seconds.

Is there a way to manually create dirty memory that needs to be written=
 back?
That would be a better way to reproduce.

Eric

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
