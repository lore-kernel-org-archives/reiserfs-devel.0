From: Joachim Reichelt <Reichelt@gbf.de>
Subject: Re: Lost ACL
Date: Thu, 19 Feb 2004 17:56:14 +0100
Message-ID: <4034EAAE.2050908@gbf.de>
References: <402CE469.4010809@gbf.de>	<402D1B26.3040009@suse.com> <16429.7163.319615.173151@laputa.namesys.com> <402D37F5.9040008@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16857-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <402D37F5.9040008@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Nikita Danilov <Nikita@Namesys.COM>, reiserfs-list@Namesys.COM



Jeff Mahoney schrieb am 02/13/2004 09:47 PM:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Nikita Danilov wrote:
> |  > The .reiserfs_priv/xattr hierarchy is how my xattr/acl code 
> stores the
> |  > ACLs without a disk format change. The hex numbers are
> |  > <objectid>.<generation number>, and then the individual xattrs are
> |  > stored inside that directory with their name as the filenames.
> |  >
> |  > This directory is hidden (and used to find ACLs) when ACLs or
> xattrs are
> |  > enabled. Is your filesystem mounted with -oacl?
> |
> | As Vladimir suggested, it may be fsck that "restored" .reiserfs_priv 
> and
> | made it visible.
>
> No, the fact that it may have been "restored" is irrelevant. The
> .reiserfs_priv directory doesn't employ reiserfs hidden directory
> entries - it's hidden by loading the directory entry at filesystem
> mount, and then poisoning the results of reiserfs_lookup() and
> reiserfs_readdir().

Dear all,

i just got 2.4.25 up.
But there is no ACL anywhere in the kernel.
Do I have to patch something
I found ACL in ext3, xfs....
And in fs/reiserfs/super.c is:
~617:
    opt_desc_t opts[] = {
                {"tails", 't', tails, 0, 0},
                /* Compatibility stuff, so that -o notail
                   for old setups still work */
                {"notail", 0, 0, 0, 
(1<<REISERFS_LARGETAIL)|(1<<REISERFS_SMALLTAIL)},
                {"conv", 0, 0, 1<<REISERFS_CONVERT, 0},
                {"nolog", 0, 0, 0, 0}, /* This is unsupported */
                {"replayonly", 0, 0, 1<<REPLAYONLY, 0},

                {"block-allocator", 'a', balloc, 0, 0},
                {"hash", 'h', hash, 1<<FORCE_HASH_DETECT, 0},

                {"resize", 'r', 0, 0, 0},
                {"attrs", 0, 0, 1<<REISERFS_ATTRS, 0},
                {"noattrs", 0, 0, 0, 1<<REISERFS_ATTRS},
                {NULL, 0, 0, 0, 0}

So there are NO ACLs in the code?????????

>
> - -Jeff
>
> - --
> Jeff Mahoney
> SuSE Labs
> jeffm@suse.com
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.2 (GNU/Linux)
> Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org
>
> iD8DBQFALTf1LPWxlyuTD7IRAv/XAJ474Bpj9DuSXAQy2lAbB/e30ZXEHgCeO8u3
> DkP+rb7X9c5nRBJPS1DUOd4=
> =EdYz
> -----END PGP SIGNATURE-----


-- 
Mit freundlichen Gruessen                         Best Regards
 
         Joachim Reichelt

WWW: http://www.gbf.de         _/_/_/   _/_/_/   _/_/_/_/
WWW: http://www.gbf.de/sb    _/    _/  _/   _/  _/
                            _/        _/   _/  _/
Mascheroder Weg 1          _/  _/    _/_/_/   _/_/_/
D-38124 Braunschweig      _/    _/  _/   _/  _/
Tel: +(49) 531 6181 352  _/    _/  _/   _/  _/
FAX: +(49) 531 2612 388   _/_/_/  _/_/_/   _/

			SB  - Strukturbiologie
              GBF - Gesellschaft fuer Biotechnologische Forschung
                    German Research Centre for Biotechnology

See me at:
EMAIL: REICHELT@gbf.de    WWW:  http://www.gbf.de/sb/Reichelt.htm

-- Disclaimer --
Standard > Keyword : Opinions, my own, nobody else's, whatsoever ...

Man muss sich notfalls jemand mieten,
hat man an Geist selbst nichts zu bieten!     (Heinz Erhardt)

