From: "Peter" <sw98234-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: Re: reiser4: mount -o remount,ro / causes error on reboot
Date: Wed, 13 Sep 2006 09:31:40 +0000 (UTC)
Message-ID: <ee8j5s$ibt$1@sea.gmane.org>
References: <ee1gcu$dgb$1@sea.gmane.org> <ee77ng$3o1$1@sea.gmane.org>
	<45077170.1070301@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29863-reiserfs=m.gmane.org-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-help: <mailto:reiserfs-list-help-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-post: <mailto:reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
Errors-To: flx-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org
Sender: news <news-WnDAp88bSu3NLxjTenLetw@public.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org

On Tue, 12 Sep 2006 21:48:16 -0500, David Masover wrote:

snip...
>> Sorry to report this as an r4 bug, although it's interesting to note that
>> the 1.12.4 baselayout did NOT cause this problem in reiserfs3.6
> 
> Mine was doubtlessly a Reiser4 bug, as it resulted in either an oops or 
> a panic, I'm not sure which.  I think it was an oops, and after that 
> oops, the disk is inaccessible.  Since it's a root FS, this is a 
> problem!  The init scripts should not be able to cause this, no matter 
> how buggy they are.
> 

That's good to know...I guess :)
> 
> I haven't done this already, because everything works now, and no one's 
> asked me to yet.

I find this curious, don't you?

I'm wondering if kernel preemption settings and anticipatory read ahead
settings could play a role? Mine are CONFIG_PREEMPT=y and
CONFIG_DEFAULT_IOSCHED=CFQ. One other thing of note is that my kernel has
Jens Axboe's iosched-rollup-2.6.17.4-2 patch. My reiser4 patch is
2.6.17-3. The iosched patch removed a lot of dma messages in the kernel
log (not disk errors).

Anyway, whatever changed in my downgraded baselayout, at least it's not
causing reiser4 to hiccup. Curious problem in that it only occurs
immediately after a shutdown, not after the error and a reboot from a
maintenance prompt.

-- 
Peter
+++++
Do not reply to this email, it is a spam trap and not monitored.
I can be reached via this list, or via 
jabber: pete4abw at jabber.org
ICQ: 73676357

