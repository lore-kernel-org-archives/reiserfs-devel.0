From: Edward Shishkin <edward@namesys.com>
Subject: Re: reiserfs v3.6 problems
Date: Tue, 22 Aug 2006 14:30:11 +0400
Message-ID: <44EADCB3.3050609@namesys.com>
References: <5b4b34380608211738n4ec479cbraed2df60c622ab1e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29654-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5b4b34380608211738n4ec479cbraed2df60c622ab1e@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: mack ragan <gtcoldfire@gmail.com>
Cc: reiserfs-list@namesys.com

mack ragan wrote:
> Hi,
> 
> My root partition will not mount...strange problems have built up to this,
> like not being able to read files as root...and I get the following output
> frim "debugreiserfs /dev/hdb2":
> 
> debugreiserfs 3.6.19 (2003 www.namesys.com)
> 
> 
> Filesystem state: consistency is not checked after last mounting
> 
> Reiserfs super block in block 16 on 0x342 of format 3.6 with standard
> journal
> Count of blocks on the device: 6359728
> Number of bitmaps: 195
> Blocksize: 4096
> Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
> blocks): 6359728
> Root block: 0
> Filesystem is clean
> Tree height: 0
> Hash function used to sort names: "r5"
> Objectid map size 968, max 972
> Journal parameters:
>        Device [0x0]
>        Magic [0x482c3fa]
>        Size 8193 blocks (including 1 for journal header) (first block 18)
>        Max transaction length 1024 blocks
>        Max batch size 900 blocks
>        Max commit age 30
> Blocks reserved by journal: 0
> Fs state field: 0x3:
>        FATAL corruptions exist.
>         some corruptions exist.
> sb_version: 2
> inode generation number: 49892980
> UUID: 3eeff8ac-8c07-4a98-b126-7bcebd4480c1
> LABEL:
> Set flags in SB:
>        ATTRIBUTES CLEAN
> 
> I have run "reiserfsck --rebuild-sb" and "reiserfsck --rebuild-tree" based
> on some forum/message boards regarding similar symptoms/issues, but 
> still no
> good.  Is there anyway I can recover?  I'm not very experienced with
> reiserfs, so any help is very appreciated.

It would be better at first to have a backup on a bigger spare partition
using dd. Then try reiserfsck --rebuild-tree on the created image and
send the output.

> 
> Thanks!
> 

