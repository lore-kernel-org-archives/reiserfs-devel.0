From: Kuba Ober <kuba@mareimbrium.org>
Subject: Re: different block sizes and badblocks
Date: Wed, 3 Jul 2002 11:53:43 -0400
Message-ID: <200207031153.43746.kuba@mareimbrium.org>
References: <5.0.2.1.2.20020620135847.01c3bdb0@pop.tvnet.hu> <20020620202149.B1336@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-10910-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020620202149.B1336@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> > the other question is about badblocks. we have badblock support in
> > reiserfsprogs 3.x.1c-pre5, but its disabled by default. Oleg, could you
> > give me some infos about it, how can I reenable it, or how does it work
> > actually? it would be really nice :)
>
> Right now badblocks support is disabled on purpose.
> It conflicts with savelinks and we have not decided how to solve that yet.
> But we will announce badblocks support once we think it is ready.

With many modern IDE drives, the bad blocks list can potentially vary between 
disk power-ups, and usually it dynamically changes while you access the disk. 
Most modern drives should be considered dead when you get bad sectors. For 
your own good, throw them away ASAP, or get to know smartctl if your drive 
supports S.M.A.R.T.

Again, for your own good, either low-level reformat the drive using a decent 
tool (smartctl uses drive's own SMART programs, or buy SpinRite 
http://www.grc.com).

Cheers, Kuba
