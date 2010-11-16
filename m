From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Little report on reiser4 with 2.6.35.7
Date: Tue, 16 Nov 2010 14:42:48 +0100
Message-ID: <4CE28A58.1020605@gmail.com>
References: <AANLkTincE-JHOYPoZkrBrbqs7eo__s8Vjn3bbEKVzGEB@mail.gmail.com>	<4CDD2634.6@gmail.com> <AANLkTimkcOgupfycVfaQj7Cu7yK5V+afbRBziTkVQ=e9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <AANLkTimkcOgupfycVfaQj7Cu7yK5V+afbRBziTkVQ=e9@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Magicloud Magiclouds <magicloud.magiclouds@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Looks like an old bug. This takes place only when running in
disk space pressure situations.

We've successfully reserved space for an extent2tail iteration,
removed an extent item and are trying to insert tail. The function
write_tail() tries in turn to reserve space (that isn't necessary
for us) and returns ENOSPC. However, here we are at a critical
point: there are neither tail nor extent. Welcome to data corruption..
The fixup will be later..

Thanks,
Edward.


Magicloud Magiclouds wrote:
> On Fri, Nov 12, 2010 at 7:34 PM, Edward Shishkin
> <edward.shishkin@gmail.com> wrote:
>   
>> Magicloud Magiclouds wrote:
>>     
>>> Hi,
>>>
>>>       
>> Hello.
>>
>>     
>>>   I compiled 2.6.35.7 kernel with reiser4 patch on debian sid. And I
>>> found a serious problem. When the reiser4 fs was full, it broke down,
>>> which lead the module to "bus error".
>>>       
>> Could you provide any related kernel messages?
>> Which subsystem complained on "bus error"?
>>
>> Thanks for the report.
>> Edward.
>>
>>     
>>>  Then I fscked it, I had to "fix"
>>> and "build file system". At last, I lost some files (not sure of the
>>> contents of the left files), which are not created right before it
>>> broke down.
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>>
>>>       
>>     
> Sorry, I cannot provide full log here. Much of it was not saved. Here
> is the trace right when the file system crash down. Then I used a live
> CD to fsck. And by "bus error", I meant when I mounted the fs in live
> cd (with same kernel), first, I could do something like `ls`. But
> later on, fs operation directly returned as message "bus error". And
> the reiser4 module hung. I had to reboot the live to do more things.
> Hoping this could help.
>
> Message from syslogd@magicloud at Nov 11 09:41:33 ...
> kernel:[82745.261246] Oops: 0002 [#1] SMP
>
> Message from syslogd@magicloud at Nov 11 09:41:33 ...
> kernel:[82745.261273] last sysfs file:
> /sys/devices/pci0000:00/0000:00:1f.1/ide0/0.0/block/hda/uevent
>
> Message from syslogd@magicloud at Nov 11 09:41:33 ...
> kernel:[82745.261830] Process ls (pid: 7184, ti=c78ec000 task=dd7103e0
> task.ti=c78ec000)
>
> Message from syslogd@magicloud at Nov 11 09:41:33 ...
> kernel:[82745.261879] Stack:
>
> Message from syslogd@magicloud at Nov 11 09:41:33 ...
> kernel:[82745.262074] Call Trace:
>
> Message from syslogd@magicloud at Nov 11 09:41:33 ...
> kernel:[82745.262510] Code: c3 90 90 89 c2 0f b7 02 38 e0 8d 88 00 01
> 00 00 75 05 3e 66 0f b1 0a 0f 94 c1 0f b6 c1 85 c0 0f 95 c0 0f b6 c0
> c3 ba 00 01 00 00 <3e> 66 0f c1 10 38 f2 74 06 f3 90 8a 10 eb f6 c3 53
> 89 c1 9c 58
>
> Message from syslogd@magicloud at Nov 11 09:41:33 ...
> kernel:[82745.262659] EIP: [<c1269b00>] _raw_spin_lock+0x5/0x15 SS:ESP
> 0068:c78ede48
>
> Message from syslogd@magicloud at Nov 11 09:41:33 ...
> kernel:[82745.262695] CR2: 0000000000000030
>
>   

