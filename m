From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiserfsck --rebuild-tree on a big filesystem
Date: Mon, 23 Dec 2002 10:54:58 +0300
Message-ID: <3E06C152.8020909@namesys.com>
References: <20021125143634.GC9006@mail.cekit.cz> <20021125143634.GC9006@mail.cekit.cz> <20021125174846.A31778@namesys.com> <atsteb$44s$1@genki.hungrycats.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12193-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <atsteb$44s$1@genki.hungrycats.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Zygo Blaxell <eazgwmir@umail.furryterror.org>
Cc: reiserfs-list@namesys.com, Oleg Drokin <green@namesys.com>

Zygo Blaxell wrote:

>This thread is rather old, but I have basically the same problem...
>
>In article <20021125174846.A31778@namesys.com>,
>Oleg Drokin  <green@namesys.com> wrote:
>  
>
>>On Mon, Nov 25, 2002 at 03:36:34PM +0100, Mira Temp?r wrote:
>>    
>>
>>>my setup:
>>>linux 2.4.18 SMP, HW RAID5, nearly full 240GB reiserfs of mostly small files,
>>>reiserprogs 3.6.4.
>>>With advice to run --rebuild-tree.
>>>      
>>>
>
>Mine:
>
>Linux 2.4.18 UP (SMP kernel), SW RAID0 and linear, nearly full 160GB
>reiserfs of mostly small files, reiserfsprogs 1:3.6.3-1 (Debian).  I had
>two machines go through a power failure while doing lots of concurrent
>hard links and deletes.  The linear system survived apparently intact,
>while the RAID0 system had the usual "stat Permission denied"
>problem.
>
>This has happened a number of times before on a variety of systems
>(it seems to be reiserfs's most common failure mode).  The events are
>very similar each time.  AFAICT you just have to set up a reiserfs on
>some kind of RAID system and let it run through a few power failures to
>reproduce the problem.
>
>  
>
Oleg, please reproduce this.  It is not acceptable....

Thanks for the report Zygo.

Hans

