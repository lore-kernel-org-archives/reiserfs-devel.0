From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: reiser4: discard support
Date: Wed, 30 Apr 2014 11:43:27 +0400
Message-ID: <1496741.djsd6PJ1Ae@intelfx-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3171830.447PIHd9rr"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:mime-version
         :content-type;
        bh=rpd5r94pCn/W3s4v5xI5c1C7y7F1wEvAC8QP7eh90q0=;
        b=JPPvY/3hKvHe00WKyP2wMm+YC+sTDb759X2aEPJjFatAK8Q19YqPtYSVOj/Q1tOJEY
         IP66zXTPeMYFY96/99/OWp3ngbq8m/0pJGXx/0RIpuLkYgH/qW8ioKE3akERW6+aDHV9
         msJE7/hoCCHU4ppVBNafkD5ct1mHMaBK6kANXSYXMezo9E2UqGGg/UUVFJIq/x+qowQY
         GShSZCykpTxeyosfcxw/nuGdGxk/J0oBsanTtNkiRFQmBmsbtDlxjd6Wbhat0u9FPTZG
         13MgF8caTILQYTSTcBl9NcOIi0n1wNAoKRQ80WqtvHhubll4cOQqsE3nzdqpo1dnnbkn
         5s3A==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>


--nextPart3171830.447PIHd9rr
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

Hi Edward,

So I bit the bullet, ditched all tasks for the upcoming holidays and ga=
ve=20
another try to the discard support in reiser4. Since my last status upd=
ate,=20
I've lost the local kernel tree due to bad scripting (decided to TRIM f=
ree=20
space between partitions... and TRIM'ed everything that is NOT free spa=
ce), so=20
I had to start from scratch.

I decided to go with following algorithm:

During the transaction deallocated ranges are logged as-is to a list or=
 array=20
(let's call it "the delete log"). On atom commit we will generate a min=
imal=20
superset of the delete log, comprised only of whole erase units ("the d=
iscard=20
set").
So, at commit time the following actions take place:
=2D elements of the delete log are sorted;
=2D the delete log is iterated, merging any adjacent ranges;
=2D for each resulting range in the delete log its start is rounded down =
to the
  closest erase unit boundary, and, starting from this block, extents o=
f erase
  unit length are created until whole range is covered;
=2D for each such new extent it is checked whether does it contain alloca=
ted
  blocks. If no (i. e. the range is completely deallocated), the range =
is
  added to the discard set.

Complexity of logging is thus O(n), added complexity of atom joining is=
 O(1)=20
and added complexity of atom commit is O(n*log(n) + n).

The first question is how to store the delete log.
=2D blocknr_set isn't ordered per se, so adjacent entries can't be easily=
 merged
=2D simple linked list (extent per node) seems like too big overhead
=2D kmalloc()'ed arrays can't be joined in O(1) and they are static (impo=
ses a=20
hard limit on log size)
=2D kmem_cache... feels like using a sledge-hammer.

And oh, where in commit_current_atom() should these things be done? I g=
uess=20
right after the reiser4_write_logs(), under the tmgr mutex, but I can't=
 really=20
explain why I think so.

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart3171830.447PIHd9rr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iF4EABEIAAYFAlNgqaQACgkQxUKljSIMAnA8vwD/YOEe8d7n0Fld+RvuUrfuwdG9
grX2pFKKB4TLj9DOmz4A/2zW6D/NtDtgaD6sT31sc99+1aX2aM8B/bJZNkv+ieXG
=FtTO
-----END PGP SIGNATURE-----

--nextPart3171830.447PIHd9rr--

