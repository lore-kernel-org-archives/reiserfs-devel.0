From: Edward Shishkin <edward@namesys.com>
Subject: Re: reiser4 mount options
Date: Mon, 24 Dec 2007 03:38:29 +0300
Message-ID: <476EFF85.2070002@namesys.com>
References: <14476466.post@talk.nabble.com> <476E6CE2.7030004@namesys.com> <14483298.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <14483298.post@talk.nabble.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: butdiene <butdiene@yahoo.com>
Cc: reiserfs-devel@vger.kernel.org

butdiene wrote:

>right now, I'm using the following setting. mount options are not the same as
>in /proc/mounts, I'm not sure which ones are accepted.
>
>but the system seems to be more responsible now. the  optimal_io_size was
>64KB, seems to be too small.
>
>I reduced the atom_max_size (from 0x2f238 = 784MB) to 0x800= 8MB.
>
>not sure how they would help. I will report later if it really helps.
>
>thanks
>
>mount|grep sda3;cat  /proc/mounts |grep root
>/dev/sda3 on / type reiser4
>(rw,iocharset=utf8,tmgr.atom_max_flushers=0,optimal_io_size=2097152,atom_max_size=0x800,atom_max_age=0x600,atom_max_flushers=0)
>rootfs / rootfs rw 0 0
>/dev/root / reiser4
>  
>
atom_max_size=0x2f238,atom_max_age=0x927c0,atom_min_size=0x100,atom_max_flushers=0x1,cbk_cache_slots=0x10

^^^^^^^^^^^^^^^^^^^^   

You have atom_max_size unchanged.
Please, edit your /etc/fstab and reboot.

Thanks,
Edward.

>0 0
>
>
>Edward Shishkin wrote:
>  
>
>>butdiene wrote:
>>
>>    
>>
>>>Hi,
>>>
>>>I run reiser4 on a laptop. I got serious fsync/flush problem.
>>>
>>>almost randomly, the hard drive would run busy for minutes to dozens of
>>>minutes. while the computer is still responsive during this period, but
>>>firefox would hang until the hard gets idle again.
>>> 
>>>
>>>      
>>>
>>Hm.. firefox is fsync-bound app?
>>
>>    
>>
>>>I guess I can set mount options to improve the situation.
>>> 
>>>
>>>      
>>>
>>That hang can have a complex nature.
>>
>>Well, try to play with the mount option "tmgr.atom_max_size=N",
>>where N is atom size in blocks (by default it is total RAM pages / 4).
>>Look at /proc/mounts to make sure that your changes take effect.
>>
>>If it doesn't help, then let me know.
>>
>>Thanks,
>>Edward.
>>
>>    
>>
>>>Any suggestion is appreciated.
>>>
>>>thanks
>>> 
>>>
>>>      
>>>
>>-
>>To unsubscribe from this list: send the line "unsubscribe reiserfs-devel"
>>in
>>the body of a message to majordomo@vger.kernel.org
>>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
>>    
>>
>
>  
>

