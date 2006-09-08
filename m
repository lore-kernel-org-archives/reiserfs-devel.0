From: "Peter" <sw98234-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: Re: FEATURE Req: integrate badblocks check into fsck.reiser*
Date: Fri, 8 Sep 2006 12:29:51 +0000 (UTC)
Message-ID: <edrnnv$n1m$1@sea.gmane.org>
References: <ed9tqo$2tc$1@sea.gmane.org> <200609012250.44548.vs@namesys.com>
	<44F8B3C8.1050802@slaphack.com> <edae71$iqf$1@sea.gmane.org>
	<44F8BE78.1080503@slaphack.com> <44FB925E.2000300@emc.com>
	<44FE1C04.70800@namesys.com> <44FEE45B.4060607@slaphack.com>
	<44FFF5DB.3050200@emc.com> <4500472F.7050902@slaphack.com>
	<4500529F.2040603@emc.com> <4500584A.4040601@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29835-reiserfs=m.gmane.org-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-help: <mailto:reiserfs-list-help-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-post: <mailto:reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
Errors-To: flx-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org
Sender: news <news-WnDAp88bSu3NLxjTenLetw@public.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org

On Thu, 07 Sep 2006 12:35:06 -0500, David Masover wrote:

all snip.....

All I was getting at originally was to make fsck.reiser4 behave similarly
to other fsck/mkfs programs so that it _could_, when requested, check a
disk/partition for bad blocks. Despite the improved capabilities of modern
drives, sh*t happens. And I, for one, would like the option of knowing
before formatting a new partition if it's OK to do so. Sure, I can run
badblocks myself, but this is counter to what I do with other fsck
programs.

A wrapper script would work fine, and I suppose, some sort of pipe output.
However, I'm just looking at this from a userland perspective, not that of
a sysadmin. Obviously, a sysadmin would not put any disk into production
that has not been carefully tested.

If this is superfluous, that's OK. I can easily work around it, but it
should be noted somewhere in a README that reiserfs/4 does not do bad
block checking during format and only a quick format is done.

-- 
Peter
+++++
Do not reply to this email, it is a spam trap and not monitored.
I can be reached via this list, or via 
jabber: pete4abw at jabber.org
ICQ: 73676357

