From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: discard support
Date: Fri, 02 May 2014 18:32:40 +0400
Message-ID: <4594794.KsdUPSo0Ac@intelfx-laptop>
References: <1496741.djsd6PJ1Ae@intelfx-laptop> <3402083.oAjQiz7CVk@intelfx-laptop> <5363A699.90108@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5976131.lye3OeZOFD"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=EpebTdlIScmXY75uDQPK2kCic1kQY3hT8f0w3nEYoVg=;
        b=Q9jHXbmidq4VUf3BhYGUxcnjDxWwhgVwCMOBSROQZBJuTneVOPbAjZyyTEseUOYXOK
         VVP0VXP7LQ5mocg+ZjGA2LA09nDUd6hVb91e/jc2VX99C2PocoAovjVwb5M5VX2O8Cyx
         Nmm9HdqLGGqLwGY7C7ZpHw4ydP8HTnm9wCazf6ZpJQ3dodRdxfsiRvHjhI0pjPZY8zMH
         sz2VyDpMebSMh2gOez25DWIYEKNE5FfStdZlvDwk7+IXhHuKzz3dh7J9htFFJTPFtJme
         W4+LuYM/P7KtUGQ5NOHoJLsMM9HE4R+hd+99Bz992WwbAdIRb9BtyPdQd8RTrb8/9kBD
         RUNQ==
In-Reply-To: <5363A699.90108@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>


--nextPart5976131.lye3OeZOFD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Friday 02 May 2014 at 16:07:21, Edward Shishkin wrote:=09
> On 05/02/2014 03:36 PM, Ivan Shapovalov wrote:
> > On Friday 02 May 2014 at 13:48:28, Edward Shishkin wrote:
> >> On 05/02/2014 01:51 AM, Ivan Shapovalov wrote:
> >>> On Wednesday 30 April 2014 at 19:51:03, Edward Shishkin wrote:
> >>>> On 04/30/2014 05:04 PM, Ivan Shapovalov wrote:
> >>>> [...]
> >>>>=20
> >>>>>> There is a ready implementation of rb-trees in the kernel (see=

> >>>>>> ./lib/rbtree.c,
> >>>>>> ./lib/rbtree_test.c). Could you please take a look at this?
> >>>>>=20
> >>>>> I've checked it already. Well, in case of trees:
> >>>>> - combined extent insertion+adjacent extent merge complexity is=

> >>>>> O(n*log(n))
> >>>>=20
> >>>> Actually, this is:
> >>>>=20
> >>>> 1) Add n extents one-by-one to empty tree:
> >>>> log(1) + log(2) + ... + log(n-1)
> >>>>=20
> >>>> 2) Merge 2 trees of n extents:
> >>>> log(n) + log(n+1) + ... + log(2n-1)
> >>>>=20
> >>>> Total: log(1*2*...*2n-1) =3D log((2n-1)!)
> >>>>=20
> >>>> in accordance with Stirling's formula:
> >>>>=20
> >>>> log((2n)!) =3D log(((2n)^(1/2))*(2n/e)^n) =3D
> >>>> =3D (1/2)*log(2n) + n*log(2n/e) < n + n*log(n)
> >>>=20
> >>> Hm.
> >>>=20
> >>> Consider we fill two data structures with N extents each, then me=
rge
> >>> these
> >>> two data structures and prepare the resulting one for traversal (=
for
> >>> lists it will be sorting, for trees that's no-op).
> >>>=20
> >>> For trees:
> >>> 1) Adding
> >>> 2*log((n-1)!)
> >>=20
> >> Why "2*" ?
> >> I suppose they are filled in parallel...
> >> Total complexity (when everything is serialized) is not interestin=
g ;)
> >=20
> > Oh why? Everything is still serialized by the physical CPU, for tha=
t
> > matter. So less complexity -> less CPU time...
>=20
> We can perfectly populate different "discard trees" in parallel on
> different CPUs.
> As to sorting the list: I don't know how to perform it in parallel :)=

> Default assumptions, that everything is serialized, usually lead to v=
arious
> bad-scalable solutions...

