From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Lost ACL
Date: Thu, 19 Feb 2004 12:29:18 -0500
Message-ID: <4034F26E.1000909@suse.com>
References: <402CE469.4010809@gbf.de> <402D1B26.3040009@suse.com> <40307380.7030909@gbf.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16859-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40307380.7030909@gbf.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Joachim Reichelt <Reichelt@gbf.de>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Joachim Reichelt wrote:

| when i do
| # mount -treiserfs -o acl /dev/sda9 /home/
| mount: wrong fs type, bad option, bad superblock on /dev/sda9,
|       or too many mounted file systems
|
| So I tried:
| # mount /home
| mount: wrong fs type, bad option, bad superblock on /dev/sda9,
|       or too many mounted file systems
|
| # grep sda9 /etc/fstab
| /dev/sda9            /home                reiserfs
| defaults,noatime,acl          1 2
|
| # mount /dev/sda9 /home
| -> successs
|
| # uname -a
| Linux zibsrv34 2.4.19-4GB #1 Fri Sep 13 13:14:56 UTC 2002 i686 unknown
|
| It is a default SuSE kernel. I cannot update at now, couse I have a
| IDE-Raid with binary only driver.

Sorry for the late reply, for some reason this didn't make it into my inbox.

If you're using a SuSE kernel from that time frame, it should definately
have ACLs built in to the reiserfs module.

What is the result of "zgrep CONFIG_REISERFS_FS_POSIX_ACL /proc/config.gz" ?

- -Jeff

- --
Jeff Mahoney
SuSE Labs
jeffm@suse.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFANPJuLPWxlyuTD7IRAk7sAJ9jpmUfbwyRiZyH2kzXNEIJgjZcOACfVIXP
haa/H1iKoHBqfZxEPecPmws=
=ElL5
-----END PGP SIGNATURE-----
