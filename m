From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Mongo error while building HTML results
Date: Tue, 17 Aug 2004 09:30:54 +0400
Message-ID: <20040817053053.GL4703@backtop.namesys.com>
References: <20040806152923.4a4eedc7@philou.gramoulle.local> <20040808063358.GE9811@backtop.namesys.com> <20040808151456.7765b337@philou.gramoulle.local> <20040814143718.GH13834@backtop.namesys.com> <20040815022406.01ca4cf7@philou.gramoulle.local>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20348-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040815022406.01ca4cf7@philou.gramoulle.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philippe Gramoull? <philippe.gramoulle@mmania.com>
Cc: reiserfs-list@namesys.com

On Sun, Aug 15, 2004 at 02:24:06AM +0200, Philippe Gramoull? wrote:
> 
> Hello Alex,
> 
> On Sat, 14 Aug 2004 18:37:18 +0400
> Alex Zarochentsev <zam@namesys.com> wrote:
> 
>   | can you try new mongo version? 
>   | http://namesys.com/benchmarks/mongo-2004.08.14.tar.gz
> 
> Sure but i now get the following error:
> 
> ~/mongo-2004.08.14# date; ./mongo.pl BYTES=225000000 DEV=/dev/sdd1 DIR=/mnt/sdd1 FILE_SIZE=4000 INFO_R4=new FSTY
> PE=reiser4 GAMMA=0.2 NPROC=3 REP_COUNTER=3 SYNC=off WRITE_BUFFER=4096 PHASE_APPEND=off PHASE_READ=find PHASE_COPY=cp PH
> ASE_OVERWRITE=off DD_MBCOUNT=1807 PHASE_DELETE=rm PHASE_MODIFY=off LOG=reiser4.log RUN ; date
> Sun Aug 15 02:03:37 CEST 2004
> INFO date      : Sun Aug 15 02:03:37 2004
> INFO kernel    : 2.6.8-rc2-mm2 #1 SMP Fri Aug 6 04:06:13 CEST 2004
> INFO machine   : bigass.localdomain.local
> INFO mem total : 904512
> INFO reiser4   : new
> INFO .config   : PLEASE take care to make .config file available when you publish benchmark results. At namesys, .confi
> g should be stored somewhere in the internal benchmark directory (intbenchmarks/mongo/), and link to it is added to the
>  resulting html document.
> TEST INFO_R4=new
> TEST NPROC=3
> TEST DIR=/mnt/sdd1
> TEST SYNC=off
> TEST PHASE_COPY=cp
> TEST PHASE_OVERWRITE=off
> TEST GAMMA=0.2
> TEST REP_COUNTER=3
> TEST BYTES=225000000
> TEST FILE_SIZE=4000
> TEST PHASE_APPEND=off
> TEST PHASE_READ=find
> TEST DEV=/dev/sdd1
> TEST DD_MBCOUNT=1807
> TEST WRITE_BUFFER=4096
> TEST PHASE_DELETE=rm
> TEST FSTYPE=reiser4
> TEST PHASE_MODIFY=off
> SER
> PHASE CREATE
> STAT REAL_TIME 55.4
> STAT CPU_TIME 49.92
> STAT CPU_UTIL 58.84
> STAT DF 1001408
> PHASE COPY
> ERROR 
> EXITED WITH FAIL
> 
> Kernel is the same than last time (not a single change on this machine).
> 
> No problem with mongo-2004.07.26.tar.gz though.
Actually, 2004.07.24.tar.gz has the same bug, update-flist.pl was missing.
the "copy" phase did not work if phase_copy=cp.

Please try 
http://thebsh.namesys.com/benchmarks/dist/mongo-2004.08.17.tar.gz

> 
> Thanks,
> 
> Philippe

-- 
Alex.
