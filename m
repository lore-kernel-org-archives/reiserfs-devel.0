From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Reiser4/2.6.11 dbench hang
Date: Wed, 30 Mar 2005 22:21:35 +0200
Message-ID: <424B0A4F.8010809@gmx.net>
References: <4249D57F.8020809@gmx.net> <1112188350.4761.671.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23740-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1112188350.4761.671.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vladimir Saveliev <vs@namesys.com>, reiserfs-list@namesys.com

Vladimir Saveliev schrieb:
> Hello
> 
> On Wed, 2005-03-30 at 02:23, Christian Mayrhuber wrote:
> 
>>Hi,
>>
>>If I'm running plain 2.6.11(.0) patched with 
>>reiser4-for-2.6.11-broken-out.2.gz I can hang reiser4 when running
> 
> 
> When you say "hang reiser4" do you mean that system freezes completely
> (does not respord to key pressing, etc)?

dbench-3.02 stuck in its cleanup phase when simulating 200 clients but
it kept reporting the benchmark statistics every second.

All X11 applications were useable till they performed some disk io. 
After that they stopped reacting to user interaction.

Next I tried to switch to vt01, which failed.
I waited for about 10 minutes but the system did not react to any
keyboard events. Even the keyboard leds (num lock, caps lock) stopped
working.

Finally I performed a cold reboot.

> 
> Is it SMP box? How much RAM does the box have? 
> 

No, it's an UP Athlon XP 1800+ Palomino system with 512MB RAM.
The mainboard uses the Nvidia NFORCE2 chipset and has a 60GB
seagate harddrive attached to its primary ide controller.
The kernel was optimized for the AMD K7 platform by gcc-3.3.5.
No other patches than the reiser4 patch were applied.

-- 
lg, Chris
