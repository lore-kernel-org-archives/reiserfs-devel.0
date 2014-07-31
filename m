From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Fwd: reiser4: FITRIM ioctl -- how to grab the space?
Date: Fri, 01 Aug 2014 00:49:05 +0400
Message-ID: <1829674.oYUdLFIApn@intelfx-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2387782.sMP0zpTAYx"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:mime-version
         :content-type;
        bh=wCDOPi7tkFe3g0tFkhKydkNXw7024cKfCVYoLy15vdM=;
        b=VMMscmEGE2N1C0bSMgopBm5B8TzJeHzjXkeNgSFtrRHalCn9QJUbDdPmW3HIcsd833
         2Gshsz4KDcSChRYcyuw9t/X0gc82sZNU82ZDZQ9EGo3lSbtZjwYopySXxzUT8uTq40d+
         MOG//4dYyawbDlxP8ASFCE2EYmJaRqdzLGcWJjNWfxFof1Gef8zhROZQpWzgr25k6NF0
         tYxeMq3ubpt43YyV7bSRVk2pJDkc9z68/aq302ulXGurGOnxnle4KU2RH5OM3v7mV5Wo
         WUKOlxib37mX65gkXg1RXCeA7DF0AbNBkcoftrmh0DOwCPMdMtCMpS6JaZVpxxgNXeEx
         whCw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>


--nextPart2387782.sMP0zpTAYx
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

(resend -- forgot the Cc:, sorry for spamming)

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
--nextPart2387782.sMP0zpTAYx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlPaq8EACgkQxUKljSIMAnDK0wD9GNAaUakAgxMFIXUIH6RmT+Zv
OKW5UPbIwcjv9tA/2dYA/jm8LxBTHioixIIa5LfmZEYUJFV6WQpk6eY6c3NsnaK3
=Pnqy
-----END PGP SIGNATURE-----

--nextPart2387782.sMP0zpTAYx--

