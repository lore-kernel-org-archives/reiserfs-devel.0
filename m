From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsprogs 3.6.5-pre2 release.
Date: Wed, 26 Feb 2003 10:29:34 +0300
Message-ID: <20030226102934.A2659@namesys.com>
References: <200302251650.22469.vitaly@namesys.com> <200302251712.45985.vitaly@namesys.com> <20030226015448.1efac468.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12928-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030226015448.1efac468.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philippe Gramoull? <philippe.gramoulle@mmania.com>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Feb 26, 2003 at 01:54:48AM +0100, Philippe Gramoull? wrote:
> # time reiserfsck -a /dev/sdb1
> Reiserfs super block in block 16 on 0x811 of format 3.6 with standard journal
> Blocks (total/free): 143109020/59148009 by 4096 bytes
> Filesystem is cleanly umounted
> Replaying journal..
> 0 transactions replayed
> Checking internal tree..finished                  
> real    0m47.890s
> user    0m6.668s
> sys     0m0.732s

Thanks for trying.
48 seconds is much longer than we expected such test should take.
Was the system loaded at the time of test?

Bye,
    Oleg
