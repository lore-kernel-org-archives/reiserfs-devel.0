From: Gorazd Golob <gorazdg@noviforum.si>
Subject: Re: umount and sync delays
Date: Mon, 14 Mar 2005 20:30:08 +0100 (CET)
Message-ID: <Pine.LNX.4.61.0503142008090.26303@dacun>
References: <Pine.LNX.4.61.0503141338470.25427@dacun> <4235CCAE.9030408@namesys.com>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4235CCAE.9030408@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

Hi!

>>
> Probably you just have a lot of dirty buffers in RAM and they need to
> flush to disk?
>
Hmm.. I'll try explain .. Before I did sync or unmount, application, that 
previosly wrote to reiser4 partition was closed. In moment of running sync 
or umount OS had about 1.7gb of data in cache memory. Sync was finished 
in about 45 minutes after. I'm not sure why does it take so long on u320s 
scsi. The problem can be in files which are written to this partition 
- a lot (>1M) of really small files. . Do we have to use some mount arguments?
It's not really practical if server goes out of power and ups will 
last only 5 minutes - not enought time to safe shutdown of system..

Thanks, Gorazd
