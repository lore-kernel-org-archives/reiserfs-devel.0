From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 mkfs, cryptcompress, tail packing, etc.
Date: Tue, 24 Aug 2010 19:47:59 +0200
Message-ID: <4C7405CF.3040609@gmail.com>
References: <4C73EDEF.8020701@bobich.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4C73EDEF.8020701@bobich.net>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Gordan Bobic <gordan@bobich.net>
Cc: reiserfs-devel@vger.kernel.org

Gordan Bobic wrote:
> Hi,

Hello.

>
> It's been a while since I last tried reiser4, and having just looked 
> at the wiki, I couldn't find any info at all on the cryptocompress 
> plugin and tail packing options at mkfs time specifically relating to 
> reiser4.

mkfs.reiser4 -l:

compression modes (works "per file"):

"latt"              (id:0x1 type:0xd) ['Check on dynamic lattice' 
compression mode plugin.]
If logical cluster in incompressible, then switch compression off and 
check every
K-th cluster, where K dynamically increased to 32 on every non-success after
compression. If cluster is compressible, than K is set back to 1, etc..

"ultim"             (id:0x2 type:0xd) ['Check ultimately' compression 
mode plugin.]
Switch compression off forever after the first case of non-success.

"force"             (id:0x3 type:0xd) ['Compress evrything' compression 
mode plugin.]
Force to compress everything.

"conv"              (id:0x4 type:0xd) ['Convert to extent' compression 
mode plugin.]
If the first logical cluster of the file is incompressible, then switch 
compression off forever.
This is default mode, but it works not good on various media-files..

> Also, is there a nolog option on reiser4 as there is on reiserfs?

no sorry, currently reiser4 transaction manager can not be switched off.

>
> The reason I ask is because I am looking for a file system that 
> improves on ext2 for very slow writing flash media (think cheap USB 
> sticks, SD cards, etc.). So, ideally, I want to disable journalling 
> and enable compression, to minimize the number of writing to the 
> underlying media. In theory, compression with journalling switched off 
> should give reiser4 an edge in this use-case, so I just wanted to 
> check what the current state of the compression is (couldn't find any 
> references to -o create=ccreg40 in the wiki), and that it works as one 
> might expect (compressing before committing to disk).

Works stable as expected (i.e. compression "on commits")

>
>
> Another question (not sure if it is specifically related to reiser4 or 
> generic) is about compressed hard-linked DLLs and mmap. Specifically, 
> if a .so is hard-linked in two places, dynamically linking to each 
> instance causes both to be mmapped to the same memory since they'll 
> have the same inode, and that means the memory is only used once. How 
> does this work if the .so is compressed? Does it all still work the 
> same, with the decompressed file being in a single mmap for both 
> dynamically linked instances?

Works as usual: when populating address space by readpage(s) data are 
read from disk and decompressed.
If  page gets dirty, then its data will be compressed in flush time and 
written to disk.
 
>
> Many thanks.

You are welcome,
Edward.
