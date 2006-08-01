From: Avi Kivity <avi@argo.co.il>
Subject: Re: Solaris ZFS on Linux [Was: Re: the " 'official' point of view"
 expressed by kernelnewbies.org regarding reiser4 inclusion]
Date: Tue, 01 Aug 2006 12:57:03 +0300
Message-ID: <44CF256F.1020605@argo.co.il>
References: <20060801090947.GA2974@merlin.emma.line.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29383-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060801090947.GA2974@merlin.emma.line.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matthias Andree <matthias.andree@gmx.de>
Cc: Adrian Ulrich <reiser4@blinkenlights.ch>, nate.diller@gmail.com, dlang@digitalinsight.com, vonbrand@inf.utfsm.cl, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Matthias Andree wrote:
>
> No, it is valid to run the test on commodity hardware, but if you (or
> the benchmark rather) is claiming "transactions", I tend to think
> "ACID", and I highly doubt any 200 GB SATA drive manages 3000
> synchronous writes per second without causing either serious
> fragmentation or background block moving.
>
You are assuming 1 transaction = 1 sync write.  That's not true.  
Databases and log filesystems can get much more out of a disk write.


-- 
error compiling committee.c: too many arguments to function

