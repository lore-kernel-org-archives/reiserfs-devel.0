From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH] reiserfs: fix journal list handling
Date: Tue, 14 May 2013 09:37:08 -0400
Message-ID: <51923E04.2010106@suse.com>
References: <5187FB79.4000206@suse.com> <20130506185748.5844.59533@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2AQSDLHOXQRQUJDHABIXO"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20130506185748.5844.59533@localhost.localdomain>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Chris Mason <clmason@fusionio.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2AQSDLHOXQRQUJDHABIXO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 5/6/13 2:57 PM, Chris Mason wrote:
> Quoting Jeff Mahoney (2013-05-06 14:50:33)
>> reiserfs has open coded linked lists to handle its cnode infrastructur=
e.
>>
>> While converting them to list_heads, I found that while the patch look=
ed
>> perfectly straightforward based on what the code should have been doin=
g,
>> it caused crashes nearly immediately. The issue can be reproduced
>> without the conversion by clearing the hprev/hnext pointers in
>> remove_journal_hash() when the cnode is removed from the hash list.
>>
>> It turns out that the code has been working by happy accident for over=

>> a decade
>=20
> Chris from 1999 is really sorry about that one.  The new code looks muc=
h
> less error prone.

It turns out my test was buggy itself. I'd set cn->h{prev,next} to NULL
too early, truncating the list prematurely. Once I fixed that, I wasn't
able to reproduce it anymore. The lists work but the object lifetimes
aren't clear and the jl->cn->hash_list traversals still use stale list
pointers. We can't hit the can_dirty() BUG() from flush_journal_list
because cn->bh has been cleared. Since ->sb, ->blocknr, and ->jlist are
also cleared, the list traversals don't match anything anyway. It's
unclear what is actually getting traversed (I bet it ultimately can end
up traversing the free list), but hits the NULL termination eventually.
Things would definitely be quite a bit more wonky if the cnodes weren't
allocated up front and stashed back on the free list instead of being
freed normally.

I have an updated version that saw some review from Jan Kara that I'll
post shortly.

-Jeff

--=20
Jeff Mahoney
SUSE Labs


------enig2AQSDLHOXQRQUJDHABIXO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.19 (Darwin)

iQIcBAEBAgAGBQJRkj4JAAoJEB57S2MheeWyBpoP/j+RMGmUSlKiqvK/je3EBvsx
6G4JRR8VcGCRaBXLK9iJSn3hFeuR5Z6F6/Rdhy5Bw9p7p07zpaSY7ipge9WiFvUx
I1/t3aKwR5wdoZ2pnSQjSkxP6u0zFNNMj9ST/324qXly10gbtdHEycTtEv1mliDk
EMSqeKo47iGdqcgKSuLnDhaxtriM9m2mu3qMk96ibDa0udLwtZAYcGEkoJUXY28P
X4UwNdu287JTBhjbaZtkBuUWYtI+cDbQ/BfsK7UUxVK7iN+vaWuMxqGQFgKUkmoN
RCGSsxdIHE99nUN/+a6ZeG5EUP72QFuGmjhFvL4mSBgzlufbnEKS3HnTYhy1DAII
+nT/8cI184kUegwIe5/yMjEfiWhABa+2ROMJPJ/KE4TIoBqAEXOXFjMbnTPfSF/2
6AeJ43PSWz899vuTWx2m3hjp8/oOh93jH9tSshwLTjnkWYAkHFDBRpE228tlqApb
kpzsl2tTKWFmCK61yc1kWvEelDTDxUgF15FmdkoszjDss+QTdPeFmshlX7UEaVKq
RBxT9FKEvtbSLPpFmga+/qB/eYfuARNUfE7p6QKn6Vqf9s0zCikLSIW46wTq8gcI
4PmcbSXORM5Qe1TDEskicggKvIx5KkHiRnEpcNi/UsvTCG9T1TpaJzCPhHL1jX5M
8/7/ifbFKEsC9npnyE7t
=d8Sm
-----END PGP SIGNATURE-----

------enig2AQSDLHOXQRQUJDHABIXO--
