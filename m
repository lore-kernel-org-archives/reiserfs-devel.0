From: Devils-Hawk <devilshawk@aon.at>
Subject: Re: Kernel panic with reiser4 for 2.6.18-2
Date: Thu, 16 Nov 2006 20:43:10 +0100
Message-ID: <455CBF4E.4060001@aon.at>
References: <455B83DF.8090209@aon.at> <455B9469.9000908@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30180-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <455B9469.9000908@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Edward Shishkin <edward@namesys.com>
Cc: reiserfs-list@namesys.com

I will try to get a proper backtrace as soon as possible. The oops 
occurs directly after mount during system boot so i'll need to get 
serial or network console up and running first.

The fs was created with mkfs.reiser4 without any options given. Kernel 
during that time was a 2.6.17 series with reiser4-for-2.6.17-3.patch. 
reiser4progs version is 1.0.5. disk is SATA on an Promise PCI controller 
card.

regards devh

Edward Shishkin wrote:
> Devils-Hawk wrote:
> 
>> reiser4 partition is /, happens during kernel boot, checked the fs 
>> before boot and was clean. kernel is gentoo-sources-2.6.18-r2.
>>
>> reiser4 panicked cowardly: reiser4[hotplug(313)]: readpage_tail 
>> (fs/reiser4/plugin/item/tail.c:426)[umka-2517]: assertion failed: 
>> !jprivate(page) && !PagePrivate(page)
>>
>> if u need more info, feel free to ask
>> regards, devh
>>
>>
> 
> would you please provide a backtrace, if possible.
> what reiser4 stuff did you use before the upgrade?
> 
> Thanks,
> Edward.
> 
> 
> 

