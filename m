From: Joshua Masiko <joshua@dsmagic.com>
Subject: Re: can't mount repaired reiserfs partition
Date: Wed, 23 Apr 2003 16:57:31 +0300 (EAT)
Message-ID: <Pine.LNX.4.21.0304231657200.1659-100000@entandikwa.ds.co.ug>
References: <200304231720.22692.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13778-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200304231720.22692.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Joshua Masiko <joshua@dsmagic.com>, reiserfs-list@namesys.com



On Wed, 23 Apr 2003, Vitaly Fertman wrote:

> 
> > Do you want to run this program?[N/Yes] (note need to type Yes if you
> > do):Yes
> > bread: Cannot read the block (4679842): (Invalid argument).
> 
> Strange. And what does debugreiserfs /dev/hdd6 say?
> 
> -- 
> Thanks,
> Vitaly Fertman
> 
timon:/home/joshua/downloads/reiserfsprogs-3.6.6-pre1/debugreiserfs #
./debugreiserfs /dev/hdd6

<-------------debugreiserfs, 2003------------->
reiserfsprogs 3.6.6-pre1

bread: Cannot read the block (4679842): (Invalid argument).

reiserfs_open: Your partition is not big enough to contain the
filesystem of (4679842) blocks as was specified in the found super block.


debugreiserfs: can not open reiserfs on "/dev/hdd6": Unknown error
134516634


