From: Isaac Claymore <clay@exavio.com.cn>
Subject: Re: Network Raid (possibly OT sorry)
Date: Mon, 15 Mar 2004 10:13:28 +0800
Message-ID: <20040315021328.GA19159@exavio.com.cn>
References: <4054D94A.8080400@bernztech.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17207-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4054D94A.8080400@bernztech.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Bernick <bernz@bernztech.org>
Cc: reiserfs-list@namesys.com

On Sun, Mar 14, 2004 at 05:14:34PM -0500, David Bernick wrote:
> hello fellow Reiser-lovers.
> 
> So Reiser rocks. It's great for a single system. But recently i've wanted 
> to build a network raid: A disk on host-a be mirrored in real-time (or near 
> real-time) to a disk on host-b. I know DRBD does this, but I'd like to read 
> from both disks and write to a master. DRBD makes the slave disk 
> non-readable. I've been playing with Intermezzo, which sort of does the 
> trick but it seems to be fairly unsupported as far as active mailing lists 
> are concerned.
> 
> So the question, as off-topic as it may be, is what do you use for a 
> mirrored (replicated?) filesystem, if you use one? Any suggestions would be 
> great.

Hi,

I'm not using such a setup, but I guess it may work by using a software
raid1 from a local disk and a remote disk exported by NBD (network block
device). But the performance of such a setup is surely poor.

I also stumbled across an asynchronous block level replication mechanism
weeks ago, it's here:

http://www.linuxjournal.com/article.php?sid=7265

And I vaguely remembered NFSv4 of 2.6 kernels seemed to have a built-in
support at filesystem level for data replication & migration.

HTH


> 
> Thanks!
> 
> d
> 
> 
> -- 
> David Bernick
> bernz@bernztech.org
> 
> "They that can give up essential liberty to obtain a little temporary
> safety deserve neither liberty nor safety."
> 		-- Benjamin Franklin, 1759

-- 

Regards, Isaac
()  ascii ribbon campaign - against html e-mail
/\                        - against microsoft attachments

