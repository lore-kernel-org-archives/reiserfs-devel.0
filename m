From: Quinn Harris <reiserfs@quinnh.org>
Subject: Re: Linux 2.4 -> 2.6 migration
Date: Fri, 7 Nov 2003 21:08:48 -0700
Message-ID: <19553.638684056$1068264532@news.gmane.org>
References: <m3ptg42t8l.fsf@toyland.sauerland.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16012-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m3ptg42t8l.fsf@toyland.sauerland.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Did you enable IDE TCQ in your 2.6 kernel?  To quote http://www.namesys.com/
download.html
"Don't enable TCQ (Tagged Command Queuing) in 2.5 (and modified 2.4) kernels. 
TCQ is known broken currently and it will corrupt your filesystems for sure."

Quinn


On Friday 07 November 2003 06:39 am, Sebastian Kaps wrote:
> Hi!
> 
> Is there something concerning ReiserFS I should know when migrating from
> Linux 2.4 to Linux 2.6?
> 
> I'm asking because a few days ago I downloaded and compiled 2.6.0-test9
> just for curiosity. It booted fine and I went back to my "standard"
> kernel, which was 2.4.23-pre5 at that time. Right after booting the
> 2.4.x kernel, I got lots of the following messages in my logs:
> ,----
>
> | kernel: ide2(33,3):vs-4080: reiserfs_free_block: free_block
> | (2103:463529)[dev:blocknr]: bit already cleared
>
> `----
> The block number always differed. Gladly, "reiserfsck --rebuild-tree"
> helped to cure that, but there were lots of unusable files after that
> (e.g. parts of files overwritten with parts of other files).
> 
> Is this suppose to happen? What caused this error?
> 
> Another thing: I had to "hard reboot" my system a few times in the last
> few months. I also experienced that sometimes parts of files were
> overwritten with 0x00s or parts of other files. Can someone explain to
> me how this can happen?
> 
> -- 
> Ciao, Sebastian
> 
