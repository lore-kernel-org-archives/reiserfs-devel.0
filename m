From: Oleg Drokin <green@namesys.com>
Subject: Re: mounting partitions, system hangs on Replaying journal
Date: Tue, 29 Apr 2003 13:25:01 +0400
Message-ID: <20030429092501.GA2561@namesys.com>
References: <200304291104.57287.davmago@libero.it>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13899-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200304291104.57287.davmago@libero.it>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Davide Magatti <davmago@libero.it>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Apr 29, 2003 at 11:04:57AM +0200, Davide Magatti wrote:

> When the system installed on the raid disks (Suse 8.0) try to mount the home 
> it hangs on :
> kernel: reiserfs: checking transaction log (device 08:07) ...
> The other system (Slack 9) is on another disks (ide). When i try to mount 
> sda7, hangs on the same message. The system slow down and i can't kill the 
> mount process
> yesterday i tried reiserfsck --check [as in man page] (from slackware) but the 
> system hang on "Replaying journal" (i try to leave it for about 12 h but 
> nothing happened). The load is gone to 3 and the system slow down a lot.

Sounds like it can no longer read something in the journal area.

> My question is:
> can i recover data in any way?.

Yes you can if other parts of the drive are still readable.

E.g. try to use dd_rescue, copy your partition to other same-sized or
bigger partition first copy in forward direction until it hangs, then reboot, then copy in
reverse order until it hangs.
If it only hangs in the journal area, you will be able to mount resulting partition.

> My idea, is mounting the device ignoring the journal, saving all the data and 
> reinstalling the system (or at least formatting the partition)
> Is it possible?

There were patches to mount the fs ignoring journal, but they are not part of the kernel.
Dig the archives, I think Chris Mason posted a link some time ago.

Bye,
    Oleg 
