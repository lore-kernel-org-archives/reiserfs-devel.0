From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [ANNOUNCE] Reiserfs/kill-bkl tree v2
Date: Thu, 6 Aug 2009 00:13:26 +0200
Message-ID: <20090805221324.GD5025@nowhere>
References: <20090731174642.GA6539@nowhere> <20090801081141.GA18036@basil.fritz.box> <20090801155335.GA4836@nowhere> <20090802142100.GA21160@elte.hu> <adatz0po5cn.fsf@cisco.com> <20090803132659.GC3570@think>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:subject
         :message-id:references:mime-version:content-type:content-disposition
         :in-reply-to:user-agent;
        bh=CsGPJK8Cs035mO8Ih6Bp5xUKpUCKBU0Am2VRdS2bFCE=;
        b=Fe4HV92yVBDTBo2Tu51I1pYoMWyhCKDVpoqqVpE/KfXDlwMDbAzK9PgQXm77SmTHXm
         1L2/LeQp3hZX60ucN9bQFPPm8VSzn/njN8bqoUkPMV17ReThrqMWp3nGDnQINapoDnpv
         fxypRCkGqWqUPKXWeEI64Y1x9+7MVEEONx8CM=
Content-Disposition: inline
In-Reply-To: <20090803132659.GC3570@think>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <chris.mason@oracle.com>, Roland Dreier <rdreier@cisco.com>, Ingo Molnar <mingo@elte.hu>, Andi Kleen <andi@firstfloor.org>, LKML <linux-kernel@vger.kernel.org>, Jeff

On Mon, Aug 03, 2009 at 09:26:59AM -0400, Chris Mason wrote:
> On Sun, Aug 02, 2009 at 10:04:40PM -0700, Roland Dreier wrote:
> > 
> >  > Well, dont waste too much time on it (beyond the due diligence 
> >  > level) - Andi forgot that the right way to stress-test patches is to 
> >  > get through the review process and then through the integration 
> >  > trees which have far more test exposure than any single contributor 
> >  > can test.
> >  > 
> >  > Patch submitters cannot possibly test every crazy possibility that 
> >  > is out there - nor should they: it just doesnt scale. What we expect 
> >  > people to do is to write clean patches, to test the bits on their 
> >  > own boxes and submit them to lkml and address specific review 
> >  > feedback.
> > 
> > I respectfully disagree in this case.  For patches that touch, say,
> > something hardware dependent where the patch submitter doesn't have all
> > the variations on the hardware, yes, I agree, scale the testing by
> > running the code on many machines.  But for the code in question, where
> > some very fundamental and complex changes are being made to filesystem
> > locking, I don't think that testing really scales -- after all, if there
> > is some race then it's quite likely that testers will just see some rare
> > filesystem corruption, which could easily waste weeks of debugging
> > before the BKL/reiserfs patches were even implicated.
> 
> Definitely, the cost of the rare bug is much higher.  The good news is
> that reiserfs tends to pile its races into a few spots.  Most of them
> can be found with a 12 hour run of the namesys stress.sh program and a
> lot of memory pressure.  I'd compile with preemption on and you'll have
> a good test on any SMP machine.
> 
> http://oss.oracle.com/~mason/stress.sh
> 
> stress.sh just copies a source directory into the test filesystem, then
> reads it  back and deletes it in a loop.  I'd run with 50 procs and
> enough memory  pressure for the box to lightly swap (booting w/mem= is a
> fine way to make memory pressure).  This way you make sure to hammer on
> the metadata writeback paths, which is where all of the difficult races
> come in.
> 
> Testing with an fsx-linux process running at the same time will make
> sure all of the mmap/truncate paths are working correctly as well.
> 
> -chris

Thanks a lot for this script Chris, I'm going to test with that.

