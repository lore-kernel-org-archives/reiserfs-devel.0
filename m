From: Oleg Drokin <green@namesys.com>
Subject: Re: How to break a reiserfs on Linux 2.4.20
Date: Thu, 16 Jan 2003 18:32:24 +0300
Message-ID: <20030116183224.A32008@namesys.com>
References: <b01ff1$sp0$1@genki.hungrycats.org> <b04o8a$eah$1@satsuki.furryterror.org> <b04o8a$eah$1@satsuki.furryterror.org> <20030116104906.A7078@namesys.com> <b06erb$j34$1@satsuki.furryterror.org> <20030116182201.A28414@namesys.com> <1042730943.31095.2188.camel@tiny.suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12399-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1042730943.31095.2188.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: Zygo Blaxell <eazgwmir@umail.furryterror.org>, reiserfs-list@namesys.com

Hello!

On Thu, Jan 16, 2003 at 10:29:03AM -0500, Chris Mason wrote:

> These aren't good at all, either the locking on the commit lists is
> broken or the buffer head management is going wrong.

> Oleg, do you have any leads or do you want me to try reproducing?

Well, I found something looking like a race in VFS (I sent a mail to lkml
earlier today). reiserfs_link is called with inodes that have zero i_nlink.
But I do not see how that might explain journaling stuff.
I have not tried the script on SMP yet, though.

Bye,
    Oleg
