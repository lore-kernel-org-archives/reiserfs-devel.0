From: Nick Vahalik <nick@nsanity.com>
Subject: Re: Reiserfs Data Recovery
Date: Tue, 09 Mar 2004 15:24:07 -0600
Message-ID: <404E35F7.8010503@nsanity.com>
References: <404C81B9.4050504@nsanity.com> <20040308184124.GE5817@dbz.icequake.net> <404CC8AA.9020405@nsanity.com> <20040308215919.GB11093@dbz.icequake.net> <404CF46B.10000@nsanity.com> <20040309011311.GA15226@dbz.icequake.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17150-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040309011311.GA15226@dbz.icequake.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ryan Underwood <nemesis-lists@icequake.net>
Cc: reiserfs-list@namesys.com

Ryan Underwood wrote:

>Oh wow, you do definitely want to run IBM DFT as soon as possible.  That
>might be the only thing that is wrong... usually you would see some
>syslog errors though when you tried to mount the drives if the system
>was having problems reading from the drive(s).  DFT should not destroy
>any data or make anything worse, but it will try to relocate the sector
>if it is having trouble reading it.
>  
>
Well, I ran the DFT, Quick, Advanced, and Bad Sector Tests on all three 
of my drives.  (One boot and the two in the stripe) and they all 
completely successfully without any errors.  The drives appear to have 
checked out.

>I think you might try the DFT approach before giving up, but definitely
>don't do anymore damage with reiserfsck. :)  Also, since this is a
>stripe set, is the md device able to start the raid successfully?  If
>so, and if it only fails when you try to mount the filesystem on the
>raid, you will have better chances than if md can't even figure out that
>you have a stripe set spanning those disks.
>  
>
I'm using highpoint's source code driver (hpt37x2.o) compiled for my SMP 
kernel.
...
But... when I dmesg I only see one processor...? Could that be an 
issue... I'm gonna recompile and try it again.

Nick Vahalik

