From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: new reiser4 snapshot is available
Date: Fri, 14 Nov 2003 14:20:28 +0300
Message-ID: <20031114112027.GJ1278@backtop.namesys.com>
References: <20031113143438.GD1278@backtop.namesys.com> <20031114094217.GH1278@backtop.namesys.com> <1068807864.2883.1520.camel@lemsip>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16087-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1068807864.2883.1520.camel@lemsip>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gianni Tedesco <gianni@scaramanga.co.uk>
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Fri, Nov 14, 2003 at 12:04:25PM +0100, Gianni Tedesco wrote:
> On Fri, 2003-11-14 at 10:42, Alex Zarochentsev wrote:
> > > fetch it
> > > http://namesys.com/snapshots/2003.11.12/linux-2.6.0-test9-reiser4.diff.gz
> 
> Seems to be combined with the UML patch...
> 
> zcat linux-2.6.0-test9-reiser4.diff.gz | diffstat
>  Makefile                                                     |    2
>  arch/i386/kernel/entry.S                                     |    4
>  arch/i386/kernel/sys_i386.c                                  |    2
>  arch/um/Kconfig                                              |   48
>  arch/um/Kconfig_block                                        |   14
>  arch/um/Kconfig_net                                          |   70
>  arch/um/Makefile                                             |   49
>  arch/um/Makefile-i386                                        |   20
>  arch/um/Makefile-skas                                        |    6
>  arch/um/config.release                                       |    1
>  arch/um/defconfig                                            |  203
>  arch/um/drivers/Makefile                                     |    6
>  arch/um/drivers/chan_kern.c                                  |    1
>  arch/um/drivers/chan_user.c                                  |    4
> 
> etc....

yes, this patch taken from our bk repository, 
because UML is used in development, it contains uml fixes.

previous snapshot was done more carefully, it is located
in http://namesys.com/snapshots/2003.10.17/ you can see 
all changes in one patch as well as broken-out patches.

changes for test9 are the same as for test7 with minor exceptions. 

> // Gianni Tedesco (gianni at scaramanga dot co dot uk)
> lynx --source www.scaramanga.co.uk/scaramanga.asc | gpg --import
> 8646BE7D: 6D9F 2287 870E A2C9 8F60 3A3C 91B5 7669 8646 BE7D

-- 
Alex.
