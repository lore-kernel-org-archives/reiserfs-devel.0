From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: FITRIM ioctl -- how to grab the space?
Date: Sat, 16 Aug 2014 15:27:36 +0400
Message-ID: <2295734.UIR3OjHuyC@intelfx-laptop>
References: <3405506.BC0S4TX54B@intelfx-laptop> <53EF11C8.20209@gmail.com> <53EF14EC.1070101@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1418956.CgxTh0eCdJ"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=qzlQA1f5isgvI6tjHLqjcNKFRxRDqyvZBDgjrO6TgcY=;
        b=sy8VG8HpOjoSc/rtAmo3Y/75jcVlDUPCHn7efEvMbDvnUqiyANRZDNVOmFJFmhIbuN
         I8Yx7qVnwbKuqnWlfRwpm7nBzqVoEYkxYvUdqOhI/UY9hakFsv3u9rhsXu+pPn5lkcyu
         K/Tai7Fq/bk5S5NtdA8PyYmEuITmpFhw+vy/Ymc3ZPZWoTK819S5IVct758BQivZWxja
         AYFCWcZ0D77OLFEKtm+whDt6y4pPDZcfjCc7MlHN9n4j67eJwegAtdOMKujkKpRvBKiU
         deIz/aQSD34qZzXBa81/XtboHxIljKm2laVf/+EU75k4ZEly53cxy2ypHFk4DrDxJc9k
         FYCg==
In-Reply-To: <53EF14EC.1070101@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart1418956.CgxTh0eCdJ
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Saturday 16 August 2014 at 10:23:08, Edward Shishkin wrote:=09
> [...]
> >>
> >> So I need to find a way to take rwsem in a read-biased mode... Any=
=20
> >> advice is
> >> accepted, including "give up with adding of yet another lock and g=
o with
> >> multiple transactions" :)
> >
> >
> > IMHO this is too complicated.
> >
> > Why don't you want to grab, say, 20M per iteration?
> > It should work without any problems, just maintain a
> > counter of blocks allocated in the iteration..

I see it mostly like a "good to have" thing. When the system is under l=
oad,
FITRIM implemented in this "simple" way will be ineffective: it will mi=
ss
some blocks that are temporarily allocated (journal, etc.) even though =
it is
theoretically possible to stop accepting new transactions, commit all e=
xisting
ones and perform discard while the system is artificially made idle, th=
en
resume everything.

So I've been trying to check if this is feasible. Looks like it isn't.

> add the counter to the struct reiser4_context and
> set it to zero at the beginning of every iteration.
> use get_current_context() to access the counter.

Is it needed? The simple way is just a loop consisting of
=2D grab space
=2D allocate blocks forward from start position (initially 0) until end o=
f
  partition or limit reached
=2D update start position to `last allocated block + 1`
=2D put allocated space to the delete set
=2D mark for force-committing
=2D reiser4_txn_restart_current()
=2D if we've reached end of partition earlier, break, otherwise loop

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart1418956.CgxTh0eCdJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlPvQCgACgkQxUKljSIMAnAUEwEAxti+qa8KnsUtQsDTHyP0v9Ar
REd4CngqvhH5WGsmN20BALIzH5O3TbDSgp9/1M7iMj358bFmPmafmCZHg0+7Ks1e
=Or6O
-----END PGP SIGNATURE-----

--nextPart1418956.CgxTh0eCdJ--

