From: Hans Reiser <reiser@namesys.com>
Subject: Re: Opportunistic early flushing of data
Date: Mon, 12 Aug 2002 18:32:00 +0400
Message-ID: <3D57C6E0.4030403@namesys.com>
References: <3D57BDA3.2010903@namesys.com> <3D57C45F.46D7011C@baldauf.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11171-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Xuan Baldauf <xuan--reiserfs@baldauf.org>
Cc: reiserfs-list@namesys.com, Daniel Phillips <phillips@arcor.de>

Xuan Baldauf wrote:

>Hans Reiser wrote:
>
> =20
>
>>I just thought that discussion of this might interest the list.
>>
>>It is interesting to consider whether one should flush dirty nodes to
>>disk with only a small delay after they are modified, or keep them in
>>cache for a longer time.
>>
>>A small delay has an advantage for the typical small benchmark, and for
>>medium length tasks.  If there is poor utilization of the write cache,
>>then the sooner one gets started on flushing something to disk, the
>> more megabytes the disk can write before the benchmark ends.
>>
>>On the other hand, for a loaded server with a reasonably stable load
>>with real users not benchmarks, the longer data stays in cache the more
>>likely the write won't be needed at all.  One can argue that real users
>>don't create stable loads.....
>>
>>Your thoughts are welcome.
>>
>>--
>>Hans
>>   =20
>>
>
>What about opportunistic early flushing? If the disk is not accessed, we
>may flush without using someone elses resources. This cannot be implemented
>for all cases (because during the write, someone else may want to flush
>immediately), but there may be heuristics (like "we flush opportunistically
>if the disk has not been used for the last 100ms") which approximate to the
>optimal case. The more the disk is busy, the more flush should be delayed.
>
>This way, we use the advantage of early flush (early commit for database
>servers, etc.) with the advantages of late flush (less IO traffic). If
>there is low IO traffic, we would not need to lower it, we can do early
>flush. If there is high IO traffic, early flush would even rise it but late
>flush would lower it.
>
>It is important that the heuristics really depend on usage patterns of the
>disk, not only of the filesystem. There might be a system with a swap
>partition and a file system partition with heavy memory load and some disk
>load. The resulting heavy swap would be slowed down if the filesystem did
>early flush, and the filesystem would think that it is okay to do early
>flush due to the less IO throughput (which in turn is result of slowed
>swap...).
>
>Xu=E2n.
>
>
>
>
>
> =20
>
Xuan, I think you have the right approach here.  I think Daniel Phillips=20
maybe outlined something somewhat similar some time ago on lkml, let's=20
ask him.:)

--=20
Hans



