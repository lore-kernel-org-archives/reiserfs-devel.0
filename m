From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Bugs on big endian systems
Date: Wed, 03 Mar 2004 16:29:35 -0500
Message-ID: <40464E3F.4030809@suse.com>
References: <4045D745.8070204@sysgo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17052-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4045D745.8070204@sysgo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pavel Bartusek <pba@sysgo.com>
Cc: Reiserfs-List@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Pavel -

Thanks. The good news is that the filesystem wouldn't have panicked
because of the SB_ONDISK_RESERVED_FOR_JOURNAL(s) bug. The bad news is
that it wouldn't have mattered because the filesystem could never have
been mounted anyway due to the journal header version mismatch.

I'm surprised nobody's ever tried to mount a relocated journal enabled
filesystem on a big endian machine.

Hans -

This bug appears in both 2.4 and 2.6 kernels and should be fixed in both.

- -Jeff

Pavel Bartusek wrote:
| Hi list,
|
| The attached patch will fix the bugs which appears only on big endian
| systems in the kernel 2.4.25.
|
| regards
|
|
| Pavel Bartusek
| Software Engineering
|
| SYSGO Real-Time Solutions AG | Embedded and Real-Time Software
| Lise-Meitner-Str.15
| 89081 Ulm, Germany
|
| Voice: +49-731-9533-1295
| FAX:   +49-731-94683-10
| www.sysgo.com | www.elinos.com | www.osek.de
|
|
| ------------------------------------------------------------------------
|
| --- linux.ori/fs/reiserfs/journal.c	Mon Aug 25 13:44:43 2003
| +++ linux/fs/reiserfs/journal.c	Wed Mar  3 13:26:23 2004
| @@ -2094,7 +2094,7 @@
|
|      /* make sure that journal matches to the super block */
|      if (is_reiserfs_jr(rs) &&
| -        jh->jh_journal.jp_journal_magic != sb_jp_journal_magic(rs)) {
| +        le32_to_cpu (jh->jh_journal.jp_journal_magic) !=
sb_jp_journal_magic(rs)) {
|  	char jname[ 32 ];
|  	char fname[ 32 ];
|  	
| @@ -2102,7 +2102,7 @@
|  	strcpy( fname, kdevname( p_s_sb->s_dev ) );
|  	printk("journal-460: journal header magic %x (device %s) does not "
|  	       "match magic found in super block %x (device %s)\n",
| -		jh->jh_journal.jp_journal_magic, jname,
| +		le32_to_cpu (jh->jh_journal.jp_journal_magic), jname,
|  		sb_jp_journal_magic(rs), fname);
|  	brelse (bhjh);
|  	goto free_and_return;
| --- linux.ori/include/linux/reiserfs_fs.h	Mon Aug 25 13:44:44 2003
| +++ linux/include/linux/reiserfs_fs.h	Wed Mar  3 13:25:45 2004
| @@ -219,7 +219,7 @@
|  #define SB_ONDISK_JOURNAL_DEVICE(s) \
|           le32_to_cpu ((SB_ONDISK_JP(s)->jp_journal_dev))
|  #define SB_ONDISK_RESERVED_FOR_JOURNAL(s) \
| -         le32_to_cpu
((SB_V1_DISK_SUPER_BLOCK(s)->s_reserved_for_journal))
| +         le16_to_cpu
((SB_V1_DISK_SUPER_BLOCK(s)->s_reserved_for_journal))
|
|  #define is_block_in_log_or_reserved_area(s, block) \
|           block >= SB_JOURNAL_1st_RESERVED_BLOCK(s) \


- --
Jeff Mahoney
SuSE Labs
jeffm@suse.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFARk4/LPWxlyuTD7IRAkIZAJ0VR8aYna2n3EK/BfZ2SBwKOe9OPQCfYzDH
c8D4gSwDzr93HivtH2FMx5M=
=Jj1U
-----END PGP SIGNATURE-----
