From: Hans Reiser <reiser@namesys.com>
Subject: Re: access beyond end of device again
Date: Mon, 24 Jun 2002 20:46:14 +0400
Message-ID: <3D174CD6.5000407@namesys.com>
References: <1951319530634.20020624073524@redefine.org> <20020624183557.A2171@namesys.com> <20020624144501.GA28013@matrix.wg> <20020624184948.B896@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10820-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Dirk Mueller <dmuell@gmx.net>, reiserfs-list@namesys.com

Oleg Drokin wrote:

>Hello!
>
>On Mon, Jun 24, 2002 at 04:45:01PM +0200, Dirk Mueller wrote:
>
>  
>
>>>   Do you get these during normal operations? 
>>>   Then it seems some of unformatted pointers were corrupted and you need
>>>   to run reiserfsck to clear these.
>>>      
>>>
>>most lilely the partition is indeed to small (played with fsck lately ?)
>>    
>>
>
>reiserfs does not allocates any blocks past the partition size,
>so I cannot even imagine what are you speaking about ;)
>
>Bye,
>    Oleg
>
>
>  
>
This can be caused by fdisk followed by mkreiserfs without a reboot 
between fdisk and mkreiserfs, yes?

-- 
Hans



