From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 mkfs, cryptcompress, tail packing, etc.
Date: Tue, 24 Aug 2010 21:39:18 +0200
Message-ID: <4C741FE6.6080805@gmail.com>
References: <4C73EDEF.8020701@bobich.net> <4C7405CF.3040609@gmail.com> <4C741A02.3090004@bobich.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4C741A02.3090004@bobich.net>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Gordan Bobic <gordan@bobich.net>
Cc: reiserfs-devel@vger.kernel.org

Gordan Bobic wrote:
> On 08/24/2010 06:47 PM, Edward Shishkin wrote:
>
>>> Also, is there a nolog option on reiser4 as there is on reiserfs?
>>
>> no sorry, currently reiser4 transaction manager can not be switched off.
>
> Is there a way to use an external journal and point it at a different 
> device (e.g. ramdisk/tmpfs), and force fsck on unclean shutdown instead?

Nop, transaction manager in reiser4 is not a pure journalling.
This is a symbiosis of journalling and copy-on-write technologies,
so journal relocation wouldn't be a correct option here.

There is a possibility to add various transaction plugins to reiser4,
including pure journalling (like in reiserfs) and pure COW (like in btrfs).
However, it would be a serious work, which requires many human hours..

>
>
>>> Another question (not sure if it is specifically related to reiser4 or
>>> generic) is about compressed hard-linked DLLs and mmap. Specifically,
>>> if a .so is hard-linked in two places, dynamically linking to each
>>> instance causes both to be mmapped to the same memory since they'll
>>> have the same inode, and that means the memory is only used once. How
>>> does this work if the .so is compressed? Does it all still work the
>>> same, with the decompressed file being in a single mmap for both
>>> dynamically linked instances?
>>
>> Works as usual: when populating address space by readpage(s) data are
>> read from disk and decompressed.
>> If page gets dirty, then its data will be compressed in flush time and
>> written to disk.
>
> What about the hard-link issue I mentioned? If two hard-links point to 
> the same inode with a compressed shared library, will it work as 
> expected and only map the file into shared memory once even if both 
> .so files are dyna-linked by different running binaries?

Will work as expected.

Edward.
