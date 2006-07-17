From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH] reiserfs: fix handling of device names with /'s in them
Date: Mon, 17 Jul 2006 12:05:33 -0400
Message-ID: <44BBB54D.1000509@suse.com>
References: <6xQ4C-6NB-43@gated-at.bofh.it>	<6xQea-6ZX-13@gated-at.bofh.it>	<E1G1QFx-0001IO-K6@be1.lrz>	<44B7D97B.20708@suse.com>	<44B9E6D5.2040704@namesys.com>	<44BA61A2.5090404@suse.com>	<44BA8214.7040005@namesys.com>	<44BABB14.6070906@suse.com>	<44BAE619.9010307@namesys.com>	<44BAECE2.8070301@suse.com>	<44BAFDC3.7020301@namesys.com>	<44BB0146.7080702@suse.com>	<44BB3C42.1060309@namesys.com>	<44BBA4CF.8020901@suse.com> <17595.44857.845209.442959@fisica.ufpr.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29033-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <17595.44857.845209.442959@fisica.ufpr.br>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Carlos Carvalho <carlos@fisica.ufpr.br>
Cc: ReiserFS List <reiserfs-list@namesys.com>, Andrew Morton <akpm@osdl.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Carlos Carvalho wrote:
> Shouldn't the replacement of / by some other character be done for all
> filesystems? If so shouldn't it be done in a single point for all of
> them? Isn't this the purpose of VFS?

This only applies to a corner case where the file system wants to use
the block device name as a pathname. In any other case, interpreting the
/ as a path separator would be the correct behavior. While a helper
function/macro may be appropriate, I don't think the VFS has any
business interpreting names automatically like that.

As stated before numerous times by both Andrew and myself, the correct
solution is to eliminate / from block device names. This patch was a
band-aid until that's done.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFEu7VNLPWxlyuTD7IRAinwAJ43vf+NHkI/U/sA743174o68xw5UQCfaL1z
N367ixvf/HeQuWHZH0CkjVY=
=4+dh
-----END PGP SIGNATURE-----
