From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: mkreiserfs -s 1024 makes unmountable partitions
Date: Mon, 27 Jan 2003 15:20:34 +0100
Message-ID: <3E354032.2060504@mb.tu-ilmenau.de>
References: <20030118080941.B5575@humilis> <20030118115724.GA946@Kadath> <20030121213336.GA6756@hell.mine.nu> <20030122065712.D5575@humilis> <20030122100342.GA14100@hell.mine.nu> <20030124222823.GA15643@hell.mine.nu> <20030126181816.GA1274@Kadath> <20030127095957.A22720@namesys.com> <20030127112651.GA10556@hell.mine.nu> <20030127143305.A26767@namesys.com> <20030127124650.GA935@Kadath>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12509-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Francois-Rene Rideau <fare@tunes.org>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 01/27/2003 01:46 PM, Francois-Rene Rideau wrote:
> On Mon, Jan 27, 2003 at 02:33:05PM +0300, Oleg Drokin wrote:
> 
>>>>ftp://ftp.suse.com/pub/people/mason/patches/data-logging
>>>
>>>Thanks for the tip. Can you tell me which patches are needed?
>>
>>01-relocation-5.diff.gz is the one.
> 
> Darn, it doesn't quite apply to the vanilla 2.4.20 kernel. Oh well.
> Is there a patch for 2.4.20 that does it?
> Or maybe a recent 2.4 reiserfs tree ready to use?
> I understand I'm being annoying for not much.
> Well, maybe I'll just use ext3 for these small partitions.
> Anyway, thanks for all the tips.
> 
> Cheers!
> 

Hi!

I hope you used
ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.20/01-relocation-5.diff.gz

If you follow Chris Masons style and make up a link called "b" from your 
"linux" directory in the kernel src dir it applies well on a plain 
2.4.20 from kernel.org. (And I always thought that to be called 
"vanilla"...)

Manuel

