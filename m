From: "Peter" <sw98234-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: Re: reiser4 corruption on initial copy
Date: Fri, 1 Sep 2006 15:24:51 +0000 (UTC)
Message-ID: <ed9jc3$tl1$1@sea.gmane.org>
References: <ed9412$2r9$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29776-reiserfs=m.gmane.org-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-help: <mailto:reiserfs-list-help-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-post: <mailto:reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
Errors-To: flx-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org
Sender: news <news-WnDAp88bSu3NLxjTenLetw@public.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org

On Fri, 01 Sep 2006 11:02:58 +0000, Peter wrote:
> 
> # cd source partition
> # tar --one-file-system -cvf - | tar -C dest -xf -
> 
of course I had * for all files :)

I also did the same with rsync -a /mnt/dest. I then thought perhaps the
livecd did not properly unmount the local filesystems, so I issued the
umount command. This took approximately three minutes. I then ran an fsck
and it appeared fine.

However, again on first boot, the kernel issued a slew of errors, mostly
about not being able to access /proc (which was there). Then, again, after
a reboot, I was OK except that one file /sbin/uname was bad again and
needed to be fixed and replaced.

I suppose I will try and see if I can tar up the reiser3 partition and
restore it in a separate action.

If you require additional information, please let me know.

-- 
Peter
+++++
Do not reply to this email, it is a spam trap and not monitored.
I can be reached via this list, or via 
jabber: pete4abw at jabber.org
ICQ: 73676357

