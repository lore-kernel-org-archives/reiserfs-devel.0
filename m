From: Metztli Information Technology <jose.r.r@metztli.com>
Subject: Re: PROBLEM: IO lockup on reiserfs FS.
Date: Wed,  5 Aug 2020 19:05:40 -0700 (PDT)
Message-ID: <20200806020540.D8E866723A77@huitzilopochtli.metztli-it.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1596679862; h=From: Date: Message-Id: To: Subject: Sender;
 bh=rwFqRrukwelWii2zwN3pKKuwvo/FNdvXZl6RI6GFFhc=; b=bEU9WzaEiUVNcoRAfbpl6yOzCPULbQZlApofJwuEtxBxzpDdTrbmHB3pOAXO3YQR1ms6bVZb
 M+Bb23zXoqnFZPRcEZoAqXDDaX7Ta3h6nldJto04BNdH+7fduJcBE0N10f4Dp9u/CyxooHho
 uTmib0EeoOpSDTLPIr+zk/qweTk=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Hgntkwis@vfemail.net, torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, edward.shishkin@gmail.com

 
On Wed, Aug 5, 2020 at 5:01 PM <Hgntkwis@vfemail.net> wrote:

> On Wed, 5 Aug 2020 12:51:41 -0700
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
> > On Wed, Aug 5, 2020 at 9:53 AM <Hgntkwis@vfemail.net> wrote:
> > >
> > > It's been over 1 week since I sent this into the reiserfs-devel
> > > mailing list. I'm escalating this as the kernel docs recommend.
> > > I'm still willing to help debug and test a fix for this problem.  
> > 
> > The thing is, you're using an ancient 4.14 kernel, 
> 
> Sorry, I didn't realize kernel development went that fast.
> I did try to go to the 5.X series, but the AMDGPU drivers don't work on
> my SI card anymore (I need to bisect which takes time and many re-boots
> to find the problematic commit).
> I'll try the Radeon-SI driver and see if I can reproduce this reliably.
> 
> > and a filesystem
> > that isn't really maintained any more. You'll find very few people
> > interested in trying to debug that combination.
> > 
> > You *might* have more luck with a more modern kernel, but even then
> > ... reiserfs?
> > 
> >               Linus
> > 
> 
> Why does no one (I've met others who share a similar sentiment), like
> reiserfs?
Could be because 'others' are all 'virtuous' individuals, employed by 'virtuous' corporations, headquartered at 'virtuous' western countries, whose 'virtuous' governments are able to finance the finest hasbara...er, propaganda, that a corporatocracy...er, 'democracy', can buy.

> I'm not looking for fight, I'm incredulous. It's a great FS
> that survives oops-es, power failures, and random crashes very very well.
> It's the only FLOSS FS with tail packing.
On a more sober note, Reiser4, Software Framework Release Number (SFRN) 4.0.2, is stable, and supercedes the features you appreciate in reiserfs, like Edward stated in his subsequent reply.
> 
> Thanks,
> David


Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Buster w/ Linux 5.5.19 AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-------------------------------------------------------------------------------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/
