From: michael chang <thenewme91@gmail.com>
Subject: Re: journal size reiserfs vs reiser4
Date: Sat, 3 Sep 2005 21:04:28 -0400
Message-ID: <b14e81f005090318046ee67d7e@mail.gmail.com>
References: <4317FD1B.504@namesys.com>
	 <Pine.GSO.4.44L.0509021620380.23379-100000@unix2.cc.ksu.edu>
Reply-To: thenewme91@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25849-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.GSO.4.44L.0509021620380.23379-100000@unix2.cc.ksu.edu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Stegman <matts@ksu.edu>
Cc: reiserfs-list@namesys.com

On 9/2/05, Matt Stegman <matts@ksu.edu> wrote:
> As far as repacking goes, I believe xfs_fsr refuses to defrag files if to=
o
> little space is free.  If it's too hard to program a repacker to operate
> efficiently with only a few megabytes free, simply program it to exit wit=
h
> error when less than 5% disk is free.

I'd rather leave the repacker running inefficiently if it'll mean
it'll run more efficiently in the future.  [I believe Windows 9x's
repacker could get away with having just one free cluster if
necessary, although it'd have been painfully slow.]  Sometimes, I
can't clear off files unless I archive them, but they won't archive
unless they read fast enough (and fragmentation slows them down just
enough so they won't read fast enough - due to weird time constaints
that are built into the program that shouldn't be there).

It's possible to defragment tons of really small files with less than
5%, and that number changes with the size of the HD (you can't use an
arbirtrary number like 15%, like Windows XP, because that varies
heavily -- even if you had 50% free, if there were no two continous
free clusters, you couldn't defragment with the defragmenter in XP --
I don't want this kind of behaviour as the only way to do repack
things in case I end up in a weird spot.)

That said, I'd be half-satisfied if a repacker is released months or
years earlier because it doesn't efficiently handle weird cases (so
long as it remembers to try and repack free space too).  As for the 5%
error; a warning is safer.  Either that, or put in a force option to
get around the "error".

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
