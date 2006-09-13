From: "Peter" <sw98234-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Relocating files for faster boot/start-up on reiser(fs/4)
Date: Wed, 13 Sep 2006 21:10:44 +0000 (UTC)
Message-ID: <ee9s4k$f58$1@sea.gmane.org>
References: <200609131451.42474.lists@qutek.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29877-reiserfs=m.gmane.org-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-help: <mailto:reiserfs-list-help-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-post: <mailto:reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
Errors-To: flx-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org
Sender: news <news-WnDAp88bSu3NLxjTenLetw@public.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org

On Wed, 13 Sep 2006 14:51:39 -0600, Quinn Harris wrote:
> 
> Thoughts?
>

Yes. Why on earth would you do this? By copying the files and renaming and
hardlinking them is nothing a sysadmin would ever do. Just by copying you
are allowing reiser to optimize the dir. You're trying to duplicate what a
tree-based design does automatically. Moreover, remember that reiser packs
files into clusters so that you may read more than just your one file from
time to time which could end up adding time to your test.

If reiser needs speedup it certainly won't be done by renaming files!

JM$0.02

-- 
Peter
+++++
Do not reply to this email, it is a spam trap and not monitored.
I can be reached via this list, or via 
jabber: pete4abw at jabber.org
ICQ: 73676357

