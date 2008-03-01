From: John <geearf@free.fr>
Subject: Re: No space left on rfs4
Date: Sun, 2 Mar 2008 00:05:49 +0100
Message-ID: <f0eb0c7b9eeefc6f2b19a7bdbdbce087@free.fr>
References: <47C9DE8A.5010207@gmail.com>
Reply-To: geearf@free.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <47C9DE8A.5010207@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org



On Sun, 02 Mar 2008 01:54:02 +0300, Edward Shishkin <edward.shishkin@gmail.com> wrote:
> John wrote:
> 
>>Hello,
>>
>>Last time, it happened 2 days ago.
>>
>>
> 
> So it was with 2.6.24, right?
Yep.
Also happened with 2.6.23 a few weeks ago.
> 
>>What would be a full bugreport?
>>
> 
> What exactly happens when you get no space left on device?
> Is it a kernel oops, or just a system a freeze?
> Are there any related kernel messages?
I'm getting an error message about it, and that is about all.
The system can still be used if it is not the / partition.

> What kind of workload do you use to exhaust disk space?
Just extracting files from a tar.bz2 to the wrong partition.

> What exactly happens when you try to delete files on the
> device with no space left?
The issue starts when I try to remove the files that caused that problem.
I'm guessing that the files freezing my shell when I try to delete them are the ones that could not be fully copied: some files can be removed without any issue, and others just freeze my shell (not my system).
Once my shell has been frozen rebooting will not be possible. Probably the partition cannot be unmounted or something like that.

> Is your device formatted with reg40 (default), or ccreg40 (I am
> a bit confused: reiser4progs-1.0.5 are not aware of ccreg40).
Right, last time it happened with a reg40 partition.
Before that I thought it was with a ccreg40 but maybe not. I ain't sure anymore.
For now my / is ccreg40 and my /home is reg40. The issue this week came with /home being full.


Would you like me to recreate that partition with 1.0.6?
Actually I have another partition created this week with 1.0.6 in ccreg40, I can easily fill it and see what happens then.



Thank you,

John

