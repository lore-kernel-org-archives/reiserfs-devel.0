From: Russell Coker <bofh@coker.com.au>
Subject: Re: what do you do that stresses your filesystem?
Date: Mon, 23 Dec 2002 14:21:52 +0100
Message-ID: <200212231421.52052.bofh@coker.com.au>
References: <3E06F360.7000708@namesys.com>
Reply-To: Russell Coker <bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12212-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E06F360.7000708@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, ReiserFS <reiserfs-list@namesys.com>

On Mon, 23 Dec 2002 12:28, Hans Reiser wrote:
> We were discussing how to optimize reiser4 best, and came to realize
> that us developers did not have a good enough intuition for what users
> do that stresses their filesystem enough that they care about its
> performance.
>
> Booting the machine seems like one activity that many users end up
> waiting on the FS for.  Yes?

Yes, although there are other factors than the file system which determine 
boot time.  Different types of init scripts can probably improve performance 
more than anything you could do to a file system.

Also if you have a rack-mount server then it'll probably take 2 minutes or 
more to go through the BIOS checks so FS delays will seem like nothing by 
comparison.

> Starting up complex and big applications like xemacs and mozilla would
> be another.  Yes?

Yes, particularly KDE.  Although I don't do it often enough to care so much.

> Others?

Mail serving with Maildir storage.  Rsync of gigebytes of files.  Kernel 
compiles.  Debian package installation.

Also there are some issues where Linux does not perform well, such as typing 
"sync" on a machine that has a heavy write load (which can take an indefinate 
amount of time).

-- 
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page

