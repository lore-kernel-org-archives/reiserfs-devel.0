From: Edward Shishkin <edward@namesys.com>
Subject: Re: problem with reiser3
Date: Tue, 22 Aug 2006 13:42:32 +0400
Message-ID: <44EAD188.3080308@namesys.com>
References: <20060821222421.GC14067@grulic.org.ar> <44EA4400.6090501@namesys.com> <20060821235338.GE14067@grulic.org.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29653-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060821235338.GE14067@grulic.org.ar>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marcos Dione <mdione@grulic.org.ar>
Cc: reiserfs-list@namesys.com

Marcos Dione wrote:
> On Tue, Aug 22, 2006 at 03:38:40AM +0400, Edward Shishkin wrote:
> 
>>Marcos Dione wrote:
>>
>>>   hi all. I'm having problems checking a reiser3 filesystem.
>>>reiserfsck says: 
>>>
>>>bread: Cannot read the block (27887610): (Input/output error).
>>>
>>>   I passed badblocks over the partition and found 61 bad sectors
>>>(which I know is bad), 
>>
>>
>>did you specify reiserfs block size (via option -b) when creating a list
>>of bad blocks?
> 
> 
>     dunno which is the block size. tried to figure it out, but (from
> dmesg trying to mount the partition):
> 


debugreiserfs /dev/sda1
then look at Blocksize it the output


> ReiserFS: sda1: journal params: device sda1, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
> 
>     and:
> 
> $ sudo reiserfstune /dev/sda1
> reiserfstune: Filesystem looks not cleanly umounted, check the consistency first.
> 
>     I assume it's the 8192 the kernel reports...
> 
> 
>>it would be better to create a backup on a spare bigger partition
>>using dd_rescue (pad not recoverable zones with zeroes), then run
>>fsck on the created image.
> 
> 
>     unluckly I can't. it's a 160 GiB partition and I don't have spare
> space.
> 
> 

