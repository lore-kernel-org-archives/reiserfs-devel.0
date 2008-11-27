From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [patch 1/2] reiser4: adjust to the new aops
Date: Thu, 27 Nov 2008 17:34:26 +0300
Message-ID: <492EAFF2.9070605@gmail.com>
References: <20080924234116.GC30307@wotan.suse.de> <20081017173445.GA10293@infradead.org> <1224269128.15582.9.camel@badari-desktop> <20081021062020.GA17785@wotan.suse.de> <20081021174305.0320f52f.akpm@linux-foundation.org> <4927DB6A.50802@gmail.com> <20081127103418.GK28285@wotan.suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20081127103418.GK28285@wotan.suse.de>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nick Piggin <npiggin@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, torvalds@linux-foundation.org, hch@infradead.org, linux-fsdevel@vger.kernel.org, pbadari@us.ibm.com, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

Nick Piggin wrote:
> On Sat, Nov 22, 2008 at 01:14:02PM +0300, Edward Shishkin wrote:
>   
>> Andrew Morton wrote:
>>     
>>> On Tue, 21 Oct 2008 08:20:20 +0200
>>> Nick Piggin <npiggin@suse.de> wrote:
>>>
>>>   
>>>       
>>>> Nothing uses prepare_write or commit_write. Remove them from the tree
>>>> completely.
>>>>     
>>>>         
>>> argh, reiser4 broke.
>>>
>>> Edward, I'll disable it in config for now.
>>>   
>>>       
>> Here is the fixup plus support of loop devices
>> over compressed files (an old to-do issue).
>> Andrew, please apply.
>>
>> Thanks,
>> Edward.
>>
>>     
>
> Thanks Edward, I appreciate your help with this.

Hi Nick,
I am really happy that somebody looks at my patches..

>  I don't know the
> reiser4 code at all, but just remember that you have to be able to
> tolerate a short-write in write_end (eg. the page may not actually
> have all or any of the memory initialized in the range (pos, pos+len),
> only the range (pos, pos+copied) (ie. copied may be < len).
>
> One thing that many block based filesystems have to be careful of is
> to ensure that the uncopied range (which might contain garbage) doesn't
> get written back to the filesystem.
>
> I can't immediately see whether you handle that or not, but you're not
> using 'copied' anywhere, so that might flag a problem.
>   

reiser4_write_{begin,end} works only in splice.c (i.e. only for
loopback functionality) in the chunk of code which looks like this:

pagecache_write_begin();
...
memcpy(.., to_page);
...
pagecache_write_end(.., to_page, ..);

i.e. there can not be short writes and everything is uptodate.

reiser4_write() has its own means to fight with short writes.
Not everything is excellent here though, but this is another topic..

Thanks,
Edward.
