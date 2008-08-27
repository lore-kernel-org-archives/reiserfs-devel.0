From: Volker Armin Hemmann <volker.armin.hemmann@tu-clausthal.de>
Subject: Re: Hi Reiserfs-dev
Date: Wed, 27 Aug 2008 06:48:14 +0200
Message-ID: <200808270648.14980.volker.armin.hemmann@tu-clausthal.de>
References: <325143.47271.qm@web53207.mail.re2.yahoo.com> <48B4A3C9.2090508@acm.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <48B4A3C9.2090508@acm.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

On Mittwoch, 27. August 2008, Zan Lynx wrote:
> Steven wrote:
> > Been using Reiser 3 for years now, messing round with m-multiple
> > operating systems. Imho, it's easily the best general purpose linux
> > filesystem.  Does anyone here say otherwise ?
> >
> > I went through the hassle of installing reiser 4 on 2.6.24 about a
> > year ago, but it seemed to have latency issues, esp. at start-up
> > (fedora 4, 1.13 PIII dell laptop with 256ram) and reverted back to
> > reiser 3. Ideas?
> >
> > Thanks, Steven.
>
> I've been running Reiser4 on my laptop as / for a long time now. I have
> two bits of advice.
>
> Make sure it mounts at boot with the noatime option. Something like
> "rootflags=noatime" on your LILO or GRUB kernel options line.
>
> Have your init scripts set the queue depth on your block IO scheduler to
> 1024. Something like "echo 1024 > /sys/block/sda/queue/nr_requests".
> With just 256 MB you might want to try smaller values. I'm not very
> clear on how much RAM each queue slot can use.
>
> I found that Reiser4 will appear to hang if it cannot flush an entire
> transaction atom to the IO queue in one go. Make sure it's big enough.
>
> The other thing that seems to make it a little slow is that it uses
> barriers.  This is a Linux feature that serious filesystems use to
> guarantee data integrity.  ext3 uses barriers for its journal and XFS
> uses barriers too.  I believe there were patches for reiser3 to use
> barriers too but I don't know if those are in all Linux or just SUSE.

reiserfs uses barriers for ages. Xfs and reiserfs use barriers by default.
ext3 does not use barriers by default. Because of the performance hit.

Every 'benchmark' that does not enable or disable barriers is skewed in ext3's 
advantage. With barriers turned on for all filesystems ext3 is very slow.



