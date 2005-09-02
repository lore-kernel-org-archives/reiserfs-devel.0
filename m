From: michael chang <thenewme91@gmail.com>
Subject: Re: journal size reiserfs vs reiser4
Date: Fri, 2 Sep 2005 12:02:54 -0400
Message-ID: <b14e81f0050902090228035726@mail.gmail.com>
References: <20050901134604.31ddd297@SiRiUS.home>
	 <4316F9CC.2090904@namesys.com> <20050901150507.3d6f53c7@SiRiUS.home>
	 <4316FD28.5020304@redhat.com> <43171D57.3030007@namesys.com>
	 <431726F2.1090508@redhat.com>
	 <b14e81f005090119283406eafa@mail.gmail.com>
	 <4317F28F.80704@namesys.com> <4317FD1B.504@namesys.com>
	 <op.swgsv3zxth1vuj@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25825-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <op.swgsv3zxth1vuj@localhost>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: PFC <lists@boutiquenumerique.com>
Cc: reiserfs-list@namesys.com

On 9/2/05, PFC <lists@boutiquenumerique.com> wrote:
>=20
> > It could probably be a lot less than 5%, 2% is more than enough I would
> > guess, but we also need to reserve space to get good performance.

Maybe 2% would be necessary for the delete operations -- the rest is
to prevent fragmentation (like I said) and various other tidbits.=20
Simply, if df reports more than 85% full, generally people believe
that performance will go down (that space is unused, regardless).=20
It'd be interesting for an optimized read-write fileystem with
repacker (not necessarily online) that still has excellent performance
even at 95-97% full.

>         I'm more than happy to lose 3 GB on my 60 gb /  5400 rpm crap lap=
top
> drive and have reiser4 transform it into something that feels more like a
> big f*king raptor. Everytime I boot into Windows I feel the burning pain
> of this crap drive combined with the cancer of NTFS. Uh-oh this file take=
s

Try emptying your prefetch, and see if that helps... defragmentation
won't work unless you have enough contiguous space for all of your
fragmented files.  Totally unlikely.  And Windows takes *forever* to
repack free space, and even then it doesn't do so solidly (if you have
barely enough space to defragment e.g. one file).

> long to load OH CRAP it's fragmented in 20000 bits (my personal record !)=
.
> Gee. Gotta. Defrag. Again.

I've defragmented for 24-48 hours straight (repetated cycles) in
proprietary and built-in defragmenters -- and still it wouldn't
defragment even one or two of my largest, and most fragmented files (I
believe it's about 275 MB video file in 30000-40000 pieces).  Still'd
love to boot Windows off a Reiser4 partition...

>         Note that on your average Linux system with a zillion of small fi=
les the
> efficient reiser4 packing will save a lot of space.

Yes.

>         Un-tar the freedb database on a NTFS (or EXT3) partition and witn=
ess how
> your machine dies, then stop complaining about reiser4 eating 5% of your
> space dammit.

As soon as I can install root reiser4 and get repacker/resizer -- I'm
patient though. ^^

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
