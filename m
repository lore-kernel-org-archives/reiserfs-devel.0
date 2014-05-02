From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: discard support
Date: Fri, 02 May 2014 17:47:27 +0400
Message-ID: <1616202.nsOxH5pPrP@intelfx-laptop>
References: <1496741.djsd6PJ1Ae@intelfx-laptop> <5363860C.7060708@gmail.com> <53639344.90801@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart7053108.fEJAYJKjVI"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=V68i8guFGoYj6vvRQ0GqZH34CtvrggkZMFHdSfRI4rc=;
        b=S/8j1ISpPGbg4MSeN/DLx06raJ9rFB1JFgR3M8rlVRLa3zW2BvCVSzS1GdnXcIPzEK
         +GbX86DwHsBfk2ufXCakr4CW7h6FLmKSqhPwCfjyzc8zPD6Mu0UE4WxeNoaoaVEApVvB
         d4659dv7NBibdtZz1uMcFbGOE/R3j7tRZJYZiPXW9UDhZ3XrAF0QDimQB8oikoZJJPtX
         fhlbhduxlTnvMSe1FZ7kf0kv4gpyppHinu4rzfZJeeKK09C8En/2rNYIvJfWggTVYtRM
         iyzOOF/NnZVC6234LirDfK038RFtQVbUBa8gh7+/6X/L6CeQHjLIrhbYdspIhVc0fCAL
         Biyg==
In-Reply-To: <53639344.90801@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart7053108.fEJAYJKjVI
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Friday 02 May 2014 at 14:44:52, Edward Shishkin wrote:=09
> On 05/02/2014 01:48 PM, Edward Shishkin wrote:
> > On 05/02/2014 01:51 AM, Ivan Shapovalov wrote:
> >> On Wednesday 30 April 2014 at 19:51:03, Edward Shishkin wrote:
> >>> On 04/30/2014 05:04 PM, Ivan Shapovalov wrote:
> >>> [...]
> >>>=20
> >>>>> There is a ready implementation of rb-trees in the kernel (see
> >>>>> ./lib/rbtree.c,
> >>>>> ./lib/rbtree_test.c). Could you please take a look at this?
> >>>>=20
> >>>> I've checked it already. Well, in case of trees:
> >>>> - combined extent insertion+adjacent extent merge complexity is
> >>>> O(n*log(n))
> >>>=20
> >>> Actually, this is:
> >>>=20
> >>> 1) Add n extents one-by-one to empty tree:
> >>> log(1) + log(2) + ... + log(n-1)
> >>>=20
> >>> 2) Merge 2 trees of n extents:
> >>> log(n) + log(n+1) + ... + log(2n-1)
> >>>=20
> >>> Total: log(1*2*...*2n-1) =3D log((2n-1)!)
> >>>=20
> >>> in accordance with Stirling's formula:
> >>>=20
> >>> log((2n)!) =3D log(((2n)^(1/2))*(2n/e)^n) =3D
> >>> =3D (1/2)*log(2n) + n*log(2n/e) < n + n*log(n)
> >>=20
> >> Hm.
> >>=20
> >> Consider we fill two data structures with N extents each, then mer=
ge
> >> these two
> >> data structures and prepare the resulting one for traversal (for
> >> lists it will
> >> be sorting, for trees that's no-op).
> >>=20
> >> For trees:
> >> 1) Adding
> >> 2*log((n-1)!)
> >=20
> > Why "2*" ?
> > I suppose they are filled in parallel...
> > Total complexity (when everything is serialized) is not interesting=
 ;)
>=20
> If lists look more simple for you, then do it with lists.
> Eventually, we'll replace everything with fast-merge trees ;)

The trees with fingers are most probably the way to go, but I would lik=
e to=20
defer implementing of yet another in-kernel data structure at least for=
 some=20
time. :)

=2D-=20
Ivan Shapovalov / intelfx /

>=20
> >> 2) Merging
> >> log((2n-1)!/(n-1)!)
> >>=20
> >> 3) Sorting
> >> none
> >>=20
> >> Total:
> >> log((2n-1)!) + log((n-1)!)
> >>=20
> >> For lists:
> >> 1) Adding
> >> 2N
> >>=20
> >> 2) Merging
> >> constant
> >>=20
> >> 3) Sorting
> >> 2N*log(2N)
> >>=20
> >> Total:
> >> 2N+2N*log(2N)
> >>=20
> >> Quick testing in WolframAlpha shows that, if these estimations are=

> >> correct,
> >> lists tend to have lesser complexity starting with approx. N=3D160=
.
> >>=20
> >>> Since atoms can be merged in parallel, we have that
> >>> trees work better than lists. Also tree of extents has
> >>> better memory consumption because of merging extents.
> >>>=20
> >>>>   against O(n+n*log(n)) in lists;
> >>>>=20
> >>>> - joining two trees is not less than O(log(n)) against O(1) in l=
ists.
> >>>>=20
> >>>> So I can't see any benefit in using trees, and join performance =
is a
> >>>> downside of these. Am I missing something?
> >>>=20
> >>> [...]
> >>>=20
> >>>> Why after reiser4_invalidate_list()? I thought that it should be=

> >>>> called between reiser4_write_logs(), but before
> >>>> reiser4_invalidate_list().
> >>>=20
> >>> OK, insert before. I think, it doesn't matter, since we don't loo=
k
> >>> at this list when issuing discard requests, no? :)
> >>=20
> >> I just don't understand what implications does that function have.=
 It
> >> seems to
> >> mess with jnodes, and I can imagine that this leads to races with
> >> somebody
> >> modifying the bitmaps while issue_discard_requests() tries to read=

> >> them to
> >> check discard extents...
> >=20
> > "somebody modifying the bitmaps" will wait for commit_mutex.
> > Have you found where the bitmaps are modified? This is
> > pre_commit_hook_bitmap().
> >=20
> >>   Again, for me, internals of reiser4 still mostly look
> >>=20
> >> like heavy wizardry. :)
> >=20
> > This is because the technical level of reiser4 is very high.
> > Many very strong scientists contributed to reiser4.
> >=20
> > I also don't understand in details how some reiser4 subsystems work=
.
> > Once I need details, I open the respective code and read it with th=
e
> > comments.
> > The most important thing is general understanding of how it works.
> > Nobody is able to grok this only by reading reiser4 code before
> > sleeping. You need to implement at least one feature by your hands.=

> > Yes, it is not easy, and not for everyone. Like every high-level re=
search
> > in the science...
> >=20
> > Edward.
--nextPart7053108.fEJAYJKjVI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iF4EABEIAAYFAlNjofQACgkQxUKljSIMAnAKIQEAgrpLO60Q3ot3PPOHSW8B4GgY
RdwMX7oIa2WQrVR3MJwA/3IEoeAF4pO4TfuCL4QR1LUycbpruuK945fIDh4TmXLd
=iUQs
-----END PGP SIGNATURE-----

--nextPart7053108.fEJAYJKjVI--

