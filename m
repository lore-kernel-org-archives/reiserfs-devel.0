From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [RFC] [PATCHv5 0/4] reiser4: discard support: initial implementation, refactored.
Date: Sun, 22 Jun 2014 04:17:51 +0400
Message-ID: <1505369.IvJt0fPL9H@intelfx-laptop>
References: <1403296798-11742-1-git-send-email-intelfx100@gmail.com> <53A56A72.3050608@gmail.com> <3952503.LqrIi5tPUc@intelfx-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1453144.SnY7CK01NA"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=4QzrdO2DFhtwgVpY8APH8aae545VgVwuTQQ4d3R0w2g=;
        b=KyfXQpAghoZwogyBhgXKM9DI7ancFXNoQhXwbDQ6QNRgmD/0ksccNaJIvey88MlInz
         Mx9q/PwSVAxkCj38Z0AZlMgJDVWNurSohpihR8HSFhEC5s+tDC+LWMLYAKYHX16j0FdE
         G94dkAPP6cJfrQOJqJjdvXxAu8nx6lWvHGYGPovu7+ebeKZMFaQXjLleopgfGVS3LgvT
         ok9ySfZzNQNthXtgtyqZ94uqUjeWjfPEwLq+I/9wuBUM7uzij91FCnqblD5zj2IEH9Za
         8QwFwJiQ+pSXhf9hgQ2+4vPp/RJVXMjXJeTzjnDItunV8v1DxYysyhjmmyXIs7kQbhSq
         GghQ==
In-Reply-To: <3952503.LqrIi5tPUc@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>


--nextPart1453144.SnY7CK01NA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Sunday 22 June 2014 at 00:15:49, Ivan Shapovalov wrote:=09
> On Saturday 21 June 2014 at 13:20:18, Edward Shishkin wrote:=09
> > On 06/21/2014 12:35 AM, Ivan Shapovalov wrote:
> > > [...]
> > > Also I would like if this code could be given a review. :)
> >=20
> > Great! Looks nice for me, thanks!
> > There are 2 issues, though...
> >=20
> > 1) kmalloc/kfree a huge number of 32-byte chunks (blocknr_list entr=
ies) is
> > suboptimal. There is a special low-level memory allocator for such =
purposes.
> > Take a look how we initialize so-called "slab cache" for jnodes=20
> > (_jnode_slab),
> > atoms (_atom_slab), etc, and allocate memory for them (kmem_cache_a=
lloc()).
> >=20
> > 2) A lot of blocknr_list entries are allocated at flush time, when =
the=20
> > high-level
> > allocator (txmod.c) makes "relocation decisions" (especially when t=
xmod=3Dwa).
> > The problem is that the flush (with the following commit) usually i=
s the=20
> > file system
> > response to memory pressure notifications, when additional memory a=
llocation
> > is not desirable.
> >=20
> > I think that with the fixed (1) we'll include the discard support (=
if=20
> > everything will
> > be OK in the next 1-2 weeks).
> >=20
> > As to (2): that is a common problem of all Linux subsystems which w=
ant=20
> > memory
> > to free memory. It is unresolvable, however, we can improve the=20
> > situation. It
> > would be nice to implement a per-atom pool of memory (as a list of=20=

> > kmalloc-ed
> > buffers with "cursors") with an optional possibility to pre-allocat=
e 1-2=20
> > such buffers
> > at atom initialization time. But this is for the future...
> >=20
> > I don't see other urgent improvements. Yes, overall scalability of=20=

> > rb-trees is better,
> > as we found, however, merging rb-trees is more expensive, plus atom=
's fusion
> > is not a background process, so it can lead to performance drop. Th=
ere are
> > rb-trees with fingers, however I haven't seen their implementation =
on C=20
> > language
> > (it can be not so simple).
> >=20
> > Thanks!
> > Edward.
> >=20
>=20
> Thanks for the review!
>=20
> (1) surely seems trivial. Do we need something similar for blocknr_se=
t as well?

...I suppose yes, because there is at least one blocknr_set_entry per e=
ach txn_atom,
while the latter is already allocated with slab allocator).

=2D-=20
Ivan Shapovalov / intelfx /

>=20
> For (2) I don't quite understand you. How such a pool should be organ=
ized?
>=20
> Do you mean `blocknr_list_entry **pool` of size N * sizeof(void*) fil=
led with
> kmem_cache_alloc()'d pointers, or just `blocknr_list_entry *pool` of =
size
> N * sizeof(blocknr_list_entry)?
>=20
> 
--nextPart1453144.SnY7CK01NA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlOmILUACgkQxUKljSIMAnCFqwD/VAhx7MrGAmIXRD11lHuSSqe9
n7AWVIk2vBpXezxdKWoA/04/STmQ5VrqlEKV3Seqx30yIGdJGGFDC05o5MQ3slkn
=AGgs
-----END PGP SIGNATURE-----

--nextPart1453144.SnY7CK01NA--

