From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Reiser4/2.6.11 dbench hang
Date: Wed, 30 Mar 2005 17:12:30 +0400
Message-ID: <1112188350.4761.671.camel@tribesman.namesys.com>
References: <4249D57F.8020809@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23738-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4249D57F.8020809@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: reiserfs-list@namesys.com

Hello

On Wed, 2005-03-30 at 02:23, Christian Mayrhuber wrote:
> Hi,
> 
> If I'm running plain 2.6.11(.0) patched with 
> reiser4-for-2.6.11-broken-out.2.gz I can hang reiser4 when running

When you say "hang reiser4" do you mean that system freezes completely
(does not respord to key pressing, etc)?

Is it SMP box? How much RAM does the box have? 

> ftp://ftp.samba.org/pub/tridge/dbench/dbench-3.02.tar.gz
> for about an hour with the following script.
> 
> ----------------------------------------------------------------------
> #!/bin/sh
> 
> RUNTIME=200
> 
> run()
> {
>      t=$1
>      n=$2
>      sync
>      date
>      if [ $t = xattr ]; then
>          ./dbench -c client.txt -x -D /tmp -t$RUNTIME $n
>      else
>          ./dbench -c client.txt -D /tmp -t$RUNTIME $n
>      fi
> }
> 
> 
> while :; do
>    for n in 90 100 110 120 130 140 150 160 170 180 190 200; do
>       run noxattr $n
>    done
> done
> ----------------------------------------------------------------------
> 
> After a hard reset reiser4progs 1.0.4 reported semantic tree 
> corruptions. (No, I didn't write down the fsck.reiser4 output.)
> 
> I tried it out because I found the following on linux-kernel:
> http://marc.theaimsgroup.com/?l=linux-kernel&m=110099542612492&w=2
> 
> This behaviour is reproducible. I tried ext3,reiserfs,xfs and jfs
> on the same disk with the same data, all ran dbench fine till
> user abort without locking the machine.
> 
> # cat /proc/version
> Linux version 2.6.11-k7-reiser4 (root@byblos) (gcc-Version 3.3.5 (Debian 
> 1:3.3.5-5)) #1 Mon Mar 28 20:23:57 CEST 2005
> 
> 
> Quote from namesys.com/download.html
>  >Reiser4 has just been released. Namesys has the most stringent QA
>  >process of any Linux maintainer, a firm belief that no user should hit
>  >a bug that developer testing could find first if the effort is made, a
>  >by now grand archive of filesystem tests, and no one on our mailing
>  >list can make it crash any more, and all of this is why it took us so
>  >long to release it, but until a program has seen a few million real
>  >users you should not use it for a mission critical server.
> 
> I guess dbench-3.x stress testing is missing from your grand archive ;-)

