From: Jens Axboe <axboe@suse.de>
Subject: Re: [benchmark] seek optimization
Date: Thu, 15 Jul 2004 07:50:07 +0200
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040715055007.GD9383@suse.de>
References: <OF5CD40530.F971AA8A-ON85256ED1.006E4E3B-88256ED1.006EE609@us.ibm.com> <Pine.LNX.4.21.0407142307010.7492-100000@mlf.linux.rulez.org>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0407142307010.7492-100000@mlf.linux.rulez.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Szakacsits Szabolcs <szaka@sienet.hu>
Cc: Bryan Henderson <hbryan@us.ibm.com>, Guy <bugzilla@watkins-home.com>, linux-fsdevel@vger.kernel.org, 'Marcel Hilzinger' <mhilzinger@linuxnewmedia.de>, 'Per Olofsson' <pelle@dsv.su.se>, reiserfs-list@namesys.com

On Wed, Jul 14 2004, Szakacsits Szabolcs wrote:
> 
> On Wed, 14 Jul 2004, Bryan Henderson wrote:
> 
> > A simpler experiment where you copy a file from a filesystem into
> > oblivion would eliminate any seeks or other delays on the write side
> > and any interaction between the two and leave just the seeks on the
> > read side to measure.
> 
> The intention was to point out seek elimination on the writer side ;-)
>  
> > And that information seems like it would be more useful.  Many
> > applications simply read and use data; they don't copy it into another
> > file
> 
> Sure, and many other different kind of tests would be more useful, too.  
> But this experiment wasn't about those. Instead to point out, by a
> relatively common tool in a common environment, that
> 
>    1) The seek elimination of Reiser4 is true and quite well measurable.
>       Also its seek optimization is much better than any other major
>       filesystem's optimization on Linux.
> 
>    2) Apparently the 2.6 kernel's IO scheduler has a performance problem.

Which one did you test?

-- 
Jens Axboe

