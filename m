From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsck non-4k-block-size issue on ia64
Date: Mon, 22 Dec 2003 16:20:21 +0300
Message-ID: <200312221617.26776.vitaly@namesys.com>
References: <3FE5A7E6.4060201@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16378-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FE5A7E6.4060201@libero.it>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Domenico Andreoli <cavok@libero.it>, reiserfs-list@namesys.com

Hello, 

On Sunday 21 December 2003 17:02, Domenico Andreoli wrote:
> hi,
>
> here at debian we have a bug report + patch for reiserfsck, full bug
> report is available at http://bugs.debian.org/212517 .
>
> may i have your opinion on the given patch?

there is one problem in the linux -- if you have a partition 
of N * 4k + 2k size and make is of the 4k size, then after the 
mounting you are unable to read the latest 2k. If you then try 
to make the fs of 2k block size you are still unable to read 
the latest block (2k) untill mounting.

The patch you point to is a workaround, I wrote it some time 
ago to have such a problem to be fixed in reiserfsprogs not 
for 4k and smaller blocksizes only but up to 64k block sizes. 
It is not ia64 related. And the code is included into 
reiserfsprogs-3.6.12-pre1.

-- 
Thanks,
Vitaly Fertman
