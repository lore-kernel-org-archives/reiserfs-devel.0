From: Vince <fuzzy77@free.fr>
Subject: Re: fsck.reiser4 1.0.0, segmentation fault
Date: Fri, 13 Aug 2004 00:11:30 +0200
Message-ID: <411BEB12.3050006@free.fr>
References: <411BDC03.3090105@free.fr> <200408130143.09138.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20247-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408130143.09138.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com

Vitaly Fertman wrote:
> On Friday 13 August 2004 01:07, Vince wrote:
> 
>>Hi,
>>
>>I got a segmentation fault while converting my reiser4 partition to the
>>new format:
>>
>>1) I first launched "debugfs.reiser4 -C /mydevice"
>>
>>(sidenote: il looks like the conversion requires really a lot -- too
>>much ? -- memory. It ate up to 450MB in my case and I had to shut down
>>almost all my running programs in order for it to finish...)
>>
>>2) fsck.reiser4 asks to do a --build-fs 
> 
> 
> you did not run fsck before convertion so it is difficult to say if these 
> corruptions existed then, did not you? have you run fsck with logfile? 
> may I have a look at it if so?

Indeed I didn't run fsck before conversion, sorry :-(

> 
> oh, sorry, a stupid mistake in the recent changes. try this fix please.
> [...]
> 

Your fix look right, thank you very much ! :-)

---------------------------------------------------------
***** fsck.reiser4 finished at Fri Aug 13 00:02:36 2004
Closing fs...done

FS is consistent.


