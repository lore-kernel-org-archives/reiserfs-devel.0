From: Marcos Dione <mdione@grulic.org.ar>
Subject: Re: problem with reiser3
Date: Mon, 21 Aug 2006 20:29:35 -0300
Message-ID: <20060821232935.GD14067@grulic.org.ar>
References: <20060821222421.GC14067@grulic.org.ar>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29644-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20060821222421.GC14067@grulic.org.ar>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: mdione@grulic.org.ar

On Mon, Aug 21, 2006 at 07:24:21PM -0300, Marcos Dione wrote:
>     hi all. I'm having problems checking a reiser3 filesystem.
> reiserfsck says: 
> 
> bread: Cannot read the block (27887610): (Input/output error).
> 
>     I passed badblocks over the partition and found 61 bad sectors
> (which I know is bad), then run reiserfsck -B with the bad blocks file
> and got the same, but also this:
> 
> create_badblock_bitmap: block number (111550463) points out of fs size (39072080).
> 
>     any hints?

    forgot to mention: I tried to resize the fs to the partition size
and got this:

$ sudo resize_reiserfs /dev/sda1
resize_reiserfs 3.6.19 (2003 www.namesys.com)

/dev/sda1 already is of the needed size. Nothing to be done
