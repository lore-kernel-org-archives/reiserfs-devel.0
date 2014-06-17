From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: discard implementation, pass 2: allocation issues
Date: Tue, 17 Jun 2014 22:31:36 +0400
Message-ID: <1775901.eB9J0phJSL@intelfx-laptop>
References: <3401431.jj87z7i0xD@intelfx-laptop> <2537417.F0W18VYPYg@intelfx-laptop> <53A018A1.5030403@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2094475.D3840nVGAH"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=pm3gk7/DnDGCyMyD66l2EkWlNTz0T/yVNDvE+RgZ460=;
        b=wOFjRXH4r98DZVMp1WYZN8k2JbJ8f7/KgsOrb3QICoQF44E5mqV9zyZBK+nljXAzm7
         5jrGhvzc5or6rHtR/DUn18K1zPlPeuyQQ9rnvL+gz8UlfDBLnpllqdAy2gu41KRI+BGZ
         WdK6kypxVie4e8YD/umZkx/86JbhfOs046pscsvbBeKr/nuyxvu2rC+M0z6FKEVaJ8n8
         faxWFE2vM1QFPKUhIR1h/TbRgo/26mSFFLLx0dtXSjTF9fpcF2aKta8TMuKCknDHE8ks
         baUbGZij8B8am7wuH6/9TFTHF770lWHDXkDXxbNJjWRqf/WVw5YIPag9o48/+IVSbHQS
         snYQ==
In-Reply-To: <53A018A1.5030403@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart2094475.D3840nVGAH
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Tuesday 17 June 2014 at 12:29:53, Edward Shishkin wrote:=09
>=20
> On 06/17/2014 12:14 PM, Ivan Shapovalov wrote:
> > On Tuesday 17 June 2014 at 02:37:16, Edward Shishkin wrote:=09
> >> [...]
> >>
> >> Yup, blocknr sets minimize memory consumption and are unsortable..=
.
> >>
> >> I think that the cleanest option will be using lists (instead of b=
locknr
> >> sets) for
> >> the delete sets, if the discard is turned on. It will reduce memor=
y
> >> consumption
> >> by 20%. Indeed, every entry in a blocknr_set occupies ~8 bytes (as=
suming
> >> that everything is pretty fragmented because of txmod=3Dwa), where=
as a list
> >> entry occupies 32 bytes (start, length, plus 2 pointers for the li=
nk).
> >>
> >> In this option we'll need to join lists (instead of merging blockn=
r
> >> sets) during
> >> atoms fusion and apply the list (instead of blocknr set) to the CO=
MMIT
> >> BITMAP
> >> at pre_commit_hook(). I think it won't be a problem, since the lis=
ts are
> >> simpler
> >> than blocknr sets.
> > That's a neat approach. I think I'll use unions and do the decision=
 at runtime.
>=20
>=20
> Yup.
> So, if discard is on, we work with 2 lists (delete_set,=20
> delete_set_for_wander).
> If discard is off, we work with one blocknr set..

Good. So I'll do roughly following for v5:
=2D rename discard_set_* to block_list_* and split off these definitions
=2D write a family of reiser4_atom_dset_*() (log_deferred, log_immediate,=

  apply_deferred, merge, init, destroy) which will encapsulate discard/=
nodiscard
  check and operate on correct lists (blocknr_set vs block_list)
=2D call reiser4_atom_dset_{init,destroy,merge}() from respective functio=
ns
=2D call reiser4_atom_dset_log_{deferred,immediate}() from reiser4_deallo=
c_blocks()
=2D call reiser4_atom_dset_apply_deferred() from reiser4_post_commit_hook=
()
=2D directly manipulate the block lists from discard_atom(), checking tha=
t we
  indeed have discard enabled

Is this OK?

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart2094475.D3840nVGAH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlOgiY4ACgkQxUKljSIMAnC4wgD/Qyxoy3836mF5Aav97uglfnMF
s5h1O+ZuwSxRYOyOp1MA/jt+q8EC4SYlCkmLoF1vPn0aYLb+8d9Z3vS5WGEVxmsD
=j1Ts
-----END PGP SIGNATURE-----

--nextPart2094475.D3840nVGAH--

