From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: reiserfs3, rsync and hardlinks
Date: Mon, 07 Feb 2005 13:22:51 +0300
Message-ID: <1107771769.9024.119.camel@tribesman.namesys.com>
References: <20050206034102.3956432d@polo.concept-micro.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-b9saAsZmXjhfn/2fBWzx"
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050206034102.3956432d@polo.concept-micro.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Pierre Etchemaite <petchema@concept-micro.com>
Cc: reiserfs-list@namesys.com

--=-b9saAsZmXjhfn/2fBWzx
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello

On Sun, 2005-02-06 at 05:41, Pierre Etchemaite wrote:
> 	Hi all,
> 
> I'm using rsync to make a full backup of one box to another. Both are using
> reiserfs 3.6.
> The problem is that at the end of the backup, some pairs of unrelated files
> (usually 3 or 4), are hardlinked together.
> 
> >From what I've read in rsync mailing list archives, it probably means that
> inode numbers are being reused while the backup is in progress.
> 
> Does that look plausible to you ?
> 

yes, reiserfs reuses inode number of removed files for newly created
files. However, ext2 also does that. Have  you ever noticed this problem
on other filesystems?

You can try to make reiserfs to not free inode numbers of removed files
with the attached patch and check whether it helps. It decreases number
of files which can be created on a filesystem to ~2^^32.
I am not sure if it is enough for low traffic IMPA server.
 

> And if it is, what can be done to significantly lower the probability of
> inode number reuse over a short time ? The backup shouldn't take over 1
> hour, the server stores around 570k files, but it's only a quite low traffic
> IMAP server, so even with 32 bits inode numbers there's probably some room
> for improvement.
> 
> I know a definitive answer would be to backup filesystem snapshots, but the
> source server isn't currently using LVM1, and as far as I know snapshots
> haven't been reimplemented yet for LVM2 :(
> 
> Best regards,
> Pierre.
> 

--=-b9saAsZmXjhfn/2fBWzx
Content-Disposition: attachment; filename=reiserfs-dont-free-objectid.patch
Content-Type: text/plain; name=reiserfs-dont-free-objectid.patch; charset=koi8-r
Content-Transfer-Encoding: 7bit

 fs/reiserfs/objectid.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

diff -puN fs/reiserfs/objectid.c~reiserfs-dont-free-objectid fs/reiserfs/objectid.c
--- linux-2.6.9/fs/reiserfs/objectid.c~reiserfs-dont-free-objectid	2005-02-07 13:15:25.967303557 +0300
+++ linux-2.6.9-vs/fs/reiserfs/objectid.c	2005-02-07 13:15:42.576600790 +0300
@@ -99,7 +99,7 @@ void reiserfs_release_objectid (struct r
     __u32 * map = objectid_map (s, rs);
     int i = 0;
 
-    //return;
+    return;
     check_objectid_map (s, map);
 
     reiserfs_prepare_for_journal(s, SB_BUFFER_WITH_SB(s), 1) ;

_

--=-b9saAsZmXjhfn/2fBWzx--

