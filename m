From: Oleg Drokin <green@namesys.com>
Subject: Re: lvm+loop-aes+reiserfs / iput deadlock fix
Date: Thu, 30 Jan 2003 14:32:18 +0300
Message-ID: <20030130143218.A1057@namesys.com>
References: <5.2.0.9.2.20030129233147.02056cf8@pop.tvnet.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12557-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <5.2.0.9.2.20030129233147.02056cf8@pop.tvnet.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Newsmail <newsmail@satimex.tvnet.hu>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Jan 29, 2003 at 11:34:10PM +0100, Newsmail wrote:
> Where does process hang this time? (press SysRQ-T, decode the output and 
> send it to me) ---->
> could you please tell me what is SysRQ-T? btw its a remote machine...

sysrq-T is combinatin of keys "Alt+PrtSc/SysRq+t" (three keys totally)
that should be pressed simultaneusly (in this order.).
You need to have sysrq enabled both in your kernel config and in 
sysctl (modern discros tend to disable it for some reason).

Well, if the box is remote, then may be you have serial console?
You need to send <Break> followed by T, then (over your serial line).

That will output list of currently running tasks and their stacks.

> ps: well you say that its maybe a crypto-loop side problem, what I dont 
> understand why it only came after 2.4.20-preX introduced, and it works 
> absolutly without any problem on 2.4.19.

Well, there were not only reiserfs changes in 2.4.20-pre series, you know.
You can even take content of fs/reiserfs/{*.c,Makefile} and
include/linux/reiserfs*.h from 2.4.19, put these into 2.4.20 kernel
sources at appropriate places, recompile the kernel and see what will happen.

I tried to write with reiserfs onto crypto-aes enabled loop device and
wrote 20G of data (with scp) without any problems. So it seems I cannot
reproduce that problem locally and I really need your help in debugging it.

Bye,
    Oleg
