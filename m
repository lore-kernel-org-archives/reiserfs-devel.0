From: Jeffrey Mahoney <jeffm@suse.com>
Subject: Re: [PATCH] reiserfs: on-demand bitmap loading (testing only)
Date: Fri, 08 Jul 2005 00:52:52 -0400
Message-ID: <42CE06A4.8070101@suse.com>
References: <42CC4B7F.2070506@suse.com>	<42CC5F1E.6060505@namesys.com>	<42CD528B.9040502@suse.com>	<5a59ce530507071059731b30cc@mail.gmail.com> <20050708003756.21bd4c80.petchema@concept-micro.com> <42CDB7AC.8030408@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-25050-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42CDB7AC.8030408@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David Masover <ninja@slaphack.com>
Cc: =?UTF-8?B?UGllcnJlIEV0Y2hlbWHDr3TDqQ==?= <petchema@concept-micro.com>, reiserfs-list@namesys.com

David Masover wrote:
> Pierre Etchemaïté wrote:
> 
>> Le Thu, 7 Jul 2005 13:59:35 -0400, studdugie <studdugie@gmail.com> a
>> écrit :
>>
>>
>>> I agree w/ Jeff 100%. I'm not a kernel hacker, simply a user. As a
>>> matter of fact, I was one of those people that Jeff aluded to when he
>>> said: "There have been reports of large filesystems taking an
>>> unacceptably long time to mount."
>>
>>
>>
>> That also makes reiserfs uncomfortable with automount devices, specially
>> if they're bandwidth limited like external USB or firewire disks...
> 
> 
> USB and firewire disks already take a little long to mount anyway.
> 
> But, it is definitely a performance enhancement, or at least a tweak.
> I'd like to see it happen -- it takes 10-15 seconds to mount my 200 gig
> Reiser4 partition, which is unacceptabe for a desktop machine -- at
> least, for a *linux* desktop machine.
> 
> To keep Hans happy about the "default case", can we load the bitmap in
> the background during boot/mount?  Basically, if it's loaded on demand,
> then we pretend to demand each part of it, one by one.  Would that
> considerably slow normal FS operation?  Could we defer it to when the
> disk is idle?  (*disk*, not FS)

Hi David -

The main issue I have with this is that I don't think bitmaps should be
treated specially. They are metadata, pure and simple. We don't treat
the s-tree specially with respect to caching and it is used regardless
of whether the operations performed on the filesystem are for reads or
writes.

The root block/node sees far more activity than any bitmap and it is not
treated any differently than any other bit of metadata. It's simply
requested when it is needed. If the vm has determined that the root
block is frequently used, it stays in memory. Why should the bitmaps be
any different?

It's possible to read the bitmaps in a "delayed" fashion, but the
problem of completely wasted resources is still not addressed. I feel
the correct solution is to let the buffer cache do its job and not
assume that any particular filesystem takes priority over other resources.

-Jeff

-- 
Jeff Mahoney
SuSE Labs
jeffm@suse.com
