From: Russell Coker <russell@coker.com.au>
Subject: Re: non volatile ram devices
Date: Thu, 5 Dec 2002 23:51:09 +0100
Message-ID: <200212052351.09634.russell@coker.com.au>
References: <200212042059.35300.russell@coker.com.au> <200212050936.26846.russell@coker.com.au> <20021205162128.GC4334@mrball.net>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12121-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021205162128.GC4334@mrball.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Todd Lyons <todd@mrball.net>, ReiserFS <reiserfs-list@namesys.com>

On Thu, 5 Dec 2002 17:21, Todd Lyons wrote:
> Russell Coker wanted us to know:
> >It just generally isn't fast enough.  The servers in question have 4 * 72G
> >U160 SCSI disks in RAID-5 arrays on MegaRAID controllers.  They are
> > designed to handle 300,000 accounts for POP and IMAP.
> >At times of high load there's 20 reads per second and 160 writes per
> > second.
>
> Let me ask some really stupid questions.
> What kind of logging are your pop, imap, and mail services doing?  If
> logging to syslog, redirect the mail logging facility to tty12 instead
> of a file on the harddrive.  If syslog is logging to a network log
> server, then there's not much you can do.  If logging to /dev/null, this
> is a non-issue.

Logging is to files, but it's got "-" at the start of the log entries to stop 
them being sync'd so I doubt that they have a great impact.

Turning off logs on live production servers is something that I am hesitant to 
do, and I don't expect it to improve performance much as the qmail spool dir 
(with synchronous writes) is also on the /var file system.

> Is the Maildir spool on its own partition? (I can't see
> how it's not since it's you, Russell).  Is /var/log on its own
> partition.

Partitions are /, /var, and /mail .  Not my choice but it's not too bad 
either.

> What I'm getting at with all of this is that syslog can create
> significant load on a machine if the machine is really busy.

Non synchronous writes for logging when a machine has 4G of RAM to allow big 
caches should not be a performance issue.  If it is then there's something 
wrong with the logging.  I may give it a try, but I'll try data logging 
first.

Thanks for the suggestion.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

