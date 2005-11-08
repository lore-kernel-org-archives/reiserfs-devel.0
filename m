From: Peter van Hardenberg <pvh@uvic.ca>
Subject: Re: Plugin authoring.
Date: Tue, 08 Nov 2005 03:00:24 -0800
Message-ID: <200511080300.24424.pvh@uvic.ca>
References: <200511050017.20410.pvh@uvic.ca> <436EFABA.6070408@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26807-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <436EFABA.6070408@namesys.com>
Content-disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I'm keeping this on-list in the hope that a record of it may be of value to=
=20
other future "weekend-warriors" on how we approached this problem.

On November 6, 2005 10:56 pm, Hans Reiser wrote:
> Peter van Hardenberg wrote:
> Just start reading the regular unix file and directory plugins, and
> compose a long email with questions about how they work.
>

Well, here we go!

Today we spent a few hours poring over dir.c and file.c as Hans recommended=
=20
and branched out as we went.=20

Some things were unexpected, header files contained some complete inlined=20
methods, and the almost no documentation (it is all in the .c files.)

Lots and lots of layers of indirection taking place. The dir.c and file.c a=
re=20
almost all irrelevant to our current pursuit which is understanding how to=
=20
actually write a plugin, and therefore how the plugins system actually work=
s.=20
Eventually Nathan found the clues that led us to success in file_ops.c --=20
there actual VFS calls get converted to reiser calls!

=46rom there, we tracked down the reiser4_inode extensions and the clever u=
se of=20
reiser4_inode_data() to essentially cast back and forth between the structs.

Of course, inode.h was similarly enlightening, but worrying to me is the fa=
ct=20
that plugins like crypt and pseudo contain fields in all reiser4_inodes. Th=
is=20
means that a plugin's code is not encapsulated strictly within the plugin=20
itself. I will probably do some grepping hunts tomorrow to see how many fil=
es=20
a plugin like pseudo actually has to worm its way into.

None of us are experienced with plain old VFS (except our supervisor, Yvonn=
e,=20
who has kept us on course so far). It was our hope that we needn't learn VF=
S=20
in complete detail, but it seems now that before we can really understand t=
he=20
Reiser code well enough to write plugins we will need to read some less=20
complex examples of Linux filesystems. "du -sh fs/*" suggests that BFS and=
=20
Coda should be simple enough to absorb the principles of in a single sittin=
g.

It would help if within Reiser4 code more roadmaps were given -- we found a=
=20
backtrace in a comment somewhere which was most illuminating. Personally, I=
=20
was rather puzzled within file.c about what tails, hints and extents are. I=
=20
was working from paper printouts without Google handy but certain knowledge=
=20
definitely seems expected, and I have not found a reliable method for=20
differentiating Reiser-specific terminology from the more generic.

=46rom a legibility point of view it would be nice if all the method signat=
ures=20
were found in headers instead of only public methods in file.h and private=
=20
ones throughout the file itself. To preserve the "public" "private"=20
distinction, perhaps a second header file would be appropriate? I am only=20
thinking out loud here.=20

All in all, project progress is good. We have figured out (roughly) how cal=
ls=20
from VFS are translated into Reiser4 calls and then into plugin calls via a=
=20
lookup on the pluginid in the inode. I am still looking for some kind of=20
structure in the plugin.c code itself which mediates the translation from a=
=20
pluginid to an actual table of methods, and how the plugin itself announces=
=20
those associations. Is there a table? A naming convention? Something=20
promising was in there, but it is now three in the morning and my memory is=
=20
fading slightly.

More tomorrow (today in most time zones),
=2Dpvh

=2D-=20
Peter van Hardenberg (pvh@pvh.ca)
Victoria, BC, Canada
