From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCHv2 0/3] reiser4: discard support: perform discard before all deallocations.
Date: Tue, 29 Jul 2014 13:29:40 +0400
Message-ID: <6214930.f2LU7SrKWL@intelfx-laptop>
References: <1405966771-12575-1-git-send-email-intelfx100@gmail.com> <53D637F9.2010304@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1659676.f2m1V7qP3m"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=O0AcAfOqnb9szU9TSnh/FlKG4PbLCJlPbNsEQCvBHck=;
        b=KWmLNJy1nfok6rImsFSOJ9tBrWa3gpuzQ8IUbtyOT2IvcShY0N4g4JO9HfxKj1oRIV
         bkPheR5TcDVXfh1dRfSTMJxs8MkTY9i7aESrIZocAJiA/pDWrDSkoBaMzFh4aWsWT9Zy
         L0b7DREeE69S06KVlxis79/G+io0So186rb0080PiHZkgfbyNDLop/iDkvSlMPgzxqPC
         w4x0ovAxWYXjE/53bSvsdW7W42O/V3JvdM82NVeZ6nqlv8sKt6qy2kjlTlvABTCNTYdf
         D8rZcumFH4Sj4qX1GML4NsOjfgBCRlOIMDJ4biD8dbcZAHycJpP7jY7sNdik2qE9hSZF
         SBEw==
In-Reply-To: <53D637F9.2010304@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>


--nextPart1659676.f2m1V7qP3m
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Monday 28 July 2014 at 13:46:01, Edward Shishkin wrote:=09
> Thanks, looks OK (I haven't tested it yet though..)
>=20
> I suggest to release a version without garbage collection for now
> (just pass the sorted and merged extents to blkdev_issue_discard).

Yeah, seems reasonable.
I'll submit v7 of "initial implementation" shortly with simplified disc=
ard_extent(),
then we could apply two patchsets and that'll be it.

=2D---
Regarding the "ideal" solution
=2D---

It seems that reiser4_alloc_blocks() can't be told to "allocate this ex=
act
count of blocks or fail". It allocates any number of blocks from 1 to n=
eeded,
and actual count is returned in *len.

Is it better to add an "exact" flag to reiser4_blocknr_hint or to add a=
n
"allocate" flag to reiser4_check_blocks()?

=2D-=20
Ivan Shapovalov / intelfx /

>=20
> Thanks,
> Edward.
>=20
> On 07/21/2014 08:19 PM, Ivan Shapovalov wrote:
> > This applies on top of PATCHv6 of "initial implementation".
> > The first patch has been already sent some time ago, but I've inclu=
ded it
> > here for sake of clarity.
> >
> > v2: fix disk space leak in error path, fix comments and commit mess=
ages, etc.
> >
> > Ivan Shapovalov (3):
> >    reiser4: fix reiser4_post_{commit,write_back}_hook() and their i=
nvocations.
> >    reiser4: discard support: use reiser4_post_write_back_hook() for=
 discarding and completing deferred deallocations.
> >    reiser4: discard support: perform discard before all deallocatio=
ns.
> >
> 
--nextPart1659676.f2m1V7qP3m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlPXaYQACgkQxUKljSIMAnAXegD9HvzK8zYk1TmwPOgE523u3O0z
RMiYWmkPLZHFFXMtjnIBAJsy4KTOejZ0g8fCCBLpT9Vxv49JwgvxbKSLLaq9jt+T
=iydi
-----END PGP SIGNATURE-----

--nextPart1659676.f2m1V7qP3m--

