From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiserfs with Samba vs NetApp Filer
Date: Sun, 13 Oct 2002 20:36:56 +0400
Message-ID: <3DA9A128.5000206@namesys.com>
References: <Pine.LNX.4.33L2.0210100853240.1670-100000@localhost.localdomain> <200210121052.22603.bofh@coker.com.au> <20021012150028.G14731@vestdata.no> <200210121600.39712.bofh@coker.com.au> <3DA89A37.2070801@namesys.com> <20021012222950.GK3045@clusterfs.com> <3DA8CAF5.7050203@namesys.com> <20021013063809.GL3045@clusterfs.com> <3DA97993.4090403@namesys.com> <20021013154645.GM3045@clusterfs.com> <20021013181003.D24037@vestdata.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11676-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Ragnar_Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Cc: Russell Coker <bofh@coker.com.au>, reiserfs-list@namesys.com

Ragnar Kj=F8rstad wrote:

>
>I think there the linux filesystems possible implement two very distinct
>features:
>- an (transactional?) object store (like the reiserfs tree)
>- and special objects; like directories, "inodes", EAs and so on
>
>I know that in some filesystems the distinction is not so clear (e.g. in
>ext2 where inodes have their specific place in the object-store).
>
>But my point is; would it not make sense to split up the filesystem-code
>(for the filesystems that would allow it) in the two parts mentioned
>above? Lustre is not alone in wanting a more low-level interface to the
>disk - I think this is very simular to the interface that squid uses, is
>it not?
>
>
>
> =20
>

I was about to suggest to Andreas that his implementation on top of=20
reiserfs is likely to be very inefficient unless he does something=20
similar to our squid for reiserfs code (sponsored by someone who didn't=20
continue sponsoring in the typical dotcom "more than nine months, no=20
investor wants to wait that long for a return, give me a shorter=20
timeline than that" fashion).

Andreas, very briefly, you want to find things in reiserfs by their=20
keys, and you have no need for any directory entries at all, and having=20
those directory entries will add substantial overhead.  Your metadata=20
manager can probably track references, and if so there is no need for=20
the FS to track it.

Unless you cut out directories you might even find that ext3 performs=20
better because you can do lookups by inodes efficiently, and we can only=20
do lookups by keys efficiently.

Hans

