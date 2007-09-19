From: Edward Shishkin <edward@namesys.com>
Subject: Re: Reiser4: File lost during log rollback.
Date: Wed, 19 Sep 2007 18:59:14 +0400
Message-ID: <46F13942.4020507@namesys.com>
References: <6ec7a4340708280229l61d86d1dsf113890277bee68e@mail.gmail.com>	 <alpine.DEB.0.999.0709022011310.7103@sheep.housecafe.de>	 <6ec7a4340709030319k58b3a1afm994e188cb37170fe@mail.gmail.com> <6ec7a4340709030507u2cb968eche850f7365011c38@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <6ec7a4340709030507u2cb968eche850f7365011c38@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Xu CanHao <xucanhao@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Xu CanHao wrote:

>Hello!
>
>1, The system had some power lost recently, I believe the file lost
>during one time(I did not write to that file at once).
>2, Is there any evidence show that 2.6.22 much more stable(or at least
>solved that behavior)?
>  
>

Yes,
it seems, you encountered the bug fixed in reiser4 patch for 2.6.22.
This was discussed in the list a long time ago, also the description
can be found in the patch header:

...
2) unix-file plugin fixups:
   . Fixed bug in extent2tail conversion.
     Bug description:
       when converting partially converted file
       (with flag REISER4_PART_MIXED installed)
       reiser4_cut_tree() starts to cut old metatada
       from wrong offset. Result is data corruption
       when booting after system crach, power loss,
       etc.;
...

Please, update your reiser4 and reiser4progs to the latest
versions, and let me know if any problems.

Thanks,
Edward.

>3, There is no /lost+found directory in a reiser4 partition(AFAIK it's ext2/3).
>4, I've no idea _when_ does the file lost, so tracing the logs is not possible.
>5, fsck.reiser4 reports no corruption.
>
>Thanks!
>
>
>2007/9/3, Christian Kujau <lists@nerdbynature.de>:
>  
>
>>On Tue, 28 Aug 2007, Xu CanHao wrote:
>>    
>>
>>>I've heard someone said reiser4's possibility of losing some file
>>>when crash. Well, I have one exactly the same experience: my system is
>>>slackware 11.0, and vanilla 2.6.21+patch for 2.6.21+r4tools 1.0.5,
>>>after one or two times of power loss, (at least)my /usr/sbin/sendmail
>>>lost, and the partition free space have a ~200MB less. Because of
>>>/usr/sbin/sendmail is not system critical file, I think the loss could
>>>happened some days ago. Any ideas?
>>>      
>>>
>>Does this happen to your system when it has crashed or are you losing
>>files during runtime? Did you try 2.6.22? Checked /lost+found, the system
>>logs? Does fsck report something useful?
>>
>>--
>>BOFH excuse #435:
>>
>>Internet shut down due to maintenance
>>
>>    
>>
>-
>To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>  
>

