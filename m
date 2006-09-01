From: "Peter" <sw98234-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: Re: FEATURE Req: integrate badblocks check into fsck.reiser*
Date: Fri, 1 Sep 2006 23:02:57 +0000 (UTC)
Message-ID: <edae71$iqf$1@sea.gmane.org>
References: <ed9tqo$2tc$1@sea.gmane.org> <200609012250.44548.vs@namesys.com>
	<44F8B3C8.1050802@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29785-reiserfs=m.gmane.org-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-help: <mailto:reiserfs-list-help-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-post: <mailto:reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
Errors-To: flx-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org
Sender: news <news-WnDAp88bSu3NLxjTenLetw@public.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org

On Fri, 01 Sep 2006 17:27:20 -0500, David Masover wrote:
snip...
>> both mkfs.reiserfs and fsck.reiserfs have -B option to accept list of
>> bad blocks. We thought that should be enough.
> 
> It really should.  Why bother with a patch?  Just write a wrapper script
> that runs badblocks and passes in the list to mkfs.

It was just a thought from userland. My perspective was that a user, not a
hard-boiled geek, might get lulled into a false sense of security but may
not have the wherewithal to write a wrapper. If nothing else, when the
final doc is written (did I say final?:)), it should include a notice
about not running badblocks.

-- 
Peter
+++++
Do not reply to this email, it is a spam trap and not monitored.
I can be reached via this list, or via 
jabber: pete4abw at jabber.org
ICQ: 73676357

