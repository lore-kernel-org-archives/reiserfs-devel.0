From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Reiser4 oops with 2.6.13-rc6-mm2
Date: Sun, 28 Aug 2005 17:21:01 +0400
Message-ID: <4311BA3D.3030409@namesys.com>
References: <656cfae8050827090370d11864@mail.gmail.com>	 <4310A781.9050607@gmx.net> <656cfae80508271241796ba017@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25676-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <656cfae80508271241796ba017@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ronald Moesbergen <ronald.moesbergen@gmail.com>
Cc: "evilninja@gmx.net" <evilninja@gmx.net>, reiserfs-list@namesys.com, grev@namesys.com

Hello

Ronald Moesbergen wrote:
> Hi,
> 
> Thanks for responding. To clarify: I'm not running linux inside
> vmware, I'm running vmware on linux and the vmware images are on a
> reiser4 partition. I'm running windows inside vmware. I can certainly
> reproduce this,

Yes, vmware + reiser4 problem is close to top of things to be fixed.

 but haven't tried without the nvidia module. I will do
> that right now and report back.
> 
> Thanks,
> Ronald.
> 
> On 8/27/05, evilninja@gmx.net <evilninja@gmx.net> wrote:
>>Ronald Moesbergen schrieb:
>>>Hi,
>>>
>>>While running a vmware virtual machine from a reiser4 filesystem, my
>>>machine consistently locks up and produces the following OOPS:
>>>
>>>kernel: Oops: 0002 [#1]
>>>kernel: PREEMPT SMP
>>>kernel: last sysfs file: /class/vc/vcsa8/dev
>>>kernel: Modules linked in: vmnet vmmon nvidia
>>is this reproducible and is it reproducible when you don't run this
>>inside vmware? the tainted kernel could make it hard to find a solution
>>here...
>>
>>Christian.
>>
> 
> 

