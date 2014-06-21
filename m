From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [RFC] [PATCHv5 0/4] reiser4: discard support: initial implementation, refactored.
Date: Sun, 22 Jun 2014 00:15:49 +0400
Message-ID: <3952503.LqrIi5tPUc@intelfx-laptop>
References: <1403296798-11742-1-git-send-email-intelfx100@gmail.com> <3309631.pk4ACE3OmJ@intelfx-laptop> <53A56A72.3050608@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1639982.0ApOC6s3L0"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=T5rPQ8PL6mHMoL0CdcTOrc/j7PNhUgiTPtR75AHBP6o=;
        b=utcaPOlrJ9HIrq2EXhIEDOb+icr2hxDrgaFI6xWK4v2Yb3/GpyHjxzJ9bw9xKxZXMt
         ftdf6FBq9VBirqBlAUBO91wNK9bxuOSSncnk3z/UoWs+qyr5oPXoQ9xpbWX+zHns/5gr
         +LWCkklaL2g6MTYjzvabnSB0sTND4TFbhQtXsTviFLyFSIRAlIFuCZs87MbWEiapQVeG
         qoSvzCxGEFHYduCEM8O2vVXgrSxvqse6guADpKcpWWlXvvpZdrEebt3p8syU4OR3P3kc
         nI2Sx3HEmmjJfNBQRVxNpx2rSYWxR6ZgCijM4a2cnqLcnnFJu2oAzxyhCdtOE5/m8HQO
         Vieg==
In-Reply-To: <53A56A72.3050608@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>


--nextPart1639982.0ApOC6s3L0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Saturday 21 June 2014 at 13:20:18, Edward Shishkin wrote:=09
> On 06/21/2014 12:35 AM, Ivan Shapovalov wrote:
> > [...]
> > Also I would like if this code could be given a review. :)
>=20
> Great! Looks nice for me, thanks!
> There are 2 issues, though...
>=20
> 1) kmalloc/kfree a huge number of 32-byte chunks (blocknr_list entrie=
s) is
> suboptimal. There is a special low-level memory allocator for such pu=
rposes.
> Take a look how we initialize so-called "slab cache" for jnodes=20
> (_jnode_slab),
> atoms (_atom_slab), etc, and allocate memory for them (kmem_cache_all=
oc()).
>=20
> 2) A lot of blocknr_list entries are allocated at flush time, when th=
e=20
> high-level
> allocator (txmod.c) makes "relocation decisions" (especially when txm=
od=3Dwa).
> The problem is that the flush (with the following commit) usually is =
the=20
> file system
> response to memory pressure notifications, when additional memory all=
ocation
> is not desirable.
>=20
> I think that with the fixed (1) we'll include the discard support (if=
=20
> everything will
> be OK in the next 1-2 weeks).
>=20
> As to (2): that is a common problem of all Linux subsystems which wan=
t=20
> memory
> to free memory. It is unresolvable, however, we can improve the=20
> situation. It
> would be nice to implement a per-atom pool of memory (as a list of=20=

> kmalloc-ed
> buffers with "cursors") with an optional possibility to pre-allocate =
1-2=20
> such buffers
> at atom initialization time. But this is for the future...
>=20
> I don't see other urgent improvements. Yes, overall scalability of=20=

> rb-trees is better,
> as we found, however, merging rb-trees is more expensive, plus atom's=
 fusion
> is not a background process, so it can lead to performance drop. Ther=
e are
> rb-trees with fingers, however I haven't seen their implementation on=
 C=20
> language
> (it can be not so simple).
>=20
> Thanks!
> Edward.
>=20

Thanks for the review!

(1) surely seems trivial. Do we need something similar for blocknr_set =
as well?

For (2) I don't quite understand you. How such a pool should be organiz=
ed?

Do you mean `blocknr_list_entry **pool` of size N * sizeof(void*) fille=
d with
kmem_cache_alloc()'d pointers, or just `blocknr_list_entry *pool` of si=
ze
N * sizeof(blocknr_list_entry)?

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart1639982.0ApOC6s3L0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlOl5/wACgkQxUKljSIMAnDtpAEApVycJ45i3moPjAF/OzF1JB8g
R/0O1n+QoIzaqNStjGQBAKYz/X4O8jR2ORFbai8I6LwOxdJgQvFBQO7JlE0tLLtF
=3KPW
-----END PGP SIGNATURE-----

--nextPart1639982.0ApOC6s3L0--

