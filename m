From: Wes Janzen <superchkn@sbcglobal.net>
Subject: Re: FS Corruption with VIA MVP3 + UDMA/DMA
Date: Mon, 14 Jul 2003 09:13:47 -0500
Message-ID: <3F12BA9B.6040404@sbcglobal.net>
References: <16128.19218.139117.293393@charged.uio.no> <3F007EBF.9020506@sbcglobal.net> <3F10729F.7070701@sbcglobal.net> <20030714090615.GA6334@tentacle.sectorb.msk.ru>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------010103060503010407030908"
Return-path: <reiserfs-list-return-14931-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030714090615.GA6334@tentacle.sectorb.msk.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Vladimir B. Savkin" <master@sectorb.msk.ru>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, reiserfs-list@namesys.com

--------------010103060503010407030908
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Spread spectrum is disabled in my BIOS as I heard that it could cause 
issues in some cases.

I never had the DMA timeout issue, it just silently corrupts data ;-(

Just to add to things that probably aren't causing the problems, my PCI 
bus is running at 33MHz as the FSB of 100MHz is in spec for this board.

Vladimir B. Savkin wrote:

>Hi!
>
>On Sat, Jul 12, 2003 at 03:42:07PM -0500, Wes Janzen wrote:
>  
>
>>Thanks for the suggestions, here's what I've tried to solve the problem:
>>-->Tested system memory for 4 consecutive days with memtest86
>>-->Replaced SDRAM with new modules tested in every DIMM slot
>>-->Tried the ac patch on 2.5.69
>>-->Clocked K6-2 back to 350 from 400 (FSB still 100Mhz)
>>-->Played with PCI settings in the BIOS
>>-->Removed all other cards except AGP video card
>>-->Disabled all other integrated peripherals in the BIOS (only serial 
>>and parallel in this case).
>>-->Reverted to BIOS defaults.
>>
>>    
>>
>
>I was using PA2013, and was having problems with IDE too.
>The data corruption was solved after turning off "Spread spectrum
>modulated" feature in the BIOS setup (AFAIR this misfeature is ON
>by default). But I wasn't able to get on-board IDE working right
>nevertheless. For some strange reason it was OK with kernel 2.2.15
>but produced DMA timeouts with every later kernel version I tested.
>Yes, I did try copying VIA IDE driver from 2.2.15 to later kernel,
>it still didn't help. So I ended up with Promise controller too :(
>
>:wq
>                                        With best regards, 
>                                           Vladimir Savkin. 
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>Please read the FAQ at  http://www.tux.org/lkml/
>
>  
>

--------------010103060503010407030908--

