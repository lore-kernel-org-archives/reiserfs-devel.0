From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCHv6 3/5] reiser4: discard support: initial implementation using linked lists.
Date: Mon, 21 Jul 2014 03:14:37 +0400
Message-ID: <7768685.ZxsNAV9AVN@intelfx-laptop>
References: <1403434126-6390-1-git-send-email-intelfx100@gmail.com> <53CC2EF1.8010705@gmail.com> <53CC476A.4000704@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6167512.iiAelGOORm"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=kMH8Vf3R3IE3NRz1PDik9uYN4EQFLgo/iEjzASt2gho=;
        b=ekrV/EBC7vkfWDj8LZe+I3Cak0CVddCShJKZc9/EHiFabsyjDHeZjcy0NJHHfim/n0
         WGB3GiYd2aqf4EHHGD9puO5jczFUdAjJrOYajxs6tWv1htiEj5khg+opvV4Ou3fYoBQp
         gWIvo9uP4yfH7nFr1G0l032HuKT9VefZ90tB5jDqAyoIVkey80FWhxfWeaaH26hYJzTq
         dyIteTcTohIQ7EyJgcIVTKC4uivEyn9zaAwZbe+CyZ7PTpRFEoDOuzgmpPqpICB7Obgb
         oETMLMqA/zw6n1wQxZcdR04n3l8MEiT9/WBodjESzOBv9RzBHwmD1bE6PWKseYmJFusI
         9+Qw==
In-Reply-To: <53CC476A.4000704@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: "reiserfs-devel@vger.kernel.org" <reiserfs-devel@vger.kernel.org>


--nextPart6167512.iiAelGOORm
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Monday 21 July 2014 at 00:49:14, Edward Shishkin wrote:=09
>=20
> On 07/20/2014 11:04 PM, Edward Shishkin wrote:
> >
> > On 07/20/2014 02:33 PM, Edward Shishkin wrote:
> >>
> >> On 07/20/2014 12:06 PM, Ivan Shapovalov wrote:
> >>>> 20 =D0=B8=D1=8E=D0=BB=D1=8F 2014 =D0=B3., =D0=B2 1:20, Edward Sh=
ishkin=20
> >>>> <edward.shishkin@gmail.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=
=D0=BB(=D0=B0):
> >>>>
> >>>>
> >>>>> On 07/14/2014 03:56 AM, Edward Shishkin wrote:
> >>>>>
> >>>>>> On 07/13/2014 09:18 PM, Ivan Shapovalov wrote:
> >>>> [...]
> >>>>>> Nothing seems to call at least check_free_blocks(begin, end)..=
.
> >>>>>
> >>>>> Oh, bad... I thought all this time that extents of the delete s=
ets=20
> >>>>> are still dirty
> >>>>> in the working bitmap at the moment of discard.
> >>>>> Hmm, I definitely don't want to check the whole extents for=20
> >>>>> discard...
> >>>>
> >>>> False alarm, actually..
> >>>>
> >>>> Nothing is wrong if someone makes them dirty before issuing our=20=

> >>>> discard
> >>>> requests: his changes will be committed in the next sessions of=20=

> >>>> possessing
> >>>> the commit_mutex _after_ our discard. Everything is isolated.. F=
or=20
> >>>> the same
> >>>> reason we don't care if someone allocate blocks in head and tail=
=20
> >>>> paddings
> >>>> before issuing our padded discard extents.
> >>> I was just thinking about the very same possible race...
> >>>
> >>> But well, isn't the call to current_atom_complete_writes() placed=
=20
> >>> before acquisition of commit_mutex? I was under impression of tha=
t=20
> >>> relocate sets could be written while another atom is being commit=
ted=20
> >>> under the mutex.
> >>
> >> take the commit_mutex before flush if discard_enabled &&=20
> >> should_check_heads.
> >
> >
> > Actually, this is not so simple. E.g. I got a deadlock..
> > Another option is to make head/tail paddings dirty with the
> > following update of the extent of the delete_set.
> > One more option is to not support such discard params.
>=20
>=20
> Actually what we are trying to implement is "precise discard". This i=
s
> rather complicated task. I looked at other file systems: nobody bothe=
r
> with paddings, just stupidly pass a freed extent to blkdev_issue_disc=
ard(),
> which cuts the head and the tail. I suggest to do the same. We have d=
one
> our best. Someone can not afford even to accumulate the extents.
>=20
> Edward.

Let's do it ideally, after all, this is reiser4 ;) I also think that we=
 can
just mark paddings as allocated and add them to extent in question (so =
that
they will be freed by reiser4_post_commit_hook). This looks simple enou=
gh.

The block allocator interface, IIRC, allows us to tell it "allocate rig=
ht here
or return failure".

/* I had no time to look into any code during this weekend. Tomorrow I'=
ll
hopefully repost the discard-before-dealloc patches and look into this.=
. */

=2D-=20
Ivan Shapovalov / intelfx /

--nextPart6167512.iiAelGOORm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlPMTWEACgkQxUKljSIMAnCAWAD/acNeAcSYxQEmqKt676dYIkhO
t/wCkNTvz6MWjgrXR9UBAOWr356AFdLGXTvSBLsbSMfybNQyq+ajdQGXrfpFHYLN
=uMpd
-----END PGP SIGNATURE-----

--nextPart6167512.iiAelGOORm--

