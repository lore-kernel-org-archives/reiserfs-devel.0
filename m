From: "Peter" <sw98234-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: Re: reiser4: mount -o remount,ro / causes error on reboot
Date: Wed, 13 Sep 2006 11:32:54 +0000 (UTC)
Message-ID: <ee8q96$d7r$1@sea.gmane.org>
References: <ee1gcu$dgb$1@sea.gmane.org> <ee77ng$3o1$1@sea.gmane.org>
	<200609131449.05193.vs@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29865-reiserfs=m.gmane.org-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-help: <mailto:reiserfs-list-help-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-post: <mailto:reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
Errors-To: flx-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org
Sender: news <news-WnDAp88bSu3NLxjTenLetw@public.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org

On Wed, 13 Sep 2006 14:49:05 +0400, Vladimir V. Saveliev wrote:

snip...
> 
> I still think that the problem is in reiser4. When the system fails on boot it 
> usually outputs something which may help to understand the problem. Do you 
> see anything like that on faulty startups? You can use either serial or 
> network console to catch kernel output.

Well, the output is from the gentoo rc script and from the imported
functions.sh script. It showed two segfaults. It occured afaikt when the
dmcrypt addon is called. It uses the start-stop-daemon program. I tried
taking a photo of it, but it was blurry and the flash obscured it.

I backtracked all the way from the errant baselayout and until 1.11.15-r3
none of the 1.12 series of baselayouts worked. Too bad I can't get gpm to
run otherwise I could capture the output. However, the only output are
lines from the script with uninitialized variables -- basically the source
of the scripts. No dumps, stack traces, or panics.

-- 
Peter
+++++
Do not reply to this email, it is a spam trap and not monitored.
I can be reached via this list, or via 
jabber: pete4abw at jabber.org
ICQ: 73676357

