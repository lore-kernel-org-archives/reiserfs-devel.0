From: David Masover <ninja@slaphack.com>
Subject: Re: [PATCH] reiserfs: on-demand bitmap loading (testing only)
Date: Thu, 07 Jul 2005 18:15:56 -0500
Message-ID: <42CDB7AC.8030408@slaphack.com>
References: <42CC4B7F.2070506@suse.com>	<42CC5F1E.6060505@namesys.com>	<42CD528B.9040502@suse.com>	<5a59ce530507071059731b30cc@mail.gmail.com> <20050708003756.21bd4c80.petchema@concept-micro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-25047-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050708003756.21bd4c80.petchema@concept-micro.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?UGllcnJlIEV0Y2hlbWHDr3TDqQ==?= <petchema@concept-micro.com>
Cc: reiserfs-list@namesys.com

Pierre Etchemaïté wrote:
> Le Thu, 7 Jul 2005 13:59:35 -0400, studdugie <studdugie@gmail.com> a écrit :
> 
> 
>>I agree w/ Jeff 100%. I'm not a kernel hacker, simply a user. As a
>>matter of fact, I was one of those people that Jeff aluded to when he
>>said: "There have been reports of large filesystems taking an
>>unacceptably long time to mount."
> 
> 
> That also makes reiserfs uncomfortable with automount devices, specially
> if they're bandwidth limited like external USB or firewire disks...

USB and firewire disks already take a little long to mount anyway.

But, it is definitely a performance enhancement, or at least a tweak. 
I'd like to see it happen -- it takes 10-15 seconds to mount my 200 gig 
Reiser4 partition, which is unacceptabe for a desktop machine -- at 
least, for a *linux* desktop machine.

To keep Hans happy about the "default case", can we load the bitmap in 
the background during boot/mount?  Basically, if it's loaded on demand, 
then we pretend to demand each part of it, one by one.  Would that 
considerably slow normal FS operation?  Could we defer it to when the 
disk is idle?  (*disk*, not FS)

