From: sergey ivanov <seriv@parkheights.dyndns.org>
Subject: Re: reiser4 problems
Date: Wed, 22 Mar 2006 08:21:59 -0500
Message-ID: <44214F77.5090103@parkheights.dyndns.org>
References: <442040FF.4040800@parkheights.dyndns.org> <200603221033.43606.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28313-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200603221033.43606.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: vitaly@namesys.com, reiserfs-list@namesys.com

Vitaly Fertman wrote:
> Hello,
>
> On Tuesday 21 March 2006 21:07, Sergey Ivanov wrote:
>   
>> Hi,
>>
>>     
> wrong bytes is not a big problem, reiser4 indeed counted them wrongly some 
> time ago, although it seems to be fixed already. the only serious problem 
> here is at the beginning of the 'CHECKING STORAGE TREE' pass -- there must 
> not be a key [0:0(NAME):0:0:0].
>  
>   
>> After second fsck, I have unmounted and mounted it read only to save
>> data on ext3 partition and to wait answers and suggestions before using
>> reiser4 once more.
>>     
>
> which reiser4progs version do you use?
>   
1.0.5
> it is already difficult to say why this strange key appeared -- you have
> already run several build-fs runs -- although it may be related to remount 
> (I remember we used to have some problems before) or to fsck --build-fs.
>   
But I was not able to use filesystem after first fsck --build-fs. Even
ls <mountpoint> was failing with io error message.
> unmount you fs please and run 'fsck --check' on the unmounted fs -- check 
> that all is right there now.
>   
FS is consistent
> which kernel version do you use?
>   
It's 2.4.16, ALTLinux vserver's kernel (see
http://www.sisyphus.ru/srpm/kernel-image-vs26-smp) with applied patch
based on namesys' for 2.6.14, you can see it's spec, changelog and
download it from http://www.sisyphus.ru/srpm/kernel-feat-fs-reiser4.

As I can see now, all data were intact, everything restored O.K after
these 2 fsck --build-fs.
-- 
    With best regards,
       Sergey Ivanov
