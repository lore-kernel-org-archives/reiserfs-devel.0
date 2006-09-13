From: "Peter" <sw98234-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: Re: reiser4: mount -o remount,ro / causes error on reboot
Date: Wed, 13 Sep 2006 13:18:13 +0000 (UTC)
Message-ID: <ee90el$d7r$2@sea.gmane.org>
References: <ee1gcu$dgb$1@sea.gmane.org> <ee77ng$3o1$1@sea.gmane.org>
	<200609131449.05193.vs@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29866-reiserfs=m.gmane.org-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-help: <mailto:reiserfs-list-help-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-post: <mailto:reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
Errors-To: flx-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org
Sender: news <news-WnDAp88bSu3NLxjTenLetw@public.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org

On Wed, 13 Sep 2006 14:49:05 +0400, Vladimir V. Saveliev wrote:

all snip.

Here is a screen shot I posted along with the bug report on this:

http://bugs.gentoo.org/attachment.cgi?id=96874&action=view . I am sorry
the pic is a little blurred, but I had battery trouble.

There are two segfaults that occur, 2399 and 2524 and the text that is
printed is from line 390 of rc and line 181 of functions.sh.

As you can see, there are no panics or dumps and it appears that for
whatever reason, the init scripts just cannot continue. However, the
reboot (ctrl-d), the scripts execute fine.

As I noted previously, the error occurs in all unmasked 1.12 base layout
files. 1.11.15-r3 works fine.

-- 
Peter
+++++
Do not reply to this email, it is a spam trap and not monitored.
I can be reached via this list, or via 
jabber: pete4abw at jabber.org
ICQ: 73676357

