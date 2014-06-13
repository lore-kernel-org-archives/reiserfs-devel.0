From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: reiser4: discard implementation, pass 2: allocation issues
Date: Sat, 14 Jun 2014 00:28:12 +0400
Message-ID: <3401431.jj87z7i0xD@intelfx-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3067729.45Vmdvt2Qy"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:mime-version
         :content-type;
        bh=RDUfA/kljin4cc865QVVOJah6bF4mgOwfIjN4XdTtHg=;
        b=I1dI1pcUKtB5P/ClXqiGiqT7FKcsLFzANhWczqr5+FGlyKGowkdEWH9kkUNoeS1jaW
         tPUSKt3NSfJu4LbAwMwcY44G7FA/NjRiYKbNA2980Tv74EsJDHxicK5/qOvfGC/4vlwe
         1tcntsy/wZKjjHEo3bfrZbhaRFyY0Rey6TlJ89w4EelyTevdg+8XNWtX7HwEJMn8aPqd
         QHd95rRfN+q7typQcL1fZKwgjYFx3bwZl2E/t2DzHVhsIplcV+RQG5NwkKmqXWyXyPxr
         WeQeTsbiIWM7MwMbLyDWaNwGtmoCvgyVlQSbnmlXUnd7debvfVy0fzyltJjoqMfofNvO
         m4Xw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>


--nextPart3067729.45Vmdvt2Qy
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

Here is my "analysis" of what happens in reiser4 during a transaction's=

lifetime wrt. block allocation and deallocation.


THE EFFECTS (SEMANTICS) OF RELATED FUNCTIONS
reiser4_alloc_blocks_bitmap(): allocates in WORKING BITMAP
reiser4_dealloc_blocks_bitmap(!BA_DEFER): deallocates from WORKING BITM=
AP
reiser4_dealloc_blocks_bitmap(BA_DEFER): stores to ->delete_set

reiser4_pre_commit_hook_bitmap(): allocates all relocated nodes in COMM=
IT BITMAP
                                  deallocates ->delete_set from COMMIT =
BITMAP

reiser4_post_commit_hook(): deallocates ->delete_set using !BA_DEFER
                                                   (i. e. from WORKING =
BITMAP)


TIMELINE OF ALLOCATIONS FOR "USUAL" NODES, AND TIMELINE OF TRANSACTION =
COMMIT
=2D nodes are allocated using reiser4_alloc_blocks() and setting JNODE_RE=
LOC,
  so WORKING BITMAP ensures that two nodes cannot get the same block;
=2D nodes are deallocated using reiser4_dealloc_blocks(BA_DEFER),
  so their deallocation is not immediately reflected in WORKING BITMAP;=

(the relocate set is written here)
=2D reiser4_pre_commit_hook_bitmap() uses 1) JNODE_RELOC flag and 2) ->de=
lete_set
  to convey effective bitmap changes into COMMIT BITMAP;
(the journal and overwrite set are written here)
=2D reiser4_post_commit_hook() uses ->delete_set to convey deallocations
  from step 2 to WORKING BITMAP.
(the discard happens here)


TIMELINE OF ALLOCATIONS FOR WANDERED JOURNAL BLOCKS
=2D at commit time, blocks are allocated using reiser4_alloc_blocks(), so=
 they
  are allocated in WORKING BITMAP and do not interfere with any "usual"=
 blocks;
=2D after writing wandered blocks, they are deallocated using
  reiser4_dealloc_blocks(!BA_DEFER), i. e. from the WORKING BITMAP.


CONCLUSION
At possible transaction replay time, journal blocks are not allocated i=
n any
of the bitmaps. However, because the journal is read and replayed befor=
e a
transaction has a chance to commit, this fact does not matter.
What matters is that wandered journal blocks never hit COMMIT BITMAP.

So, if I've got all this correct (which I highly doubt), the disk space=
 leak
(as you pointed it out) does not exist.

What exists is a rather different problem with my idea of "log every
deallocated block". Current implementation logs every block regardless =
of
BA_DEFER flag presence or absence, so non-wandered blocks are logged tw=
ice.

We could just use ->delete_set, but we would lose wandered blocks then.=

Or we could only log !BA_DEFER requests, which would do the right thing=

(wandered blocks + deallocations from reiser4_post_commit_hook()), but
the reasoning behind this decision would not be obvious for a casual
code reader.
Or we could log only wandered blocks (in addition to ->delete_set)
at discard time, but this is messy and requires us to merge the discard=
 log
with ->delete_set at discard time.
Or we could log wandered blocks straight into ->delete_set and do somet=
hing in
reiser4_post_commit_hook() to separate these entries, but this is super=
 messy.

I'm preferring the second way... Edward, please proof-read all this.

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart3067729.45Vmdvt2Qy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlObXuAACgkQxUKljSIMAnC2PwD/UVHO4cyvDib/GGw0nFzatke6
iPLy09AklF3D7DVTePIA/j+DQp4QweKA6oXRE1ed4d08qPfM1JUd+NE1MMqjd4rP
=kDjk
-----END PGP SIGNATURE-----

--nextPart3067729.45Vmdvt2Qy--

