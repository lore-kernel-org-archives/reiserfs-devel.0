From: Joachim Reichelt <Reichelt@gbf.de>
Subject: Re: Lost ACL
Date: Mon, 16 Feb 2004 08:38:40 +0100
Message-ID: <40307380.7030909@gbf.de>
References: <402CE469.4010809@gbf.de> <402D1B26.3040009@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16799-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <402D1B26.3040009@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-list@namesys.com



Jeff Mahoney schrieb am 02/13/2004 07:44 PM:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Joachim Reichelt wrote:
> | Dear all,
> |
> | on SuSE 8.1 we have a fileserver with acl's on 500GB on a hardware 
> raid.
> | Now we had to powerdown the system. The controler seems to have not
> | properly written all data to disk. So i had to do a
> | reiserfsck --fix-fixable /dev/sda8
> |
> | This did nearly the whole job, but left me with a tree
> | ./.reiserfs_privat/xattr/ (size of dir is ~38MB)
> | The files thereis seems to be two hex numbers seperated by a dot e.g.
> | 12E63C.24C58
> | and no acl.
> | What can I do to get acl back?
> |
>
> The .reiserfs_priv/xattr hierarchy is how my xattr/acl code stores the
> ACLs without a disk format change. The hex numbers are
> <objectid>.<generation number>, and then the individual xattrs are
> stored inside that directory with their name as the filenames.
>
> This directory is hidden (and used to find ACLs) when ACLs or xattrs are
> enabled. Is your filesystem mounted with -oacl?
>
Dear all,

when i do
# mount -treiserfs -o acl /dev/sda9 /home/
mount: wrong fs type, bad option, bad superblock on /dev/sda9,
       or too many mounted file systems

So I tried:
# mount /home
mount: wrong fs type, bad option, bad superblock on /dev/sda9,
       or too many mounted file systems

# grep sda9 /etc/fstab
/dev/sda9            /home                reiserfs   
defaults,noatime,acl          1 2

# mount /dev/sda9 /home
-> successs

# uname -a
Linux zibsrv34 2.4.19-4GB #1 Fri Sep 13 13:14:56 UTC 2002 i686 unknown

It is a default SuSE kernel. I cannot update at now, couse I have a 
IDE-Raid with binary only driver.

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
> iD8DBQFALRslLPWxlyuTD7IRApbCAJ9f3B9rMpyv0Q56SRsMWsWuyTBA8ACgk6Uc
> wp668pLEYc8+fFvKFqzJ27M=
> =nqru
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

