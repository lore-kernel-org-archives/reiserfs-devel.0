From: Hans Reiser <reiser@namesys.com>
Subject: Re: Different size of partion between reiser4 and reiserFS 3.6
Date: Fri, 30 Sep 2005 11:17:33 -0700
Message-ID: <433D813D.3050800@namesys.com>
References: <200509301233.20008.xxlucas@seznam.cz> <433D3274.7050305@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26362-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <433D3274.7050305@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: luc <xxlucas@seznam.cz>, reiserfs-list@namesys.com

Vladimir V. Saveliev wrote:

>Hello
>
>luc wrote:
>  
>
>>Hi,
>>
>>	i want to try use reiser4 and i discover this :
>>
>>I have 80Gb Western Digital HDD. When i created one partition (full 
>>disk)
>>
>>mkfs.reiserfs -f /dev/sda1
>>
>>then obtain this 
>>
>>reiserfs 3.6
>>[root@Merlin luc]# df -k
>>Filesystem           1K-blocks      Used Available Use% Mounted on
>>/dev/sda1             78145768     32840  78112928   1% /mnt/te
>>
>>    
>>
>
>                        ^^^^^^^
>
>  
>
>>when i did 
>>
>>mkfs.reiser4 -f /dev/sda1
>>
>>reiser4
>>[root@Merlin luc]# df -k
>>Filesystem           1K-blocks      Used Available Use% Mounted on
>>/dev/sda1             74256016      2544  74253472   1% /mnt/te
>>
>>    
>>
>                        ^^^^^^^
>
>reiser4 subtracted amount of reserved space. Probably it should have not done that.
>
>  
>
>>I use patch from ftp.namesys.com for kernel 2.6.12 and 
>>libreiser4progs-1.0_4-1.0.4-1mdk , reiser4progs-1.0.4-1mdk. Is here 
>>anyone who is able to explain me why the size of partion sda1 is 
>>different ???
>>    
>>
>
>
>
>  
>
No, it is right as it is.  df tells users what they get to use.
