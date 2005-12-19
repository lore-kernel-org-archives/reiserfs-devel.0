From: Linux Tard <linuxtard@yahoo.com>
Subject: Re: Trying to mount ReiserFS file system read only results in change
Date: Mon, 19 Dec 2005 11:31:57 -0800 (PST)
Message-ID: <20051219193157.70430.qmail@web34610.mail.mud.yahoo.com>
References: <43A6D87B.3090003@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-27444-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43A6D87B.3090003@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com, Chris Mason <mason@suse.com>

Hi Vladimir,

Thank you again for replies.  



--- "Vladimir V. Saveliev" <vs@namesys.com> wrote:
> reiserfs has to replay journal before it can access
> any data. Even if it is
> mounting readonly. Journal replay code does not
> distinguish whether filesystem
> is being mounted read-only or not. So, it just
> replays journal and updates few
> counters. If filesystem was umounted clean - no
> transactions are replayed, but
> counters still get updated.

Thank you for informational reply here.  This makes
sense, and we will note the reply, but in some
industry mounting read-only means truly read only with
nothing changed.  Computer forensics, one example.  If
we want to preview the file system before we acquire
we must mount read-only.  But journal increment
changes data, minimal as it is, the authentication no
longer matches and opposing counsel swoop in like
vultures.  


> > and ultimately C) is there something
> > else besides changing source code to stop this?
> > 
> Please send your patch so that we could see first
> what you have done already.
> 

What we have done is change two lines in kernel
source, fs/reiserfs/journal.c from;

 SB_JOURNAL(p_s_sb)->j_mount_id =
le32_to_cpu(jh->j_mount_id) + 1;
} else {
 SB_JOURNAL(p_s_sb)->j_mount_id = newest_mount_id + 1
;


to;

 SB_JOURNAL(p_s_sb)->j_mount_id =
le32_to_cpu(jh->j_mount_id) + 0;
} else {
 SB_JOURNAL(p_s_sb)->j_mount_id = newest_mount_id + 0
;


This has work for us - when we mount using this kernel
ReiserFS file systems do not change - the
authentication pre and post are equivalent.

We would never mount a ReiserFS file system we wish to
write to with this kernel, only those we preview.  

It would be nice to have a mount option that would not
increment journal count instead of going this kernel
route.

kind regards,
-lt


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
