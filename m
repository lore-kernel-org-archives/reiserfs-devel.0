From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: ReiserFS problems
Date: Thu, 7 Aug 2003 18:11:58 +0400
Message-ID: <200308071811.58952.vitaly@namesys.com>
References: <20030806182055.A28562@bitwizard.nl> <3F325597.30209@namesys.com> <20030807154627.C7165@bitwizard.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15233-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030807154627.C7165@bitwizard.nl>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>, Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com, copy@harddisk-recovery.nl

On Thursday 07 August 2003 17:46, Rogier Wolff wrote:
> On Thu, Aug 07, 2003 at 05:35:19PM +0400, Hans Reiser wrote:
> > Rogier Wolff wrote:
> > >Only list the file/directory that's being worked upon when explicitly
> > >requested. When not explicitly requested, set an alarm handler to
> > >print it every second (or so). Lots of time is now spent in writing to
> > >the screen. (It's consumed over an hour of CPU time by now...)
> >
> > good point.  Vitaly, do this unless you have a reason not to.

:) Hans, I answered on this and described how it is done, do you see 
my answer?

> FYI: A "reason not to" would be if you "frequently" get crashes in the
> program that get the location misreported because the last line it
> printed ends up being quite wrong.
>
> 			Roger.

As I have wrote already the path to the directory, the file was reached from 
is printed, without the name of the file being checked -- this reduces the 
amount of stuff being printed and as there is no ararms at the time of a 
crash the path to the parent directory is always printed. 

-- 
Thanks,
Vitaly Fertman
