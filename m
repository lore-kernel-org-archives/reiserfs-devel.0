From: Soeren Sonnenburg <reiserfs@nn7.de>
Subject: Re: trouble with reiserfs on ppc vs-3050:
	wait_buffer_until_released ...
Date: 25 Apr 2003 10:35:23 +0200
Message-ID: <1051259723.3513.7.camel@localhost>
References: <1051258287.5564.1.camel@fortknox>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13804-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1051258287.5564.1.camel@fortknox>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Fri, 2003-04-25 at 10:11, Soeren Sonnenburg wrote:
> Hi...
> 
> I suddenly have a file which when I access it using gvim gives
> 
> vs-3050: wait_buffer_until_released: nobody releases buffer (dev 03:07,
> size 4096, blocknr 2031616, count 3, list 0, state 0x10019, page
> c0add66540, (UPTODATE, CLEAN, UNLOCKED)). Still waiting (570000000)
> JDIRTY !WAIT
> 
> and makes the whole machine hang...
> 
> 
> Ideas what I could do about it ?
> 
> Soeren.

Ahh, forgort to give some details: Machine is apple powerbook iv running
Linux 2.4.20-ben10 ppc (the stable 2.4 ppc 
Ben's Tree: the pmac stable tree
     1. To create the tree, download the latest kernel code from
        kernel.org and untar it into a direcory.
     2. Or, For an existing tree, backup your .config
     3. rsync -avz --delete rsync.penguinppc.org::linux-2.4-benh
        <directory>)

The filesystem was freshly created (today) and 10G were tarred on the
disk...

the /home partition is reiserfs (where that file is on), / is ext3

As I was using reiserfs for a quite long time on any kind of i386
hardware I guess it is a little/big endian issue.

