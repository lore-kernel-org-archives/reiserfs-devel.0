From: Hans Reiser <reiser@namesys.com>
Subject: Re: random minor benchmark: Re: Copy 20 tarfiles: ext2 vs (reiser4,
 unixfile) vs (reiser4,cryptcompress)
Date: Thu, 26 Jan 2006 23:30:57 -0800
Message-ID: <43D9CC31.9030209@namesys.com>
References: <43D7C6BE.1010804@namesys.com> <43D7CA7F.4010502@namesys.com> <20060126153343.GH4311@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932191AbWA0HbU@vger.kernel.org>
In-Reply-To: <20060126153343.GH4311@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jens Axboe <axboe@suse.de>
Cc: Edward Shishkin <edward@namesys.com>, LKML <linux-kernel@vger.kernel.org>, Reiserfs mail-list <Reiserfs-List@namesys.com>

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
No, kernel.  It would have to  encrypt+compress with every write to be
in user space, we encrypt+compress only at flush time, and that is a key
optimization (encryption is disabled at the moment due to needing a
little API work, but....) for file sets that are cachable.
