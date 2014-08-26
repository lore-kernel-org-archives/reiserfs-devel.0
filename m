From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: What can I do next to use R4 partition  sdb
Date: Tue, 26 Aug 2014 11:03:35 +0400
Message-ID: <24322648.R9GnluWRk3@intelfx-laptop>
References: <114fff4391af47417e806586fb761345@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1615666.LCUHJIBpqz"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=0VDSuX7hcgTrWJq8/SI8Q6ExHkAipY0Vtknz8j4wDVo=;
        b=vVBdNIGih/rsf776YiJCwb3mKSBn2Te6moDBrsCCy2u6tkHNko9emsY5awqD6iM8z7
         bHRGkZVCBg0M03Ho2wBtAjkLQgCJ96At2mJnTgPFiSuGU9B1LSTlgU9pa+iQ6HqVS4fb
         n2IK2FPFiiew5a4v1xr80ODD6Ey2LcJSTp1kWO7DIeAJCElv5r4x9NCeHudPQQ2QB1Cp
         dPEv33ovTjDEIkc3sG0Y/1/MTDCIINYyb+wkVAYSnkc6CHDs27MrGOxOvaueqkDheiwE
         uPkcis8+muzSyNjdF4Rwp64yp94xmgiwGtX3PnlawNmY2W1qqQeb4IFQwhr1XCQ7YuSI
         Zsaw==
In-Reply-To: <114fff4391af47417e806586fb761345@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: doiggl@velocitynet.com.au


--nextPart1615666.LCUHJIBpqz
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Tuesday 26 August 2014 at 16:52:13, doiggl@velocitynet.com.au wrote:=
=09
> Hello.
> What can I do next to use R4 partition  sdb=20
> Thanks Glenn
>=20
> - What I have done so far:
>=20
> [...]
>
> [14041.917702] Loading Reiser4. See www.namesys.com for a description=
 of
> Reiser4.
> [14041.921930] reiser4: sdb: found disk format 4.0.0.
> [14152.798878] reiser4[mount(7623)]: traverse_tree
> (/home/abuild/rpmbuild/BUILD/kernel-reiser4-3.15.0/linux-3.15/fs/reis=
er4/search.c:725)[nikita-373]:
> WARNING: not found on internal node: level: 6, lock_level: 1, stop_le=
vel:
> 1 lock_mode: read, bias: exact
> [14152.798896] reiser4[mount(7623)]: key_warning
> (/home/abuild/rpmbuild/BUILD/kernel-reiser4-3.15.0/linux-3.15/fs/reis=
er4/plugin/file_plugin_common.c:512)[nikita-717]:
> WARNING: Error for inode 42 (-2)

Looks like the filesystem is damaged. Make sure that reiser4progs are i=
nstalled
and run

# fsck.reiser4 --build-fs /dev/sdb

(You may need to use --force because apparently you have R4 on a whole =
disk,
not on a partition.)

Hope that helps,
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart1615666.LCUHJIBpqz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlP8MUwACgkQxUKljSIMAnB3cQD+LmWkuu/S+gqlI8Z+aUEzYiG5
Nwj+cyjZA7HKjZdV0wIBANSb7x9oPjDbnI/20ZGkUFGOej7D76KU+2rzIMsDDQsu
=nqS9
-----END PGP SIGNATURE-----

--nextPart1615666.LCUHJIBpqz--

