From: Linux Tard <linuxtard@yahoo.com>
Subject: Mounting ReiserFS 3.6 RO increments journal count ?
Date: Wed, 23 Feb 2005 12:56:53 -0800 (PST)
Message-ID: <20050223205654.75324.qmail@web41001.mail.yahoo.com>
References: <421CB91A.9060302@namesys.com>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <421CB91A.9060302@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I'm curious about a scenario I've been seeing and
working with.

My goal is to mount a ReiserFS-formatted filesystem
read only, truly read only, such that nothing is
updated (including metadata such as journal count).

Test bed is this;
- authenticate ReiserFS filesystem using 'md5sum'
- mount ReiserFS filesystem read only
- unmount 
- re-authenticate using 'md5um'.

Both sums should match.  But using 'mount' and and
options;
mount /dev/sda4 -o ro,nolog /mnt/here

FAILS.  It is read only.  But upon unmount the md5sum
no longer matches.  It appears the journal count is
incremented still even though it's mounted read only?

Is this true?

I've found two workarounds;
1) In /usr/src/kernel_version/fs/reiserfs I change the
'journal.c' file such that;

<ORIGINAL CODE>
/* j_start does not get set correctly if we don't
replay any transactions.
  ** if we had a valid journal_header, set j_start to
the first unflushed transaction value,
  ** copy the trans_id from the header
  */
  if (valid_journal_header && replay_count == 0) { 
    SB_JOURNAL(p_s_sb)->j_start =
le32_to_cpu(jh->j_first_unflushed_offset) ;
    SB_JOURNAL(p_s_sb)->j_trans_id =
le32_to_cpu(jh->j_last_flush_trans_id) + 1;
    SB_JOURNAL(p_s_sb)->j_last_flush_trans_id =
le32_to_cpu(jh->j_last_flush_trans_id) ;
    SB_JOURNAL(p_s_sb)->j_mount_id =
le32_to_cpu(jh->j_mount_id) + 1;
  } else {
    SB_JOURNAL(p_s_sb)->j_mount_id = newest_mount_id +
1 ;
</ORIGINAL CODE>


My changes made were;

SB_JOURNAL(p_s_sb)->j_mount_id =
le32_to_cpu(jh->j_mount_id) + 0;
  } else {
    SB_JOURNAL(p_s_sb)->j_mount_id = newest_mount_id +
0 ;

(Setting to '0' instead of '1').

Now when I when mount using;
mount -o ro,nolog /dev/sda4 /mnt/here

and then unmount the hash values (prior to mounting
and after mounting) equal one another.  

But, I feel this is bad.  Why I must have it not
change is for preview only, pure read only mode.  


The other option that works is;

md5sum /dev/sda4
losetup /dev/loopXXX /dev/sda4
mount -o ro,nolog /dev/loopXXX /mnt/here
umount /mnt/here
losetup -d /dev/loopXXX
md5sum /dev/sda4


Which of these two is the lesser of two evils?  Why
must the journal be incremented even when FS is
mounted read only?  

I've combed archives but haven't seen mention of it
yet? I've asked professor at school and he is not sure
why going through loop works (no change in filesystem
so hash matches) but not normal mount manner.

kind regards,
-lt


		
__________________________________ 
Do you Yahoo!? 
Read only the mail you want - Yahoo! Mail SpamGuard. 
http://promotions.yahoo.com/new_mail 