Ah, now I understand what do you mean. If that's about doing less work =
under=20
the tmgr mutex, then yes, trees are better than lists.

BTW, I've seen that reiser4 releases atom lock before allocating anothe=
r node=20
for a blocknr_set, and that leads to a "do { } while (ret =3D=3D -E_REP=
EAT)" loop=20
around the blocknr_set_add_extent() calls. Is this the preferred way of=
=20
attaching a dynamic data structure to an atom?

>=20
> >>> 2) Merging
> >>> log((2n-1)!/(n-1)!)
> >>>=20
> >>> 3) Sorting
> >>> none
> >>>=20
> >>> Total:
> >>> log((2n-1)!) + log((n-1)!)
> >>>=20
> >>> For lists:
> >>> 1) Adding
> >>> 2N
> >>>=20
> >>> 2) Merging
> >>> constant
> >>>=20
> >>> 3) Sorting
> >>> 2N*log(2N)
> >>>=20
> >>> Total:
> >>> 2N+2N*log(2N)
> >>>=20
> >>> Quick testing in WolframAlpha shows that, if these estimations ar=
e
> >>> correct,
> >>> lists tend to have lesser complexity starting with approx. N=3D16=
0.
> >>>=20
> >>>> Since atoms can be merged in parallel, we have that
> >>>> trees work better than lists. Also tree of extents has
> >>>> better memory consumption because of merging extents.
> >>>>=20
> >>>>>    against O(n+n*log(n)) in lists;
> >>>>>=20
> >>>>> - joining two trees is not less than O(log(n)) against O(1) in =
lists.
> >>>>>=20
> >>>>> So I can't see any benefit in using trees, and join performance=
 is a
> >>>>> downside of these. Am I missing something?
> >>>>=20
> >>>> [...]
> >>>>=20
> >>>>> Why after reiser4_invalidate_list()? I thought that it should b=
e
> >>>>> called between reiser4_write_logs(), but before
> >>>>> reiser4_invalidate_list().
> >>>>=20
> >>>> OK, insert before. I think, it doesn't matter, since we don't lo=
ok
> >>>> at this list when issuing discard requests, no? :)
> >>>=20
> >>> I just don't understand what implications does that function have=
. It
> >>> seems to mess with jnodes, and I can imagine that this leads to r=
aces
> >>> with somebody modifying the bitmaps while issue_discard_requests(=
) tries
> >>> to read them to check discard extents...
> >>=20
> >> "somebody modifying the bitmaps" will wait for commit_mutex.
> >> Have you found where the bitmaps are modified? This is
> >> pre_commit_hook_bitmap().
> >=20
> > Yes, but I was not sure this is the only place where the bitmaps ar=
e
> > touched...
> >=20
> >>>    Again, for me, internals of reiser4 still mostly look
> >>>=20
> >>> like heavy wizardry. :)
> >>=20
> >> This is because the technical level of reiser4 is very high.
> >> Many very strong scientists contributed to reiser4.
> >>=20
> >> I also don't understand in details how some reiser4 subsystems wor=
k.
> >> Once I need details, I open the respective code and read it with t=
he
> >> comments.
> >> The most important thing is general understanding of how it works.=

> >> Nobody is able to grok this only by reading reiser4 code before
> >> sleeping. You need to implement at least one feature by your hands=
.
> >> Yes, it is not easy, and not for everyone. Like every high-level r=
esearch
> >> in the science...
> >>=20
> >> Edward.
> >=20
> > ...and nobody to this point had written an explanation of that, or =
some
> > piece of documentation except the design document...
>=20
> what explanation do you mean?
>=20
> Edward.

A general explanation of how does it work :)

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart5976131.lye3OeZOFD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iF4EABEIAAYFAlNjrI0ACgkQxUKljSIMAnAYHAD/ZnjCNTO0x+WW6eNg2uidgy3h
ibcRimCzR8I85uSaCuAA/2hZ40qmqA07F0C3Vu6SQh7J6j9mR9YtXSfowVBxXXls
=XMSk
-----END PGP SIGNATURE-----

--nextPart5976131.lye3OeZOFD--

