From: Jens Axboe <axboe@suse.de>
Subject: Re: random minor benchmark: Re: Copy 20 tarfiles: ext2 vs (reiser4, unixfile) vs (reiser4,cryptcompress)
Date: Fri, 27 Jan 2006 09:21:14 +0100
Message-ID: <20060127082113.GV4311@suse.de>
References: <43D7C6BE.1010804@namesys.com> <43D7CA7F.4010502@namesys.com> <20060126153343.GH4311@suse.de> <43D91225.3030605@namesys.com> <20060126185612.GM4311@suse.de> <43D933EB.6080009@namesys.com> <20060127080625.GS4311@suse.de> <43D9D681.7020002@namesys.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1030290AbWA0ITD@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <43D9D681.7020002@namesys.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Edward Shishkin <edward@namesys.com>, LKML <linux-kernel@vger.kernel.org>, Reiserfs mail-list <Reiserfs-List@namesys.com>

On Fri, Jan 27 2006, Hans Reiser wrote:
> Jens Axboe wrote:
> 
> > So the systime quoted above is basically useless, it doesn't reflect the
> >
> >real time spent in the kernel by far. I think you should note that when
> >you post these scores, otherwise you're really showing a skewed picture.
> >
> >  
> >
> He wasn't expecting me to post the benchmark, and I frankly only looked
> at the real time and forgot there was a systime in there that needed
> cutting out when I posted it. My error, not his. I must say though, the
> real time makes me quite happy, especially considering how CPUs are just
> going to keep getting faster.

Yeah and that's ok, I was just interested in seeing some more
interesting compression benchmarks so I wondered if you had done that.

-- 
Jens Axboe
