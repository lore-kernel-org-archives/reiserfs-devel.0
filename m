From: "Peter" <sw98234-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: Re: reiser4: mount -o remount,ro / causes error on reboot
Date: Mon, 11 Sep 2006 11:43:30 +0000 (UTC)
Message-ID: <ee3i52$mvq$1@sea.gmane.org>
References: <ee1gcu$dgb$1@sea.gmane.org> <45047190.2040101@slaphack.com>
	<ee1vth$dgb$2@sea.gmane.org> <200609111130.39647.vs@namesys.com>
	<ee3cl8$5fo$1@sea.gmane.org>
	<b65fbb130609110410x146bd9f5i9cdd1f96836eaf78@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29852-reiserfs=m.gmane.org-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-help: <mailto:reiserfs-list-help-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-post: <mailto:reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
Errors-To: flx-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org
Sender: news <news-WnDAp88bSu3NLxjTenLetw@public.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org

On Mon, 11 Sep 2006 13:10:54 +0200, Sander Sweers wrote:

snip...

> There was a bug in baselayout which caused partition (except /) not to
> remount ro properly. The bug number is 131001 [1], is this your problem?
> 
> Greets
> Sander
> 
> 1: http://bugs.gentoo.org/show_bug.cgi?id=131001

Thank you, I read that. My version of baselayout has that fix, but that
does not appear to be the problem. I think it has more specifically to do
with the way the remount option is affecting the reiser4 fs. And, only /
is left when the remount,ro part comes anyway. Everything else is
unmounted by that time.

-- 
Peter
+++++
Do not reply to this email, it is a spam trap and not monitored.
I can be reached via this list, or via 
jabber: pete4abw at jabber.org
ICQ: 73676357

