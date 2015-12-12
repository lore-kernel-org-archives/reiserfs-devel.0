From: <doiggl@velocitynet.com.au>
Subject: Re: What can I do next to use R4 partition  sdb
Date: Sat, 12 Dec 2015 19:45:25 +1100
Message-ID: <9d2c1f384ed3f05133ed1433eddc2c89@mail.velocitynet.com.au>
References: <114fff4391af47417e806586fb761345@mail.velocitynet.com.au> <24322648.R9GnluWRk3@intelfx-laptop> <458361e3164a300c930420b3dd9e5b43@mail.velocitynet.com.au> <53FDD565.6030500@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <53FDD565.6030500@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org


>> ***** fsck.reiser4 finished at Wed Aug 27 03:39:46 2014
>> Closing fs...done
>>
>> FS is consistent.
> 
> 
> This is a bug in fsck: it jumps to wrong branch for some reasons.
> Not yet fixed.
> 
> Edward.

#
Hello,
- What line/module changes would allow this to happen [allow fsck to jump
to correct branch]?
I can use 'dd' to make a disk image to another disk and use that.
Thanks Glenn


