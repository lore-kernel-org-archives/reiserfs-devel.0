From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: reiser4: FITRIM ioctl -- how to grab the space?
Date: Fri, 01 Aug 2014 00:47:50 +0400
Message-ID: <3405506.BC0S4TX54B@intelfx-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6869975.uAER6AFDZ4"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:subject:date:message-id:user-agent:mime-version
         :content-type;
        bh=A4ZbWLb4tZRSRaA5AEGjnE4xEKs/DU3hQ1hyXYFQhU0=;
        b=vVrzf7cr1I1NbyQ7G+dx5euaKmgsZFsLjcH6U6h44It0J0dXnRGPYrT/CHYHPNgoY2
         XhU9oKOrkJA9cE6+oab389h+KIZjMjETDsl+SjYRmaHkiX/Yl8xlIl3LVPjTlQ20Rap1
         ZK8EP03046CtCbS1QQL0+or50hEz+vR95Gp6hNB8eJvNgRHPvL5IkMeU7SSjHBfpobQG
         GM/rQpHamUgm9NXGva+B2IulhLqZ/4xQFGok7tGP3zyH32uDgy+GuJAQh68DPBb+e3Ov
         cIlmFWnHTyQZ3DBxuLw/ygWPf+Mrn7hGudKftxwrqONLnbYtb4/TU1SEB2TwZSIABdyr
         Md+w==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org


--nextPart6869975.uAER6AFDZ4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

...and here is volume 2 of my neverending question series :)

A stub ioctl, placed as I described, seems to work and log a warning ea=
ch time
I invoke `fstrim` on anything mounted.

Now on to space allocation. This seems pretty easy in the first approxi=
mation:
reiser4_alloc_blocks_bitmap() seems to do what's needed, finding the ne=
arest
free extent, not the biggest one. So we could just call reiser4_alloc_b=
locks()
plus reiser4_dealloc_blocks(BA_DEFER) repeatedly, while allocations suc=
ceed.

However, I suppose we need to grab all free space before proceeding. Th=
ere is
no primitive for grabbing all free space, so we need to read block coun=
ters,
calculate amount of space to grab and then call reiser4_grab_reserved()=

(as we want to allocate everything, including the reserved space. This =
creates
two problems (as I see it):
=2D there is a race between reading block counters (under sb spinlock) an=
d
  performing the grab (which takes the spinlock on its own);
=2D if anything will try to grab space during discarding, it will get an =
ENOSPC,
  while it's better to make the process wait until discarding is comple=
ted.

I'm not sure whether the last problem really exists (there is BA_CAN_CO=
MMIT,
but I don't know whether is it used consistently where possible).

Could you explain these things?

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart6869975.uAER6AFDZ4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlPaq3oACgkQxUKljSIMAnBmzAD/aKWZjXPtHMWfWEp0X1SIb4SJ
m5KIAl6iSsdM3yOuXokBAIT8k25TE3O1k174ylBZMdpgVOLohrPeUnzfELN8PpgE
=joYb
-----END PGP SIGNATURE-----

--nextPart6869975.uAER6AFDZ4--

