From: "Fred -- Speed Up --" <speedup@free.fr>
Subject: Re: Reiser4 bitmap & replication handling
Date: Thu, 22 May 2003 18:14:53 +0200
Message-ID: <002f01c3207d$47b5bf40$b300a8c0@xpstation>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_002C_01C3208E.0A9074F0"
Return-path: <reiserfs-list-return-14206-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_NextPart_000_002C_01C3208E.0A9074F0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> well, his words are not quite that strong, and who knows if he is =
using
> the latest journaling patches but XFS is a very nice filesystem.....
You're speaking from Reiser 3.6 right ? Are these patches included in =
2.4.20
or 2.4.21 official kernel sources ?

> Well, Reiser4 has much fewer seeks than other filesystems usually.  =
The
> current weakness of Reiser4 is CPU consumption, but our team is =
cutting
> that down at great speed.  It seems like each team member manages to
> reduce it by >10% a week, and there are 3 of them working actively on
> that.  This is fortunate, because it is still very high.....  I have
> this fond hope that performance will be something very nice by
> LinuxTag.....;-)
I really hope so, performance is a big point for the Reiser filesystem =
;)
You say the CPU is now the weakness ... but how do you handle with large
file read/write operations : in this case, the HDD performance level =
should
come first ?
Great part of the Reiser4 team is working on performance tweaking : does
this mean that Reiser has come into the final stage, that it has now =
proven
stable so that performance improvement is the only thing to achieve =
before
RC and/or release ? Did you published a release plan, with public beta =
and
RC or do you want to test Reiser4 internally ? I know Reiser4 is =
available
as a 2.5 kernel patch, but do you plan to build a dedicated structure to
report bugs found in early Reiser4 versions ?

> what do you mean, replicate the tree?
I mean, for security pruposes, does Reiser4 maintain copies of the =
storage
tree or does it simply trust its marvelous journalising system ?

> bitmaps.;-) we have some nice little tweaks, like we count the number =
of
> used bits in every bitmap block so that we don't have to scan full
> blocks, and we hash around if we scan too much, but I have to say that
> bitmaps are nice and simple and work without a lot of code.
I wad afraid Reiser4 didn't had the best bitmap-handling system over =
there,
now I'm reassured thank you :-D

> >Are you implementing some special features for very large disks,
> how are they different
Maybe some really big files handling performance improvements, to near =
XFS
performance in this domain. I'm not really concerned, but some specific
systems may need such features only offered by XFS. Do you plan to =
release
different versions of the filesystem's plugins to adapt to different =
systems
ans situations ?

> Reiser4 inconsistently performs very very fast.  We have no doubt that
> we can make that consistent but it is a lot of measuring and tweaking
> and measuring and tweaking.....
Sorry but ... what do you mean by "unconsistently" ? Does this mean you =
only
consider avarage performance, ignoring worse cases ?
Again, do you plan to ask some external testers to tweak Reiser4 ?

> >I didn't remember, when do you plan to release Reiser4 ?
> >
> LinuxTag, July 11, if lucky, we will start our beta.
Outstanding ... I hope you'll be sucessfull, but I'm not really scary =
about
that ;)
Another question, do you want to release Reiser4 so that it will be
presented on LinuxTag because :
1- The developement team is mainly composed of german people
2- Suse will have a very big area on the show
3- The release date just accorded to the LinuxTag opening
4- All of you especially like LinuxTag :-D


Thank you Hans,

Fred
------=_NextPart_000_002C_01C3208E.0A9074F0--

