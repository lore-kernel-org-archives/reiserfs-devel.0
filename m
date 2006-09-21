From: "Peter" <sw98234-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: Re: partition cannot be mounted from grub
Date: Thu, 21 Sep 2006 14:36:58 +0000 (UTC)
Message-ID: <eeu82a$vjq$4@sea.gmane.org>
References: <eet9jg$463$1@sea.gmane.org> <eetanq$6ij$1@sea.gmane.org>
	<eetru8$vjq$1@sea.gmane.org> <45129B6B.6090005@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29965-reiserfs=m.gmane.org-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-help: <mailto:reiserfs-list-help-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-post: <mailto:reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
Errors-To: flx-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org
Sender: news <news-WnDAp88bSu3NLxjTenLetw@public.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org

On Thu, 21 Sep 2006 10:02:19 -0400, Jeff Mahoney wrote:

snip...
> I'm curious what version of grub caused you to come to these
> conclusions. Grub has been using the REISERFS_IOC_UNPACK ioctl for ages.
> It's the same thing lilo uses and causes those files to only use
> indirect blocks (ie: no tails). If you've been running into this problem
> with any recent version of grub, it's a bug.
> 
> - -Jeff

0.94/0.97 (not grub2). Just happened yesterday as a test. I also found it
impossible to run grub in its /boot/grub mounted partition. I had to boot
off another partition or a live cd and run grub from there. I did not find
this trouble with r4 however. Just my experience however.

-- 
Peter
+++++
Do not reply to this email, it is a spam trap and not monitored.
I can be reached via this list, or via 
jabber: pete4abw at jabber.org
ICQ: 73676357

