From: Jan Kara <jack@ucw.cz>
Subject: Re: Status of quota support for reiserfs on 2.6.x kernels
Date: Tue, 4 Jan 2005 18:52:58 +0100
Message-ID: <20050104175258.GJ28019@atrey.karlin.mff.cuni.cz>
References: <20041123105332.02470503.philippe.gramoulle@mmania.com> <200411231406.43497.christian.mayrhuber@gmx.net> <loom.20041215T011250-550@post.gmane.org> <20041215133805.GE25999@atrey.karlin.mff.cuni.cz> <20041228205503.GA17689@trillke.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="ZfOjI3PrQbgiZnxM"
Return-path: <reiserfs-list-return-23038-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20041228205503.GA17689@trillke.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: klaus thorn <klaus@trillke.net>
Cc: reiserfs-list@namesys.com, edv@trillke.net

--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  Sorry for a bit late reply but I was on a holidays.

> On Wed, Dec 15, 2004 at 02:38:06PM +0100, Jan Kara wrote:
> > > I tried to use quota with 2.6.7 and got two serious problems
> >   I suggest trying some newer kernel - either 2.6.10-rc3-mm1 or
> > just plain 2.6.10-rc3 with attached patch applied (the patch fixes the
> > deadlock you seem to hit).
> 
> It tried the latter on another server and the filesystem was accessible
> at all time but other problems occured (maybe not quota-related) that made
> my co-admins downgrade to 2.6.9:
> 
> 1. suddenly, after running the patched kernel for days,
> su, sudo and authentication through courier webmailer was not possible,
> ssh-root-login went fine. After reboot problem was gone but pam_rootok.so
> was missing (file system curruption?)
  Are there any error messages in the log? If that was filesystem
corruption there should be some.... Otherwise it's hard to guess what
was going on.

> 2. after a few hours stress-testing the quota-partition:
> kernel crash: code ff 21 e2 8b 0a ...
> ... 76 60 e0 ff 6a 00
> kernel BUG at lib/kernel_lock:120!
> invalid operand: 0000
  This does not look nice. Do you have all the error message? From this
part it's hard to guess what has happened.

> Do you think they are quota-related or related to you quota-fixall patch?
  They might be - you can try to stress-test the filesystem without
quotas enabled and see if some error occurs.

> Is your fix appliable for vanilla 2.6.10 or is it already integrated
> or is there a newer patch?
  The patch I sent you should be applicable to 2.6.10 kernel. There's also one
other bugfix to my quota-fixall patch which I attached (but you don't seem to
actually hit that problem).

								Honza

--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="reiserfs-do-not-clear-MS_ACTIVE.patch"


When CONFIG_QUOTA is defined reiserfs's finish_unfinished sets and clears
MS_ACTIVE bit in s_flags field of super block. If that bit was set already
it should not be set.


 fs/reiserfs/super.c |   13 ++++++++++---
 1 files changed, 10 insertions(+), 3 deletions(-)

diff -puN fs/reiserfs/super.c~reiserfs-do-not-clear-MS_ACTIVE fs/reiserfs/super.c
--- linux-2.6.10-rc3-mm1/fs/reiserfs/super.c~reiserfs-do-not-clear-MS_ACTIVE	2004-12-23 18:22:06.568755520 +0300
+++ linux-2.6.10-rc3-mm1-vs/fs/reiserfs/super.c	2004-12-23 18:22:06.576756006 +0300
@@ -158,6 +158,7 @@ static int finish_unfinished (struct sup
     int truncate;
 #ifdef CONFIG_QUOTA
     int i;
+    int ms_active_set;
 #endif
  
  
@@ -168,7 +169,12 @@ static int finish_unfinished (struct sup
 
 #ifdef CONFIG_QUOTA
     /* Needed for iput() to work correctly and not trash data */
-    s->s_flags |= MS_ACTIVE;
+    if (s->s_flags & MS_ACTIVE) {
+	    ms_active_set = 0;
+    } else {
+	    ms_active_set = 1;
+	    s->s_flags |= MS_ACTIVE;
+    }
     /* Turn on quotas so that they are updated correctly */
     for (i = 0; i < MAXQUOTAS; i++) {
 	if (REISERFS_SB(s)->s_qf_names[i]) {
@@ -276,8 +282,9 @@ static int finish_unfinished (struct sup
             if (sb_dqopt(s)->files[i])
                     vfs_quota_off_mount(s, i);
     }
-    /* Restore the flag back */
-    s->s_flags &= ~MS_ACTIVE;
+    if (ms_active_set)
+	    /* Restore the flag back */
+	    s->s_flags &= ~MS_ACTIVE;
 #endif
     pathrelse (&path);
     if (done)

_

--ZfOjI3PrQbgiZnxM--
