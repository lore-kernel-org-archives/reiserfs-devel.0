From: Gordan Bobic <gordan@bobich.net>
Subject: reiser4 mkfs, cryptcompress, tail packing, etc.
Date: Tue, 24 Aug 2010 17:06:07 +0100
Message-ID: <4C73EDEF.8020701@bobich.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Hi,

It's been a while since I last tried reiser4, and having just looked at 
the wiki, I couldn't find any info at all on the cryptocompress plugin 
and tail packing options at mkfs time specifically relating to reiser4. 
Also, is there a nolog option on reiser4 as there is on reiserfs?

The reason I ask is because I am looking for a file system that improves 
on ext2 for very slow writing flash media (think cheap USB sticks, SD 
cards, etc.). So, ideally, I want to disable journalling and enable 
compression, to minimize the number of writing to the underlying media. 
In theory, compression with journalling switched off should give reiser4 
an edge in this use-case, so I just wanted to check what the current 
state of the compression is (couldn't find any references to -o 
create=ccreg40 in the wiki), and that it works as one might expect 
(compressing before committing to disk).

Another question (not sure if it is specifically related to reiser4 or 
generic) is about compressed hard-linked DLLs and mmap. Specifically, if 
a .so is hard-linked in two places, dynamically linking to each instance 
causes both to be mmapped to the same memory since they'll have the same 
inode, and that means the memory is only used once. How does this work 
if the .so is compressed? Does it all still work the same, with the 
decompressed file being in a single mmap for both dynamically linked 
instances?

Many thanks.

Gordan
