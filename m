From: PFC <lists@boutiquenumerique.com>
Subject: Re: Reiser4 + laptop -> ouch
Date: Thu, 20 Oct 2005 13:36:54 +0200
Message-ID: <op.syxzvsesth1vuj@localhost>
References: <43537D56.3020208@eastwind.ru> <op.sysz7pxnth1vuj@localhost> <200510182209.19370.zam@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-26581-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200510182209.19370.zam@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: Alexander Zarochentsev <zam@namesys.com>, reiserfs-list@namesys.com


I have this kernel :

linux-2.6.11-cko1-swsusp2

I chose this because it has reiser4 included, and software suspend 2...  
turns out software suspend does not work on this laptop, so I don't use  
it...

How can I get the filesystem version ? I grepped the reiser4 kernel  
sources for "version" but nothiing relevant came out.

Thanks for your help.



On Tue, 18 Oct 2005 20:09:19 +0200, Alexander Zarochentsev  
<zam@namesys.com> wrote:

> Hello,
>
> On Monday 17 October 2005 22:56, PFC wrote:
>> I've been using Reiser4 on my laptop for a while and all I can say is,
>> well, that's the only filesystem that makes a crap 5200rpm drive
>> responsive and usable. That's really great !
>>
>> However, there are a few problems...
>>
>> Sometimes, when I power down the laptop, the usual power down sequence :
>> - Unmounting Filesystems
>> - Remounting FS read-only
>> - Power Down
>>
>> Stops at "Unmounting Filesystems" and stays there forever ; and I have  
>> to
>> shutdown the thing manually, pressing for 10 seconds on the power  
>> button.
>
> which reiser4 version are you using ?
>
>> Annoying.
>>
>> Also, a few days ago, my laptop battery died and the thing had a hard
>> shutdown. The harddisk had spinned down a moment ago (I remember hearing
>> it doing its clunk-bzzzzz....). Before you mention, no, I don't use the
>> thingie to automatically shutdown the laptop just before the battery  
>> dies,
>> because ACPI sucks on mine, and 50% of the time it says 0% charge left
>> when, in reality, it's at 99%, and the damn thing would shut itself down
>> every 5 minutes.
>>
>> So, after that, my Reiser4 FS died and I had to run a fsck with
>> rebuild-tree from a kanotix boot cdrom.
>>
>> What happened ?
>


