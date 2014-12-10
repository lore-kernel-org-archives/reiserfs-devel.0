From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCHv2 0/3] reiser4: space grabbing fixes.
Date: Wed, 10 Dec 2014 16:30:25 +0300
Message-ID: <2450127.6MNmFpgyTD@intelfx-laptop>
References: <1414048685-4224-1-git-send-email-intelfx100@gmail.com> <5497656.EllimmOa76@intelfx-laptop> <548841F8.4010409@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3166366.AoEx3CN4N8"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=ncl61QDCJamSNjLYkziT/kAB8A1WNodXLjMzGncS4sU=;
        b=Gsd5+o3oovqlqC2QyLEESaxRAqpMZl0mN+n6+f5DlvUdFS2LD298HiQ7mxOJVIrhqn
         P4/e/TYi5IyAoBkwfvwZkdOaEOokaXO5hY/r9wI87fY0KTFjgXYGfPOXHeGK3wiTMxIp
         0SA+Q5F+lgO45gqPONaLtx9zLimFC+EadZScpMJixwW+X86UoAnUpQNw+nBMTA4HZltB
         wM91eP1XrdKZUsnJzoujozAOyXfkm37G2xgiwfI9asRFZdz57EJpCGcHQ207KB2/CLXk
         5EgjV5THkstWDGbHFtqXjAgj+0hnhMRvCJHtCrBZn+jKkoTkmdkpVwAAfDSaBRCTMIHP
         vloA==
In-Reply-To: <548841F8.4010409@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart3166366.AoEx3CN4N8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Wednesday 10 December 2014 at 13:52:08, Edward Shishkin wrote:=09
>=20
> On 12/10/2014 01:27 PM, Ivan Shapovalov wrote:
> > On Thursday 23 October 2014 at 11:18:02, Ivan Shapovalov wrote:=09
> >> These are mostly equivalent transformations (aside from the first =
patch)
> >> I've done when I was experimenting with rwsems at zero-th iteratio=
n of
> >> batch discard support.
> >>
> >> v2: - disable grab in current context unconditionally, not only if=
 !BA_FORCE
> >>
> >> Ivan Shapovalov (3):
> >>    reiser4: block_alloc: improve error handling in reiser4_grab_re=
served().
> >>    reiser4: block_alloc: sanitize grab_enabled modifications.
> >>    reiser4: do not mess with grab_enabled; instead, use BA_FORCE.
> >>
> >>   fs/reiser4/block_alloc.c                 | 57 +++++++++++++++++-=
=2D-------------
> >>   fs/reiser4/plugin/file/file.c            | 12 +++----
> >>   fs/reiser4/plugin/file/file_conversion.c |  3 +-
> >>   fs/reiser4/plugin/file/tail_conversion.c | 11 +++---
> >>   fs/reiser4/plugin/item/extent_file_ops.c |  3 +-
> >>   fs/reiser4/plugin/item/tail.c            |  3 +-
> >>   fs/reiser4/safe_link.c                   |  4 +--
> >>   7 files changed, 44 insertions(+), 49 deletions(-)
> > ping, what's the status?
>=20
>=20
> This is in "upstream" already.

Hm.. I didn't see it..

Well, then a follow-up fix should be applied, as described in one of pr=
evious
messages, or this should be reverted.

> > /*
> > I'll send another round of discard patches shortly... That is, once=
 I figure
> > out how to explain in comments the sheer amount of happily coincidi=
ng subtle
> > details, whose coincidence makes everything actually work. :/
>=20
>=20
> Note, that basic discard stuff is also in "upstream".
> So, please, make sure that your patches are "re-based"

Yes, I'll ensure that everything can be applied cleanly.

> > BTW, could you please check that I've rebased your "precise discard=
" patch
> > correctly?
> > https://github.com/intelfx/linux/commit/47f27446d5ae7b796a842735811=
c48cc07615dd6
> > */
> >
>=20
>=20
> I suggest to start with implementing the bitmap primitives that
> I talked about. Just to avoid extra-work..

If I understand you correctly, then I've already done that.

But let's first deal with this (current) patchset; it's broken. Sorry f=
or
creating more problems than solving.

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart3166366.AoEx3CN4N8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlSISvEACgkQxUKljSIMAnAAAwEAySKmdvm8WbdPYgcxekgP6xpi
ogWfCj6gL4yp6n5BajUA+wZUnGghvo7TX9CpvCnnUnawvjuhjVMe7Od56yLSjvXe
=cEDp
-----END PGP SIGNATURE-----

--nextPart3166366.AoEx3CN4N8--

