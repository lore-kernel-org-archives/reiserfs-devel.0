From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: vs-6030
Date: Fri, 04 Mar 2005 11:11:21 +0300
Message-ID: <1109923874.3504.577.camel@tribesman.namesys.com>
References: <263a8b350503031343182f4e4a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <263a8b350503031343182f4e4a@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: btinsley <btinsley@gmail.com>
Cc: reiserfs-list@namesys.com

Hello

On Fri, 2005-03-04 at 00:43, btinsley wrote:
> I posted this kernel panic once before and received no response. Now I
> have another occurence and I need to find out what is happening:
> 

Can you reproduce this easily?
If no, please tell more about what did filesystem do when panic occured.

> vs-6030: check_internal_block_head: invalid item number level=2,
> nr_items=211, free_space=64536 rdkey kernel BUG at prints.c:334!
> invalid operand: 0000 2.4.21-241-smp #1 SMP Tue Aug 10 15:55:34 UTC 2004
> 
> Running reiserfsck (3.6.19) detects no problems. Running a
> --rebuild-tree doesn't seem to correct the problem. It seems the only
> way it is repaired is to run mkreiserfs, which is totally
> unacceptable.

This means that filesystem is not corrupted. Reiserfs detects that it is
doing something wrong and panics. Filesystem is left intact.
> 
> Any assistance is much appreciated. If I need to arrange to pay for
> support, I can.
> 
> Thanks!
> 

