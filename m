From: "Fred -- Speed Up --" <speedup@free.fr>
Subject: Re: Will Reisefs have "undo"?
Date: Sat, 14 Jun 2003 21:39:24 +0200
Message-ID: <000d01c332ac$a94e23a0$0200a8c0@xpstation>
References: <1055615895.698.129.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14547-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS ML <reiserfs-list@namesys.com>

This is not the filesystem's work, KDE for instance has a trashcan, and you
can bind the rm command to a special mv one that moves files from the
initial place to a backup folder, the files of which you can empty regulary
with a cron script depending on the file's "age". It's simple to implement,
and really not something Reiser4 should be capable of ... instead
journalising works very well to protect data from being erased, that's the
only purpose of a modern filesystem.

Fred

----- Original Message ----- 
From: "Joachim Zobel" <nc-zobeljo@netcologne.de>
To: "ReiserFS List" <reiserfs-list@namesys.com>
Sent: Saturday, June 14, 2003 8:38 PM
Subject: Will Reisefs have "undo"?


> Hi.
>
> Are there any plans to add undo capabilities to reiserfs? Most modern
> desktops have a trash can. Am I the only one who has idea that this is a
> crappy workaround for something that should be in the filesystem.
>
> I am aware that this is not easy, but nearly everybody has had moments
> where he would have loved it. And disk space is cheap, there is rarely
> the need to overwrite anything.
>
> Sincerely,
> Joachim
>
> -- 
> "... ein Geschlecht erfinderischer Zwerge, die fuer alles gemietet werden
> koennen."                            - Bertolt Brecht - Leben des Galilei
>
>

