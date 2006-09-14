From: "Peter" <sw98234-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] reiser4: fix readv
Date: Thu, 14 Sep 2006 10:35:02 +0000 (UTC)
Message-ID: <eebb8l$jg6$1@sea.gmane.org>
References: <200609132212.54871.vs@namesys.com>
	<20060914092829.GA13737@hermes.uziel.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29880-reiserfs=m.gmane.org-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-help: <mailto:reiserfs-list-help-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-post: <mailto:reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
Errors-To: flx-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org
Sender: news <news-WnDAp88bSu3NLxjTenLetw@public.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org

On Thu, 14 Sep 2006 11:28:29 +0200, Christian Trefzer wrote:

> Hi Vladimir,
> 
> this fixes a bunch of random user space oddities for me. Just patched
> 2.6.18-rc6-mm2 with this, and some annoyances I could not trace back to
> a change in user space just went bye-bye.
> 
> Thanks a lot!
> Chris

This does not patch against 2.6.17-3 patchset however. Any possibility
this may be related to some startup issues as noted on other threads here?

Thx

-- 
Peter
+++++
Do not reply to this email, it is a spam trap and not monitored.
I can be reached via this list, or via 
jabber: pete4abw at jabber.org
ICQ: 73676357

