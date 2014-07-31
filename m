From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: reiser4: FITRIM ioctl -- where to place the handler?
Date: Thu, 31 Jul 2014 18:23:59 +0400
Message-ID: <1888625.Xe1HFmG7T5@intelfx-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5062696.inTkE2rYaI"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:mime-version
         :content-type;
        bh=xwQt/C+7/dwYKL/wr52aOW+ciGlLMw3EwE3G9Csd7Ec=;
        b=sv3+p+NSSIYr1j6VlPjzLBvt8quPEvnSwH0NAGNF4dXg+BYfwxbojb+RwXg4GOoq5e
         ct61xCzOdfBtGxNg/6EQs2rwIllubOOBoemaU9jqJtQZvTiYaWXAvo13D8rpGjuCPFrT
         a89pISr3XiErG9vTI+1pDMgZ25AbvJTVtF1gHFTTouGknv4qPCtzdN5s05JENUT4sAGT
         6l4xxsgSvGffmg6LYyWrhl6zLhybln0TnHmk3+Z6/V1sDfHR2e5NgCHU9bPABTkBHRKr
         5N9nF9jG2xJFEojHsAMv3Ja1jbq3LQULYxSOuY7KaPb0Mr6iJfOrUtO4CU8aX8Syx8zG
         fTXA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>


--nextPart5062696.inTkE2rYaI
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

Hi,

I've started to iterate on the batch mode discard implementation for re=
iser4,
and the first question is -- where to place the ioctl handler?

From=20what I've been able to understand, we need something like
reiser4_ioctl_dir_common() in plugin/file_ops.c, pointer to which shoul=
d
become ->{unlocked,compat}_ioctl() of directory_f_ops in plugin/object.=
c.

However, in this case, what is DIRECTORY_FILE_PLUGIN_ID and correspondi=
ng
entry in file_plugins array in plugin/object.c? How is it related to
directories?

I see that its ->{inode,file,as}_ops are empty, so it probably does not=

participate in dispatching ioctls, but I'd like to make sure this is th=
e case.

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart5062696.inTkE2rYaI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlPaUX8ACgkQxUKljSIMAnA5HQEA2mkE2Nf6ffwQnhuWs1g9A9sa
a9l1Z3P3PZLFNm89sB4A/1KvvRfx4lEUAuOG9w2E78mFHvcd0lAK2zamPl3wLxnL
=GAKj
-----END PGP SIGNATURE-----

--nextPart5062696.inTkE2rYaI--

