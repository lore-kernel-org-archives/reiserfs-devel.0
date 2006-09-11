From: "Peter" <sw98234-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: Re: reiser4: mount -o remount,ro / causes error on reboot
Date: Mon, 11 Sep 2006 12:21:45 +0000 (UTC)
Message-ID: <ee3kcp$as$2@sea.gmane.org>
References: <ee1gcu$dgb$1@sea.gmane.org> <45047190.2040101@slaphack.com>
	<ee1vth$dgb$2@sea.gmane.org> <200609111130.39647.vs@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29853-reiserfs=m.gmane.org-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-help: <mailto:reiserfs-list-help-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-post: <mailto:reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
Errors-To: flx-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org
Sender: news <news-WnDAp88bSu3NLxjTenLetw@public.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org

On Mon, 11 Sep 2006 11:30:39 +0400, Vladimir V. Saveliev wrote:

snip...
> Sorry, I am confused. In the first mail you said:
> "On reboot or after a poweroff, root does not mount properly, and after
> some modules are loaded, there are segfaults when running init scripts."
> 
> This looks like  you have problems on startup. Would you, please, describe the 
> sequence of operations which leads to the problem with more details.
> 
I should have written that it occurs always after a normal shutdown or
reboot. On initial startup, the error occurs. Then, after CTRL-D, the
system reboots and all is fine. Then, after the day, normal shutdown, then
abnormal startup.

Some more information, I looked at the output from the final mount -v -n -o
remont,ro / command, it appears perfectly normal. However, I am not sure
it is working normally!

-- 
Peter
+++++
Do not reply to this email, it is a spam trap and not monitored.
I can be reached via this list, or via 
jabber: pete4abw at jabber.org
ICQ: 73676357

