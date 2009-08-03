From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [ANNOUNCE] Reiserfs/kill-bkl tree v2
Date: Mon, 3 Aug 2009 15:56:17 +0200
Message-ID: <20090803135617.GB15020@elte.hu>
References: <20090731174642.GA6539@nowhere> <20090801081141.GA18036@basil.fritz.box> <20090801155335.GA4836@nowhere> <20090802142100.GA21160@elte.hu> <adatz0po5cn.fsf@cisco.com> <20090803132659.GC3570@think>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090803132659.GC3570@think>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <chris.mason@oracle.com>, Roland Dreier <rdreier@cisco.com>, Frederic Weisbecker <fweisbec@gmail.com>, Andi Kleen <andi@firstfloor.org>, LKML <linux-kernel@vger.kernel.or>


* Chris Mason <chris.mason@oracle.com> wrote:

> Definitely, the cost of the rare bug is much higher.  The good 
> news is that reiserfs tends to pile its races into a few spots.  
> Most of them can be found with a 12 hour run of the namesys 
> stress.sh program and a lot of memory pressure.  I'd compile with 
> preemption on and you'll have a good test on any SMP machine.
> 
> http://oss.oracle.com/~mason/stress.sh
> 
> stress.sh just copies a source directory into the test filesystem, 
> then reads it back and deletes it in a loop.  I'd run with 50 
> procs and enough memory pressure for the box to lightly swap 
> (booting w/mem= is a fine way to make memory pressure).  This way 
> you make sure to hammer on the metadata writeback paths, which is 
> where all of the difficult races come in.
> 
> Testing with an fsx-linux process running at the same time will 
> make sure all of the mmap/truncate paths are working correctly as 
> well.

Ok, that definitely looks like something feasible to run for 
Frederic too, thanks for the detailed suggestion!

	Ingo
