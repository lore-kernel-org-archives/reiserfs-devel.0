From: Philippe Gramoulle <philippe.gramoulle@mmania.com>
Subject: Speedup patch for 2.4.19-pre6 in bitmap.c
Date: Wed, 10 Apr 2002 16:55:08 +0200
Message-ID: <20020410165508.D54344@off.aspic.com>
Reply-To: Philippe Gramoulle <philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10009-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Mailing List <reiserfs-list@namesys.com>


Hi Oleg,

As you seem to find the list quite calm, i will try to set a little bit of animation :o)

Here it goes: 

i'm trying to set up a 2.4.19-pre6 kernel with the following patches:

- NFS linux-2.4.19-NFS_ALL.dif  for pre6
- linux-2.4.19-12-neilb.dif     for pre6 for NFSv3 TCP

- Quota patches :
  - quota-v2-2.4.19-pre3: Jan Kara's v2 quota code
  - dquot_deadlock.diff.gz
  - nesting-10-2.4.19-pre3.diff.gz
  - reiserfs-quota-22.diff.gz
  - kinoded-8-2.4.19-pre3.diff.gz

- fs/dquot.c : change in sys_quotactl : remove the 
	       if (id & ~0xFFFF)
                goto out;
	       for 32 bits UIDs

- speedup patch for 2.4.19-pre6 recently posted to the list.


Patches apply correctly except one reject in bitmap.c when applying the speedup patch.

Here is the bitmap.c.rej:

***************
*** 122,128 ****
    set_sb_free_blocks( rs, sb_free_blocks(rs) + 1 );
  
    journal_mark_dirty (th, s, sbh);
-   s->s_dirt = 1;
  }
  
  void reiserfs_free_block (struct reiserfs_transaction_handle *th, 
--- 122,127 ----
    set_sb_free_blocks( rs, sb_free_blocks(rs) + 1 );
  
    journal_mark_dirty (th, s, sbh);
  }
  
  void reiserfs_free_block (struct reiserfs_transaction_handle *th, 

because of the addition from reiserfs-quota-22.diff :

+  if (for_unformatted) {
+#ifdef REISERQUOTA_DEBUG
+    printk(KERN_DEBUG "reiserquota: freeing block id=%u\n", inode->i_uid);
+#endif
+    DQUOT_FREE_BLOCK_NODIRTY(inode, 1);
+  }

Is this something i can blindly update by hand ,i mean manually remove "s->s_dirt = 1;" ?

I'll do so in the meantime and test it on our test bed system.

At the moment i'm pretty surprised by the NFSv3 TCP performance:
( 6.32 Mb/s for a single dd if=/dev/zero of =testfile bs=8192 count=25000 , 200Mb file)
( average of 460 Kb/s when uploading a 184Mo compiled kernel tree through FTP)

Before that i manage to get 10Mb/s on an eepro100 with vanilla 2.4.18 and NFS_ALL TCP from Trond
(either NFSv3 TCP or UDP)

Thanks,

Philippe.

PS: NFS server and client are Linux boxes running 2.4.18 and above kernel (from the 2.4.x series) both fully
reiserfs'ified
