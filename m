From: "Peter" <sw98234-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: Re: reiser4: mount -o remount,ro / causes error on reboot
Date: Mon, 11 Sep 2006 15:12:06 +0000 (UTC)
Message-ID: <ee3uc6$8g8$1@sea.gmane.org>
References: <ee1gcu$dgb$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29854-reiserfs=m.gmane.org-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-help: <mailto:reiserfs-list-help-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-post: <mailto:reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
Errors-To: flx-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org
Sender: news <news-WnDAp88bSu3NLxjTenLetw@public.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org

On Sun, 10 Sep 2006 17:01:18 +0000, Peter wrote:

> Using: gentoo
> kernel 2.6.17.11 with beyond patchset
> reiser patch 2.6.17-3
> reiser4progs 1.0.5
> 
update...
Transferring / to a reiser3 partition removes this problem. Shutdown and
startup proceed normally. I am using util-linux-2.12r with gentoo patches
-r4. This was updated on 9/4/06. I am thinking I will downgrade to -r3 and
see if that removes the problem.

-- 
Peter
+++++
Do not reply to this email, it is a spam trap and not monitored.
I can be reached via this list, or via 
jabber: pete4abw at jabber.org
ICQ: 73676357

