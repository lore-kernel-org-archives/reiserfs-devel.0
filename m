From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Lost ACL
Date: Thu, 19 Feb 2004 12:33:37 -0500
Message-ID: <4034F371.8000001@suse.com>
References: <402CE469.4010809@gbf.de>	<402D1B26.3040009@suse.com> <16429.7163.319615.173151@laputa.namesys.com> <402D37F5.9040008@suse.com> <4034EAAE.2050908@gbf.de> <4034EEB2.6090208@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16860-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4034EEB2.6090208@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Joachim Reichelt <Reichelt@gbf.de>, Nikita Danilov <Nikita@Namesys.COM>, reiserfs-list@Namesys.COM

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jeff Mahoney wrote:
| Joachim Reichelt wrote:
| |> i just got 2.4.25 up.
| |> But there is no ACL anywhere in the kernel.
| |> Do I have to patch something
| |> I found ACL in ext3, xfs....
| |> So there are NO ACLs in the code?????????
|
| ACLs and Extended Attributes are an external patch. The SuSE kernels
| have them by default, which is why you were able to use them with your
| SuSE install. Periodically, I sync up the ACL code with the mainline
| kernels.
|
| Expect an updated version for 2.4.25 later today on my ftp site:
| ftp://ftp.suse.com/pub/people/jeffm/reiserfs/aclea/

To follow up; The 2.4.23 patches apply cleanly to 2.4.24 and 2.4.25.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
jeffm@suse.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFANPNxLPWxlyuTD7IRAt5XAKCVksCWf0+xWwJazaIlqLT5UiXfRQCeJrbx
5HZlQuQiM/AwfeJQ0Xqjl1k=
=ww5l
-----END PGP SIGNATURE-----
