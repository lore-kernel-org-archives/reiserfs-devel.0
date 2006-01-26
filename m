From: Edward Shishkin <edward@namesys.com>
Subject: Re: random minor benchmark: Re: Copy 20 tarfiles: ext2 vs (reiser4,
 unixfile) vs (reiser4,cryptcompress)
Date: Thu, 26 Jan 2006 21:17:09 +0300
Message-ID: <43D91225.3030605@namesys.com>
References: <43D7C6BE.1010804@namesys.com> <43D7CA7F.4010502@namesys.com> <20060126153343.GH4311@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27877-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060126153343.GH4311@suse.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jens Axboe <axboe@suse.de>
Cc: Hans Reiser <reiser@namesys.com>, LKML <linux-kernel@vger.kernel.org>, Reiserfs mail-list <Reiserfs-List@namesys.com>

Jens Axboe wrote:

>On Wed, Jan 25 2006, Hans Reiser wrote:
>  
>
>>Notice how CPU speed (and number of cpus) completely determines
>>compression performance.
>>
>>cryptcompress refers to the reiser4 compression plugin, (unix file)
>>refers to the reiser4 non-compressing plugin.
>>
>>Edward Shishkin wrote:
>>
>>    
>>
>>>Here are the tests that vs asked for:
>>>Creation (dd) of 20 tarfiles (the original 200M file is in ramfs)
>>>Kernel: 2.6.15-mm4 + current git snapshot of reiser4
>>>
>>>------------------------------------------
>>>
>>>Laputa workstation
>>>Uni Intel Pentium 4 (2.26 GHz) 512M RAM
>>>
>>>ext2:
>>>real 2m, 15s
>>>sys 0m, 14s
>>>
>>>reiser4(unix file)
>>>real 2m, 7s
>>>sys  0m, 23s
>>>
>>>reiser4(cryptcompress, lzo1, 64K)
>>>real 2m, 13s
>>>sys 0m, 11s
>>>      
>>>
>
>Just curious - does your crypt plugin reside in user space?
>
>  
>

Nop.
This is just wrappers for linux crypto api, zlib, etc..
so user time is zero and not interesting.

Edward.



