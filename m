From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: reiserfsprogs: lib/misc.c: why die() aborts?
Date: Mon, 22 Mar 2004 15:49:47 +0300
Message-ID: <1079959787.1977.24.camel@tribesman.namesys.com>
References: <20040320161819.GA6734@raptus.homelinux.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17374-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040320161819.GA6734@raptus.homelinux.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Domenico Andreoli <cavok@tiscali.it>
Cc: reiserfs-list@namesys.com

Hi

On Sat, 2004-03-20 at 19:18, Domenico Andreoli wrote:
> hi all,
> 
> in trying to figure out what is the unpack program in reiserfsprogs
> and if it supposed to be distributed in the debian package,

No, it should not be distributed

>  i came to
> the function die() in lib/misc.c.
> 
> i'm seeing it regularly aborts the execution instead of using the
> usual exit(EXIT_FAILURE). shouldn't it be more polite or it is not for
> public use?
> 
> what is unpack supposed to do?
> 
It is used for reiserfsprogs debugging

> cheers
> domenico
> 
> -----[ Domenico Andreoli, aka cavok
>  --[ http://filibusta.crema.unimi.it/~cavok/gpgkey.asc
>    ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
> 

