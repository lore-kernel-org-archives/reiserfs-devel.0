From: "Peter" <sw98234-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: r4 observations
Date: Wed, 20 Sep 2006 18:47:48 +0000 (UTC)
Message-ID: <ees2cj$15h$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29948-reiserfs=m.gmane.org-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-help: <mailto:reiserfs-list-help-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-post: <mailto:reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
Errors-To: flx-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org
Sender: news <news-WnDAp88bSu3NLxjTenLetw@public.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org

I booted from a non-reiser4 partition in order to make a backup of my main 
/ which was a r4 partition.

After the backup, I unmounted the drive explicitly, then rebooted.

I did not use the backed up drive for anything except tar-ring its files.

On next boot to the r4 / partition, all kinds of file not found errors
occurred. I booted again to my non-r4 partition, and ran fsck.reiser4
--check -y there were fatal errors on my r4 /.

The backup was fine. I downgraded back to reiserfs which does not exhibit
this problem.

I have not experienced any problem with other r4 partitions. Just /.
/home, /tmp, /src, etc. are fine.

Unfortunately, I don't have time to keep wondering where the problem is or
why. Perhaps it's the kernel or the init scripts. Nonetheless, the
instability of whatever the problem is is unnerving.

-- 
Peter
+++++
Do not reply to this email, it is a spam trap and not monitored.
I can be reached via this list, or via 
jabber: pete4abw at jabber.org
ICQ: 73676357

