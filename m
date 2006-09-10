From: "Peter" <sw98234-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: Re: reiser4: mount -o remount,ro / causes error on reboot
Date: Sun, 10 Sep 2006 21:26:09 +0000 (UTC)
Message-ID: <ee1vth$dgb$2@sea.gmane.org>
References: <ee1gcu$dgb$1@sea.gmane.org> <45047190.2040101@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29845-reiserfs=m.gmane.org-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-help: <mailto:reiserfs-list-help-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-post: <mailto:reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
Errors-To: flx-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org
Sender: news <news-WnDAp88bSu3NLxjTenLetw@public.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org

On Sun, 10 Sep 2006 15:12:00 -0500, David Masover wrote:

> Peter wrote:
>> Using: gentoo
>> kernel 2.6.17.11 with beyond patchset
>> reiser patch 2.6.17-3
>> reiser4progs 1.0.5
>> 
>> At the end of the gentoo shutdown script is a short function which
>> remounts / as ro.
> 
> There's also one in the Gentoo startup script, which attempts to remount 
> / ro, then remount it rw.  I commented that out, because it was causing 
> similar problems.  I figure if it runs sync when it shuts down, that's 
> good enough.

The errors I note only occur on shutdown (halt.sh) not startup. Do you
think it could be an IDE timing thing similar to what was described on
another thread on this ml? What's interesting is that this problem is
recent and I am trying to look back and see what system-level packages
were updated recently (I just converted to the 2006.1 profile before this
occured and that caused a lot of programs to recompile. A week earlier,
it was gcc-4.1.1. I know base layout was updated recently). Maybe something
in mount changed? The shutdown scripts look the same. Something is left
unhinged somewhere. Glad I was not hallucinating! Thanks for confirming
for me.

> 
> Still, it's an annoying problem, I think it's a kernel oops.  Namesys,
> what kind of information would be helpful?

Yes, it's annoying and disconcerting at the same time. If it was a kernel
oop then, wouldn't it have shown itself earlier? I

-- 
Peter
+++++
Do not reply to this email, it is a spam trap and not monitored.
I can be reached via this list, or via 
jabber: pete4abw at jabber.org
ICQ: 73676357

