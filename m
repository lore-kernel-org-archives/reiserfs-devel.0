From: Oleg Drokin <green@namesys.com>
Subject: Re: Reiserfsck and root filesystem
Date: Fri, 18 Apr 2003 17:00:53 +0400
Message-ID: <20030418170053.A7143@namesys.com>
References: <001e01c305a9$ad5470b0$0a9a10ac@GRZEGORZ>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13707-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <001e01c305a9$ad5470b0$0a9a10ac@GRZEGORZ>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grzegorz Paszka <Grzegorz@Paszka.com>
Cc: reiserfs-list@namesys.com

Hello!

On Fri, Apr 18, 2003 at 02:54:41PM +0200, Grzegorz Paszka wrote:

> I just want have sure.
> I need repair root filesystem.
> Have I chance to repair it mounted read-only or I have to umount it and
> check this filesystem in another computer ?

You need to have the filesystem completely unmounted, if you want to fix it.
So you either need to use another computer or boot from rescue disk..

Bye,
    Oleg
