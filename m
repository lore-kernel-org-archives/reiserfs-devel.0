From: Sam Vilain <sam@vilain.net>
Subject: Re: reiserfsck --blame-it-on-the-hardware-yeah-yeah
Date: Tue, 11 Feb 2003 15:53:48 +1300
Sender: Sam Vilain <sv@horo.vilain.net>
Message-ID: <200302111553.48409.sam@vilain.net>
References: <20030208005057.GA1059@horo.vilain.net> <200302110525.06890.sam@vilain.net> <20030210161132.A15924@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12682-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030210161132.A15924@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com, vitaly@namesys.com

On Tue, 11 Feb 2003 02:11, Oleg Drokin wrote:
> > You need to do one, preferably both of the following:
> >   a) allow reiserfsck to ignore the in-partition journal, without
> > producing an insane result (where the filesystem header says there is
> > a journal, but the space where the journal is has filesystem data in
> > it).
>
> This cannot happen in any sane way. (I mean root block just cannot live
> in journal).

Yes.  That's what happened when reiserfsck ran with the simple hack I=20
detailed.  Granted, that violated a sanity condition of your code, with=20
insane results.  GIGO.

I don't care how - there just needs to be some easy way to clear or ignor=
e=20
a corrupted journal.  With that junk in there and no `Oh, that's simple,=20
just dd /dev/zero to ...' instructions on clearing the journal, I had no=20
other option but to try a hack.

If you were to consider the --no-journal-available flag to mean=20
--ignore-journal-contents when running with a Journal Inside(tm)=20
filesystem, then presumably you would add corresponding changes to the=20
code to make sure you don't end up trying to put superblocks in journal=20
space.

While we're on the subject of reiserfs bugs, simply running `cddump' on m=
y=20
system created bogus directory entries I couldn't remove (on vanilla=20
2.4.20).  It's just doing a (selective) `cp -al' and subsequently removin=
g=20
the structures, for 650MB of a filesystem at a time.  This was enough to=20
trigger those race conditions, possibly the same as first reported by Zyg=
o=20
Blaxell - did you get anywhere with those?
--=20
Sam Vilain, sam@vilain.net

But I also made it clear to (Vladimir Putin) that it's important to
think beyond the old days of when we had the concept that if we blew
each other up, the world would be safe.
 - George W. Bush, May 1, 2001
