From: Russell Coker <russell@coker.com.au>
Subject: Re: non volatile ram devices
Date: Thu, 5 Dec 2002 09:36:26 +0100
Message-ID: <200212050936.26846.russell@coker.com.au>
References: <200212042059.35300.russell@coker.com.au> <20021205093215.B20015@namesys.com>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12114-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021205093215.B20015@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: ReiserFS <reiserfs-list@namesys.com>

On Thu, 5 Dec 2002 07:32, Oleg Drokin wrote:
> > I have some servers that are giving inadequate disk performance for
> > Maildir mail spools.  They are running kernel 2.4.19 (2.4.20 upgrade is
> > planned) and using ReiserFS for everything that's important.
>
> May I ask what kind of inadequacy on what kinds of operations do you
> observe?

It just generally isn't fast enough.  The servers in question have 4 * 72G 
U160 SCSI disks in RAID-5 arrays on MegaRAID controllers.  They are designed 
to handle 300,000 accounts for POP and IMAP.

At times of high load there's 20 reads per second and 160 writes per second.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

