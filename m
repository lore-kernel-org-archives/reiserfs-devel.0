From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [patch 00/40] reiserfs: patch queue (v2)
Date: Thu, 14 Jun 2007 15:41:08 -0400
Message-ID: <467199D4.3050901@suse.com>
References: <20070611190309.532091171@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20070611190309.532091171@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

jeffm@suse.com wrote:
> * Clean up do_balan.c (31-40)
>   - Factor out buffer_info initializations.
>   - Turn tb->s[12]num and tb[12]bytes into an array.
>   - Split balance_leaf from the 2500 line beast to more manageable chunks.
>   - Clean up balance_leaf_when_delete.
>   - Clean up comments.

Consider these unusable. They've been reliably introducing corruption on
my local machine.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD4DBQFGcZnULPWxlyuTD7IRAtpmAJd6y6x4+OQ3kvWO2tnsBCfD4SZfAKCZb3E+
sNkwhvMQEugLia0axi/18w==
=MK4x
-----END PGP SIGNATURE-----
