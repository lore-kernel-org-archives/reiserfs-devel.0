From: Oleg Drokin <green@namesys.com>
Subject: Re: kernel loop with lseek + LFS on reiser partition.
Date: Mon, 22 Apr 2002 13:35:46 +0400
Message-ID: <20020422133546.A9019@namesys.com>
References: <OF3FAEC010.18270BFB-ONC1256BA3.002DB214@ev-i.at>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10112-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <OF3FAEC010.18270BFB-ONC1256BA3.002DB214@ev-i.at>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wolfgang.glas@ev-i.at
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Apr 22, 2002 at 10:28:05AM +0200, wolfgang.glas@ev-i.at wrote:

> Running the program under SuSE7.3 with the folowing two kernels lets the 
> process starve in an infineite loop inside the kernel (99% kernel CPU):

Ok, now having done more research, I must say it is not infinite loop
in fact:
green@angband:~/work/bugs> gcc -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -Wall -o t testprg.c
testprg.c: In function `main':
testprg.c:47: warning: use of `l' length character with `f' type character
testprg.c:54: warning: control reaches end of non-void function
green@angband:~/work/bugs> time ./t

real    6m20.958s
user    0m0.000s
sys     6m22.430s

I think this is because of expanding-truncate patch.
So, the real bug is this process cannot get interrupted until finished
which opens a window for resource-eating.

>  No go with kill, kill -9...... Only reboot helps.

How long have you tried to wait?

Bye,
    Oleg
