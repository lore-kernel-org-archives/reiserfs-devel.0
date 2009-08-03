From: Chris Mason <chris.mason@oracle.com>
Subject: Re: [ANNOUNCE] Reiserfs/kill-bkl tree v2
Date: Mon, 3 Aug 2009 09:26:59 -0400
Message-ID: <20090803132659.GC3570@think>
References: <20090731174642.GA6539@nowhere>
 <20090801081141.GA18036@basil.fritz.box>
 <20090801155335.GA4836@nowhere>
 <20090802142100.GA21160@elte.hu>
 <adatz0po5cn.fsf@cisco.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <adatz0po5cn.fsf@cisco.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <rdreier@cisco.com>
Cc: Ingo Molnar <mingo@elte.hu>, Frederic Weisbecker <fweisbec@gmail.com>, Andi Kleen <andi@firstfloor.org>, LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, Alexander Beregalov <a.beregalov@gmail.com>, Bron Gondwana <brong@fastmail.fm>, Reiserfs <reiserfs-devel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Andrea Gelmini <andrea.gelmini@gmail.com>, "Trenton D. Adams" <trenton.d.adams@gmail.com>, Thomas Meyer <thomas@m3y3r.de>, Alessio Igor Bogani <abogani@texware.it>, Marcel Hilzinger <mhilzinger@linuxnewmedia.de>, Edward Shishkin <edward.shishkin@gmail.com>

On Sun, Aug 02, 2009 at 10:04:40PM -0700, Roland Dreier wrote:
> 
>  > Well, dont waste too much time on it (beyond the due diligence 
>  > level) - Andi forgot that the right way to stress-test patches is to 
>  > get through the review process and then through the integration 
>  > trees which have far more test exposure than any single contributor 
>  > can test.
>  > 
>  > Patch submitters cannot possibly test every crazy possibility that 
>  > is out there - nor should they: it just doesnt scale. What we expect 
>  > people to do is to write clean patches, to test the bits on their 
>  > own boxes and submit them to lkml and address specific review 
>  > feedback.
> 
> I respectfully disagree in this case.  For patches that touch, say,
> something hardware dependent where the patch submitter doesn't have all
> the variations on the hardware, yes, I agree, scale the testing by
> running the code on many machines.  But for the code in question, where
> some very fundamental and complex changes are being made to filesystem
> locking, I don't think that testing really scales -- after all, if there
> is some race then it's quite likely that testers will just see some rare
> filesystem corruption, which could easily waste weeks of debugging
> before the BKL/reiserfs patches were even implicated.

Definitely, the cost of the rare bug is much higher.  The good news is
that reiserfs tends to pile its races into a few spots.  Most of them
can be found with a 12 hour run of the namesys stress.sh program and a
lot of memory pressure.  I'd compile with preemption on and you'll have
a good test on any SMP machine.

http://oss.oracle.com/~mason/stress.sh

stress.sh just copies a source directory into the test filesystem, then
reads it  back and deletes it in a loop.  I'd run with 50 procs and
enough memory  pressure for the box to lightly swap (booting w/mem= is a
fine way to make memory pressure).  This way you make sure to hammer on
the metadata writeback paths, which is where all of the difficult races
come in.

Testing with an fsx-linux process running at the same time will make
sure all of the mmap/truncate paths are working correctly as well.

-chris

