From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Trying to mount ReiserFS file system read only results in change
Date: Fri, 23 Dec 2005 18:03:17 +0300
Message-ID: <43AC11B5.1060803@namesys.com>
References: <20051222204321.639.qmail@web34606.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060001080302000008050709"
Return-path: <reiserfs-list-return-27498-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051222204321.639.qmail@web34606.mail.mud.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Linux Tard <linuxtard@yahoo.com>
Cc: reiserfs-list@namesys.com, Chris Mason <mason@suse.com>, Jeff Mahoney <jeffm@suse.com>

--------------060001080302000008050709
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello

Linux Tard wrote:
> Hi Vladimar,
> 
> Thank you again.  
> 
> --- "Vladimir V. Saveliev" <vs@namesys.com> wrote:
>>I do not think that this is  a good way.
>>
> 
> Why is this?  

reiserfs used to increment mount id on each mount. Not updating it might confuse
code which relays on that fact: journal replay and/or reiserfsck.

> Is there something else other than
> preventing journal increment this would do?  Again, we
> use this kernel only in certain situations.
> 
>>I would propose the following patch.
>> 
>> fs/reiserfs/journal.c |    1 +
>> 1 files changed, 1 insertion(+)
>>
>>diff -puN
>>
> fs/reiserfs/journal.c~reiserfs-dont-update-journla-header-mounting-readonly
>>fs/reiserfs/journal.c
>>---
>>
> linux-2.6.15-rc5-mm3/fs/reiserfs/journal.c~reiserfs-dont-update-journla-header-mounting-readonly
>>2005-12-20 13:09:28.000000000 +0300
>>+++ linux-2.6.15-rc5-mm3-vs/fs/reiserfs/journal.c
>>2005-12-20 13:10:51.000000000 +0300
>>@@ -2458,6 +2458,7 @@ static int journal_read(struct
>>super_blo
>> 			      replay_count, get_seconds() - start);
>> 	}
>> 	if (!bdev_read_only(p_s_sb->s_bdev) &&
>>+	    !(p_s_sb->s_flags & MS_RDONLY) &&
>> 	    _update_journal_header_block(p_s_sb,
>>journal->j_start,
>> 					 journal->j_last_flush_trans_id)) {
>> 		/* replay failed, caller must call
>>free_journal_ram and abort
> 
> We not able to test this patch.  We're using 2.4.32
> kernel.  Output of patch;
> 
> [root@dumb linux-2.4.32]# patch -p1 <
> reiserfs_dont_update_journla_header_mounting_readonly.patch
>  --dry-run
> patching file fs/reiserfs/journal.c
> Hunk #1 FAILED at 2458.
> 1 out of 1 hunk FAILED -- saving rejects to file
> fs/reiserfs/journal.c.rej
> [root@dumb linux-2.4.32]#
> 
> And the REJ file;
> 
> [root@dumb reiserfs]# more journal.c.rej 
> ***************
> *** 2458,2463 ****
>                               replay_count,
> get_seconds() - start);
>         }
>         if (!bdev_read_only(p_s_sb->s_bdev) &&
>             _update_journal_header_block(p_s_sb,
> journal->j_start,
>                                         
> journal->j_last_flush_trans_id)) {
>                 /* replay failed, caller must call
> free_journal_ram and abort
> --- 2458,2464 ----
>                               replay_count,
> get_seconds() - start);
>         }
>         if (!bdev_read_only(p_s_sb->s_bdev) &&
> +           !(p_s_sb->s_flags & MS_RDONLY) &&
>             _update_journal_header_block(p_s_sb,
> journal->j_start,
>                                         
> journal->j_last_flush_trans_id)) {
>                 /* replay failed, caller must call
> free_journal_ram and abort
> [root@dumb reiserfs]#
> 
> 
> 
> 
> 
> I'm guessing you made patch for 2.6 kernel?  Or
> failure for some other reason?  

yes, it was for 2.6. Please try the attached, it is for 2.4.32.

> We have to use 2.4 series kernel now.  Would you be
> able to write this patch for 2.4 kernel if it was for
> 2.6?
> 
> kind regards,
> -lt
> 
> 
> 
> 	
> 		
> __________________________________ 
> Yahoo! for Good - Make a difference this year. 
> http://brand.yahoo.com/cybergivingweek2005/
> 
> 


--------------060001080302000008050709
Content-Type: text/plain;
 name="reiserfs-dont-update-journla-header-mounting-readonly.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiserfs-dont-update-journla-header-mounting-readonly.patch"


This patch makes reiserfs to avoid journal header update when filesystem is being mounted readonly.

diff -puN fs/reiserfs/journal.c~reiserfs-dont-update-journla-header-mounting-readonly fs/reiserfs/journal.c


 fs/reiserfs/journal.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletion(-)

diff -puN fs/reiserfs/journal.c~reiserfs-dont-update-journla-header-mounting-readonly fs/reiserfs/journal.c
--- linux-2.4.32/fs/reiserfs/journal.c~reiserfs-dont-update-journla-header-mounting-readonly	2005-12-23 17:54:14.222498915 +0300
+++ linux-2.4.32-vs/fs/reiserfs/journal.c	2005-12-23 17:57:46.063947196 +0300
@@ -1804,7 +1804,8 @@ start_log_replay:
     printk("reiserfs: replayed %d transactions in %lu seconds\n", replay_count, 
 	    CURRENT_TIME - start) ;
   }
-  if (!is_read_only(p_s_sb->s_dev) && 
+  if (!is_read_only(p_s_sb->s_dev) &&
+      !(p_s_sb->s_flags & MS_RDONLY) &&
        _update_journal_header_block(p_s_sb, SB_JOURNAL(p_s_sb)->j_start, 
                                    SB_JOURNAL(p_s_sb)->j_last_flush_trans_id))
   {

_

--------------060001080302000008050709--
