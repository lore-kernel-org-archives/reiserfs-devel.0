From: Oleg Drokin <green@namesys.com>
Subject: Re: program error
Date: Tue, 1 Apr 2003 11:15:20 +0400
Message-ID: <20030401111520.A19160@namesys.com>
References: <001c01c2f7ed$97210a70$76036fa6@wangzheping>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13507-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <001c01c2f7ed$97210a70$76036fa6@wangzheping>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wang Zheping <wangzhp@cic.tsinghua.edu.cn>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Apr 01, 2003 at 09:25:32AM +0800, Wang Zheping wrote:
> Hi:
>     I have 1 lvm formed by 5 disk.
>     Now 1 disk failed.
>     Remained disk can be readonly now.
>     When I run reiserfsck, display the following:
>     Is it a bug? or how can I trying recover my data?
> Replaying journal..
> Trans replayed: mountid 45, transid 51976, desc 1804, len 25, commit 1830, next trans offset 1813
> bwrite: write 4096 bytes returned -1 (block=2893242, dev=3): Operation not permitted

Well, if the disk can be only readonly, no wonder reiserfsck is unable to replay journal.
If journal have some transactions to replay, underlying media must be writeable.

Bye,
    Oleg
