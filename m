From: Hans Reiser <reiser@namesys.com>
Subject: Re: Odd Block allocation behavior on Reiser3
Date: Tue, 10 Aug 2004 10:52:26 -0700
Message-ID: <41190B5A.7070503@namesys.com>
References: <20040809201939.GA55683@kevlar.burdell.org> <1092083451.10651.218.camel@watt.suse.com> <20040809220459.GA57121@kevlar.burdell.org> <41187657.7030709@namesys.com> <20040810154514.GA67591@kevlar.burdell.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20133-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040810154514.GA67591@kevlar.burdell.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sonny Rao <sonny@burdell.org>
Cc: reiserfs-list@namesys.com

Sonny Rao wrote:

>On Tue, Aug 10, 2004 at 12:16:39AM -0700, Hans Reiser wrote:
>  
>
>>Interesting.What happens without overwrite, that is, if you write more 
>>files without deleting the old ones?
>>    
>>
>
>Below I made 24 one gigabyte files in sequence
>All of them are similarly fragmented: 
>
>x44016way1:/mnt/tmp0/data # ls -lh
>total 25G
>drwx------  2 root root  816 Aug 10 10:05 .
>drwxr-xr-x  5 root root   96 Aug 10 10:00 ..
>-rwx------  1 root root 1.0G Aug 10 10:00 datafile0
>-rwx------  1 root root 1.0G Aug 10 10:00 datafile1
>-rwx------  1 root root 1.0G Aug 10 10:02 datafile10
>-rwx------  1 root root 1.0G Aug 10 10:02 datafile11
>-rwx------  1 root root 1.0G Aug 10 10:03 datafile12
>-rwx------  1 root root 1.0G Aug 10 10:03 datafile13
>-rwx------  1 root root 1.0G Aug 10 10:03 datafile14
>-rwx------  1 root root 1.0G Aug 10 10:03 datafile15
>-rwx------  1 root root 1.0G Aug 10 10:03 datafile16
>-rwx------  1 root root 1.0G Aug 10 10:04 datafile17
>-rwx------  1 root root 1.0G Aug 10 10:04 datafile18
>-rwx------  1 root root 1.0G Aug 10 10:04 datafile19
>-rwx------  1 root root 1.0G Aug 10 10:01 datafile2
>-rwx------  1 root root 1.0G Aug 10 10:04 datafile20
>-rwx------  1 root root 1.0G Aug 10 10:04 datafile21
>-rwx------  1 root root 1.0G Aug 10 10:05 datafile22
>-rwx------  1 root root 1.0G Aug 10 10:05 datafile23
>-rwx------  1 root root 1.0G Aug 10 10:01 datafile3
>-rwx------  1 root root 1.0G Aug 10 10:01 datafile4
>-rwx------  1 root root 1.0G Aug 10 10:01 datafile5
>-rwx------  1 root root 1.0G Aug 10 10:01 datafile6
>-rwx------  1 root root 1.0G Aug 10 10:02 datafile7
>-rwx------  1 root root 1.0G Aug 10 10:02 datafile8
>-rwx------  1 root root 1.0G Aug 10 10:02 datafile9
>
>x44016way1:/mnt/tmp0/data # filefrag *
>datafile0: 268 extents found
>datafile1: 268 extents found
>datafile10: 267 extents found
>datafile11: 268 extents found
>datafile12: 268 extents found
>datafile13: 268 extents found
>datafile14: 268 extents found
>datafile15: 268 extents found
>datafile16: 268 extents found
>datafile17: 268 extents found
>datafile18: 267 extents found
>datafile19: 268 extents found
>datafile2: 267 extents found
>datafile20: 268 extents found
>datafile21: 268 extents found
>datafile22: 268 extents found
>datafile23: 267 extents found
>datafile3: 268 extents found
>datafile4: 268 extents found
>datafile5: 268 extents found
>datafile6: 268 extents found
>datafile7: 267 extents found
>datafile8: 268 extents found
>datafile9: 268 extents found
>
>
>
>  
>
this could explain some reiser3 performance problems.   This is what 
happens when I spend all my time chasing funding and don't spend it 
reviewing code and benchmarks, sigh.

Thanks for spotting this.  I would be curious if this is occuring near 
the transition between unformatted nodes and their parents, or something 
else.
