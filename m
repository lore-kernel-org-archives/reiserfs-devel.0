From: Pavel Bartusek <pba@sysgo.com>
Subject: Bugs on big endian systems
Date: Wed, 03 Mar 2004 14:01:57 +0100
Message-ID: <4045D745.8070204@sysgo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020508010406070707020901"
Return-path: <reiserfs-list-return-17043-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs-List@namesys.com

--------------020508010406070707020901
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit

Hi list,

The attached patch will fix the bugs which appears only on big endian 
systems in the kernel 2.4.25.

regards


Pavel Bartusek
Software Engineering

SYSGO Real-Time Solutions AG | Embedded and Real-Time Software
Lise-Meitner-Str.15
89081 Ulm, Germany

Voice: +49-731-9533-1295
FAX:   +49-731-94683-10
www.sysgo.com | www.elinos.com | www.osek.de

--------------020508010406070707020901
Content-Type: text/plain;
 name="big_endian_fixup.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="big_endian_fixup.patch"

--- linux.ori/fs/reiserfs/journal.c	Mon Aug 25 13:44:43 2003
+++ linux/fs/reiserfs/journal.c	Wed Mar  3 13:26:23 2004
@@ -2094,7 +2094,7 @@
      
     /* make sure that journal matches to the super block */
     if (is_reiserfs_jr(rs) && 
-        jh->jh_journal.jp_journal_magic != sb_jp_journal_magic(rs)) {
+        le32_to_cpu (jh->jh_journal.jp_journal_magic) != sb_jp_journal_magic(rs)) {
 	char jname[ 32 ];
 	char fname[ 32 ];
 	 
@@ -2102,7 +2102,7 @@
 	strcpy( fname, kdevname( p_s_sb->s_dev ) );
 	printk("journal-460: journal header magic %x (device %s) does not "
 	       "match magic found in super block %x (device %s)\n",
-		jh->jh_journal.jp_journal_magic, jname,
+		le32_to_cpu (jh->jh_journal.jp_journal_magic), jname,
 		sb_jp_journal_magic(rs), fname);
 	brelse (bhjh);
 	goto free_and_return;
--- linux.ori/include/linux/reiserfs_fs.h	Mon Aug 25 13:44:44 2003
+++ linux/include/linux/reiserfs_fs.h	Wed Mar  3 13:25:45 2004
@@ -219,7 +219,7 @@
 #define SB_ONDISK_JOURNAL_DEVICE(s) \
          le32_to_cpu ((SB_ONDISK_JP(s)->jp_journal_dev))
 #define SB_ONDISK_RESERVED_FOR_JOURNAL(s) \
-         le32_to_cpu ((SB_V1_DISK_SUPER_BLOCK(s)->s_reserved_for_journal))
+         le16_to_cpu ((SB_V1_DISK_SUPER_BLOCK(s)->s_reserved_for_journal))
 
 #define is_block_in_log_or_reserved_area(s, block) \
          block >= SB_JOURNAL_1st_RESERVED_BLOCK(s) \

--------------020508010406070707020901--

