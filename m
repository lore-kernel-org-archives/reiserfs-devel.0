From: "Peter" <sw98234-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: Re: reiser4: mount -o remount,ro / causes error on reboot
Date: Tue, 12 Sep 2006 21:10:08 +0000 (UTC)
Message-ID: <ee77ng$3o1$1@sea.gmane.org>
References: <ee1gcu$dgb$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29860-reiserfs=m.gmane.org-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-help: <mailto:reiserfs-list-help-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-post: <mailto:reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
Errors-To: flx-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org
Sender: news <news-WnDAp88bSu3NLxjTenLetw@public.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org

On Sun, 10 Sep 2006 17:01:18 +0000, Peter wrote:
all snip...

To Vladimir and David:

This appears to be a nasty gentoo issue. After perusing the forums and
bugzilla, it appears that we are not alone in having difficulties with the
baselayout. Nonetheless, as the reporter did, I downgraded baselayout from
1.12.4-r7-r7 to 1.11.15-r3 and the reboot problem I noted went away. It is
interesting to note that it may be a C program startstop-daemon.c that may
be the culprit. I don't expect much help from the gentoo devs since they
won't support reiser4, but thought I would throw this out.

Sorry to report this as an r4 bug, although it's interesting to note that
the 1.12.4 baselayout did NOT cause this problem in reiserfs3.6

HTH

-- 
Peter
+++++
Do not reply to this email, it is a spam trap and not monitored.
I can be reached via this list, or via 
jabber: pete4abw at jabber.org
ICQ: 73676357

