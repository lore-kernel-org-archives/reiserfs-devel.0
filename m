From: Edward Shishkin <edward@namesys.com>
Subject: Re: problem with reiser3
Date: Tue, 22 Aug 2006 03:38:40 +0400
Message-ID: <44EA4400.6090501@namesys.com>
References: <20060821222421.GC14067@grulic.org.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29647-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060821222421.GC14067@grulic.org.ar>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marcos Dione <mdione@grulic.org.ar>
Cc: reiserfs-list@namesys.com

Marcos Dione wrote:
>     hi all. I'm having problems checking a reiser3 filesystem.
> reiserfsck says: 
> 
> bread: Cannot read the block (27887610): (Input/output error).
> 
>     I passed badblocks over the partition and found 61 bad sectors
> (which I know is bad), 


did you specify reiserfs block size (via option -b) when creating a list
of bad blocks?


then run reiserfsck -B with the bad blocks file
> and got the same, but also this:
> 
> create_badblock_bitmap: block number (111550463) points out of fs size (39072080).
> 
>     any hints?
> 

it would be better to create a backup on a spare bigger partition
using dd_rescue (pad not recoverable zones with zeroes), then run
fsck on the created image.
