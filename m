From: Vince <fuzzy77@free.fr>
Subject: Re: 2.6.4 corruption
Date: Tue, 23 Mar 2004 01:28:57 +0100
Message-ID: <405F84C9.6020406@free.fr>
References: <20040322005555.GA509@zero> <200403221221.42413.Dieter.Nuetzel@hamburg.de> <20040323000856.GA3975@zero>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17392-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040323000856.GA3975@zero>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tom Vier <tmv@comcast.net>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>

Tom Vier wrote:
> On Mon, Mar 22, 2004 at 12:21:42PM +0100, Dieter N?tzel wrote:
> 
>>Use the data-logging patches for 2.6.4 up or "wait" or 2.6.5/2.6.6.
> 
> 
> i'm getting rejects using:
> 
> for i in `cat /pkgs/linux/reiserfs/mason/data-logging/2.6.4/series`; do \
> patch -p1 --dry-run < /pkgs/linux/reiserfs/mason/data-logging/2.6.4/$i; done
             ^^^^^^^^^

You should apply the patches for real:

> patching file fs/reiserfs/stree.c

... stree.c is modified here

> patching file include/linux/reiserfs_fs.h
> patching file fs/reiserfs/stree.c
                             ^^^^^^^
and it looks like the second patch depends on the first one when wanting 
to modify the same file (therefore a reject with --dry-run)...

> Hunk #1 FAILED at 678.
> Hunk #2 succeeded at 690 (offset -2 lines).
> Hunk #3 FAILED at 704.
> 2 out of 3 hunks FAILED -- saving rejects to file fs/reiserfs/stree.c.rej
> patching file fs/reiserfs/stree.c
