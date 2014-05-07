From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: discard support
Date: Wed, 07 May 2014 11:35:43 +0400
Message-ID: <9209978.Zaz5Vcsz4S@intelfx-laptop>
References: <1496741.djsd6PJ1Ae@intelfx-laptop> <2562062.LWrRe7vaEB@intelfx-laptop> <5368A44D.5090607@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2210414.guliEpL28Z"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=mr7rd2A+pjiPy5E35jlKLom64fPN7Of4N9B7z+l9oSY=;
        b=ryTmJX2de8lF37y6CLb2dsTfsaM3D4L9wbU1X7WfGm+ZKx4A0CpcLgiCT9W96JA3Xr
         XawOduZ1OxTrKQqXE8tc91DqvVu5RROZwZZwafQf9XKUATwpd4YOTDRJ2I9Y7/fBiAOS
         ERD+7JXVWqe2pJ+SyY4HkW1llBHl35mlDx6B/BVV7IjSQw+ZK8O1qNbujTWG0hJhnSN4
         b2PvwN76swNhcy1Uxu0QRd0EGzM+9GfAbjaQfqdpWCfYJdUn6t8+vpSzMWEg8pdHsDer
         wua2rTRXvlQ0DEnW4XqfWoxJS+UqAFsRZezqi2Y+trYDybKMuDImERfAI3cijI+A846B
         7q1Q==
In-Reply-To: <5368A44D.5090607@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart2210414.guliEpL28Z
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Tuesday 06 May 2014 at 10:58:53, Edward Shishkin wrote:=09
> On 05/03/2014 10:32 PM, Ivan Shapovalov wrote:
> > On Saturday 03 May 2014 at 22:21:58, Edward Shishkin wrote:
> >=20
> > TBH, I have never looked at the deallocation paths in reiser4: ever=
ything
> > worked fine there.. BTW, why not to use atom's delete_set to discar=
d
> > things? Could you please take a look?
>=20
> [...]
>=20
> >>> Blocks used for the journal (wander.c) are deallocated without BA=
_DEFER
> >>> set
> >>> and thus they never hit delete_set. However, we want to discard t=
hese.
> >>=20
> >> This happens in error paths. Don't be so scrupulous ;)
> >=20
> > I don't think so:
> > - wander.c:485
> >=20
> >    dealloc_tx_list() <- reiser4_write_logs()
> >=20
> > - wander.c:505
> >=20
> >    dealloc_wmap_actor() <- dealloc_wmap() <- reiser4_write_logs()
>=20
> Yep, indeed.
> I don't completely understand this special case of wandered blocks.

From=20what I've been able to understand, delete_set is not used there ju=
st=20
because the deallocations are done directly to the bitmaps: we already =
hold=20
the tmgr mutex at that time.

> Also I don't see where wandered blocks are deallocated after journal
> replay (as journal is not needed any more): it can be a possible leak=

> of disk space after system crashes..

Maybe the bitmap version submitted to disk does not have these blocks=20=

allocated? I don't really understand what's going on wrt. disk write-ou=
t, and=20
I don't even understand the difference between COMMIT BITMAP and WORKIN=
G=20
BITMAP...

> Once we understand it, I think we'll able to re-use the delete_set fo=
r
> discard needs.
>=20
> Edward.

We can get any benefits from re-using delete_set only if we replace it =
with a=20
list/rbtree. Current implementation (blocknr_set) seems to be inherentl=
y=20
unordered and can't be trivially modified (extent merge etc), so if we =
want to=20
use delete_set as-is, we still need to copy the extents into a better d=
ata=20
structure at commit time.

=2D-=20
Ivan Shapovalov / intelfx /

>=20
> >> Also users will use copy-on-write transaction model for their SSDs=
(*),
> >> and in this mode journals are tiny: they contain only system block=
s.
> >> In short, there is nothing to discard..
> >>=20
> >> (*) http://marc.info/?l=3Dreiserfs-devel&m=3D139449965000686&w=3D2
--nextPart2210414.guliEpL28Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iF4EABEIAAYFAlNp4lQACgkQxUKljSIMAnCPuwEA1ndtC7YsyRiyddmsdQa08RTp
hSN7jrQPs0HBRpEtL7EA/3YcisG4EVfBZVD8YcxEeo26taF39gIPhVgccQ63lKNG
=XUC/
-----END PGP SIGNATURE-----

--nextPart2210414.guliEpL28Z--

