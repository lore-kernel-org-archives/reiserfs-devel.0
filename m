From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Trying to mount ReiserFS file system read only results in change
Date: Tue, 20 Dec 2005 15:05:52 +0300
Message-ID: <43A7F3A0.6010004@namesys.com>
References: <20051219193157.70430.qmail@web34610.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000903050302000200060305"
Return-path: <reiserfs-list-return-27455-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051219193157.70430.qmail@web34610.mail.mud.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Linux Tard <linuxtard@yahoo.com>
Cc: reiserfs-list@namesys.com, Chris Mason <mason@suse.com>, Jeff Mahoney <jeffm@suse.com>

--------------000903050302000200060305
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello

Linux Tard wrote:
> Hi Vladimir,
> 
> Thank you again for replies.  
> 
> 
> 
> --- "Vladimir V. Saveliev" <vs@namesys.com> wrote:
>>reiserfs has to replay journal before it can access
>>any data. Even if it is
>>mounting readonly. Journal replay code does not
>>distinguish whether filesystem
>>is being mounted read-only or not. So, it just
>>replays journal and updates few
>>counters. If filesystem was umounted clean - no
>>transactions are replayed, but
>>counters still get updated.
> 
> Thank you for informational reply here.  This makes
> sense, and we will note the reply, but in some
> industry mounting read-only means truly read only with
> nothing changed.  Computer forensics, one example.  If
> we want to preview the file system before we acquire
> we must mount read-only.  But journal increment
> changes data, minimal as it is, the authentication no
> longer matches and opposing counsel swoop in like
> vultures.  
> 

Yes, this is known problem, I remember that it was discussed some time ago, but
I do not rememeber that there was found any reasonable solution. There was  an
idea to keep journal replay changes in memory when mounting readonly, but I do
not think that it has even been implemented.

> 
>>>and ultimately C) is there something
>>>else besides changing source code to stop this?
>>>
>>Please send your patch so that we could see first
>>what you have done already.
>>
> 
> What we have done is change two lines in kernel
> source, fs/reiserfs/journal.c from;
> 
>  SB_JOURNAL(p_s_sb)->j_mount_id =
> le32_to_cpu(jh->j_mount_id) + 1;
> } else {
>  SB_JOURNAL(p_s_sb)->j_mount_id = newest_mount_id + 1
> ;
> 
> 
> to;
> 
>  SB_JOURNAL(p_s_sb)->j_mount_id =
> le32_to_cpu(jh->j_mount_id) + 0;
> } else {
>  SB_JOURNAL(p_s_sb)->j_mount_id = newest_mount_id + 0
> ;
> 
I do not think that this is  a good way.

> 
> This has work for us - when we mount using this kernel
> ReiserFS file systems do not change - the
> authentication pre and post are equivalent.
> 
> We would never mount a ReiserFS file system we wish to
> write to with this kernel, only those we preview.  
> 
> It would be nice to have a mount option that would not
> increment journal count instead of going this kernel
> route.
> 

I would propose the following patch.


--------------000903050302000200060305
Content-Type: text/plain;
 name="reiserfs-dont-update-journla-header-mounting-readonly.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiserfs-dont-update-journla-header-mounting-readonly.patch"


This patch makes reiserfs to avoid journal header update when filesystem is being mounted readonly.


 fs/reiserfs/journal.c |    1 +
 1 files changed, 1 insertion(+)

diff -puN fs/reiserfs/journal.c~reiserfs-dont-update-journla-header-mounting-readonly fs/reiserfs/journal.c
--- linux-2.6.15-rc5-mm3/fs/reiserfs/journal.c~reiserfs-dont-update-journla-header-mounting-readonly	2005-12-20 13:09:28.000000000 +0300
+++ linux-2.6.15-rc5-mm3-vs/fs/reiserfs/journal.c	2005-12-20 13:10:51.000000000 +0300
@@ -2458,6 +2458,7 @@ static int journal_read(struct super_blo
 			      replay_count, get_seconds() - start);
 	}
 	if (!bdev_read_only(p_s_sb->s_bdev) &&
+	    !(p_s_sb->s_flags & MS_RDONLY) &&
 	    _update_journal_header_block(p_s_sb, journal->j_start,
 					 journal->j_last_flush_trans_id)) {
 		/* replay failed, caller must call free_journal_ram and abort

_

--------------000903050302000200060305--
