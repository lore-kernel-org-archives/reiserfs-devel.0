From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: reiser4 ; regressions in 2.6.14-rc1-mm1
Date: Sat, 24 Sep 2005 23:11:50 +0400
Message-ID: <200509242311.50652.zam@namesys.com>
References: <dgpm57$i5s$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26267-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <dgpm57$i5s$1@sea.gmane.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Laurent Riffard <laurent.riffard@free.fr>

On Tuesday 20 September 2005 22:58, Laurent Riffard wrote:
> Hello,
>
> In kernel 2.6.14-rc1-mm1, Reiser4 present 2 regressions with regard to
> 2.6.13-mm1 :
>
> A) Suspend-to-disk does not work because the process "[ent:hda8]" can't be
> stopped.
>
> $ mount | grep hda8
> /dev/hda8 on /home/laurent/kernel type reiser4 (rw,nosuid,nodev)
>
> Extract of the log  :
> Restarting tasks...<6> Strange, ent:hda8. not stopped

would you please try to change fs/reiser4/entd.c:
----------------------------------------------
diff --git a/entd.c b/entd.c
--- a/entd.c
+++ b/entd.c
@@ -173,7 +173,7 @@ static int entd(void *arg)
 		{
 			DEFINE_WAIT(__wait);
 
-			for (;;) {
+			do {
 				prepare_to_wait(&ent->wait, &__wait, TASK_INTERRUPTIBLE);
 				if (kthread_should_stop()) {
 					done = 1;
@@ -182,7 +182,7 @@ static int entd(void *arg)
 				if (ent->nr_all_requests != 0)
 					break;
 				schedule();
-			}
+			} while (0);
 			finish_wait(&ent->wait, &__wait);
 		}
 	}
----------------------------------------------


>
> I have already mentioned this in another mail to this list, it was done
> with a modified 2.6.14-rc1-mm1 kernel from Andrew Morton (without the input
> subsystem changes) plus vm-swap_prefetch-8.patch. I can now confirm the
> regression on a plain 2.6.14-rc1-mm1 without any additional patch.
>
> B) Can't mount a loop file on reiser4 :
>
> [root@antares ~]# mount /mnt/diske
> [root@antares ~]# mount | grep diske
> /dev/hdb8 on /mnt/diske type reiser4 (rw,noexec,nosuid,nodev)
> [root@antares ~]# cd /mnt/diske/laurent/download/Mandriva-Linux-2006-0.5/
> [root@antares Mandriva-Linux-2006-0.5]# mount -t iso9660 -oloop,ro
> Mandriva-Linux-Free-2006-0.5-CD1.i586.iso /mnt/disk mount: wrong fs type,
> bad option, bad superblock on /dev/loop0,
>        missing codepage or other error
>        In some cases useful info is found in syslog - try
>        dmesg | tail  or so
>
> If I copy this file to a reiser filesystem, I can mount it without any
> problem.
>
> Feel free to ask for more details.
> ~~
> laurent

