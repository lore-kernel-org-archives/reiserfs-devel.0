From: Quinn Harris <lists@qutek.net>
Subject: Re: Relocating files for faster boot/start-up on reiser(fs/4)
Date: Thu, 14 Sep 2006 16:09:04 -0600
Message-ID: <200609141609.06713.lists@qutek.net>
References: <200609131451.42474.lists@qutek.net> <200609132110.45703.lists@qutek.net> <4509B3CD.3010903@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29891-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4509B3CD.3010903@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thursday 14 September 2006 13:55, David Masover wrote:
> Quinn Harris wrote:
> > The boot optimization was over 3885 files.  Ideally those files would be
> > ordered head to tail in a sequence that perfectly matches the order they
> > will be read.
> >
> > I bring this up here because I expect with reiser4, a repacker, and this
>
> Now that you mention it, do you have a control of some sort to prove
> this isn't just fragmentation?  That is, copy the files you're messing
> with in some random order (that should make booting slower), and
> benchmark that?

That is a good point.  Recording the disk layout before and after to compar=
e=20
relative fragmentation would be a good idea.  As well as randomizing the=20
sequence as a sanity check.

Also note that during boot I was using readahead on all 3885 files.  So the=
=20
kernel has a good opportunity to rearrange the reads.  And the read sequenc=
e=20
doesn't necessary match the order its needed (though I tried to get that).

=46rom what I have done, it would be unreasonable to say anything other tha=
n,=20
this has a good change of working.  I really think this should work in=20
theory.  That's why I tried it in the first place and required relatively=20
little data to convince myself I am not smoking crack.

A simple test with reiser4 suggests that it will pack the files right up ne=
xt=20
to each other in the specified sequence.  Take a look at the section "If It=
=20
Is In RAM, Dirty, and Contiguous, Then Squeeze It ALL Together Just Before=
=20
Writing" on www.namesys.com.

I will redo this on a fresh reiser4 filesystem to reduce initial fragmentat=
ion=20
and run some test to eliminate reasonable confounds.
=20

>
> I'm guessing a repacker would speed things up much more than this,
> although this is interesting and helpful for systems which need to be
> rebooted often.  (I'd prefer a working suspend2...)
This idea complements a repacker.  The core idea is to cause the fs to orde=
r=20
files based on recorded access patterns that will likely happen again=20
(instead of just the location in the directory tree).  A repacker would=20
ensure files are placed in the exact order back to back as we expect them t=
o=20
be accessed.  File system fragmentation will substantially inhibit this fro=
m=20
happening.  That said, this is causing a basic form of repacking.=20

Yeah a good suspend will probably result in faster boot no matter how many=
=20
tricks you use to improve normal boot, but this could also improve cold loa=
d=20
times for apps like Open Office and Firefox.  In addition suspend drops the=
=20
disk cache.  Profiling access patterns on resuming from suspend then=20
relocating based on that might improve restore times.

Any time file access is very predictable, and doesn't closely follow the=20
default key assignment order, this could be improve performance.
