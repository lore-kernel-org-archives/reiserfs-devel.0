From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: NFS issues with reiserfs 3.6? ext3 works...
Date: Fri, 26 Mar 2004 16:18:26 +0300
Message-ID: <1080307106.5920.1.camel@tribesman.namesys.com>
References: <20040326115302.GD1315@mathematik.uni-bielefeld.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17492-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040326115302.GD1315@mathematik.uni-bielefeld.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernhard Sadlowski <sadlowsk@mathematik.uni-bielefeld.de>
Cc: reiserfs-list@namesys.com

Hello

On Fri, 2004-03-26 at 14:53, Bernhard Sadlowski wrote:
> Hi!
> 
> A short question:
> 
> What are the remaining differences between reiserfs and ext3 regarding
> NFS? 
> 

We thought no before your mail

> Details:
> 
> I have two Linux machines with current kernel 2.4.25 and two
> Directories on the NFS Server dematl04:
> 
> dematl04:/vol01 (ext3 fs)
> dematl04:/raid  (reiserfs 3.6)
> 
> On both machines we use Helios Ethershare (a commercial software for
> print and fileservices for Macintosh). Helios Ethershare uses and
> updates a file .Desktop every time some mac is creating, writing or
> changing files in a Macintosh volume.  The "dt" utility has to be used
> in a shell for mkdir, rm, mv, touch, ... I guess it has to lock this
> file whilche applying changes.
> 
> # dt
> Usage: dt { rm | rmdir | mv | cp | set | ls | mkdir | touch |
>             upd | chmod | chown | chgrp | idinfo | iddump }
> 
> Reiserfs:
> 
> root@dematl04:/raid/arc_04# dt mkdir test1
> -> works
> 
> Same volume mounted per NFS on a second machine:
> 
> root@dematl08:/assets/ts04/arc_04# dt mkdir test2
> dt mkdir: (dematl04) Error -5031 occured!: /raid/assets/ts04/arc_04: error accessing desktop lock '.DeskServer'
> -> does not work 
> 

Can you run this under strace?

> Ext3:
> 
> root@dematl04:/vol01# dt mkdir test1
> -> works
> 
> Same volume mounted per NFS on a second machine:
> 
> root@dematl08:/vol01# dt mkdir test2
> -> works
> 
> Helios Ethershare is also running on Solaris 8 and the tests above
> succeed between two Solaris machines. I can provide on request the
> strace output of "dt mkdir test3" on the NFS client. They were to big
> for the list.
> 
> Is this some known locking difference/bug in reiserfs?
> Will reiser4 be more "compatible" with NFS?
> 
> Thanks,
> Bernhard
> 

