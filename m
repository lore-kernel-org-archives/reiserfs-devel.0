From: Matthias Andree <matthias.andree@gmx.de>
Subject: Re: Solaris ZFS on Linux [Was: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion]
Date: Tue, 1 Aug 2006 03:02:15 +0200
Message-ID: <20060801010215.GA24946@merlin.emma.line.org>
References: <20060731175958.1626513b.reiser4@blinkenlights.ch> <200607311918.k6VJIqTN011066@laptop13.inf.utfsm.cl> <20060731225734.ecf5eb4d.reiser4@blinkenlights.ch> <44CE7C31.5090402@gmx.de> <5c49b0ed0607311621i54f1c46fh9137f8955c9ea4be@mail.gmail.com> <Pine.LNX.4.63.0607311621360.14674@qynat.qvtvafvgr.pbz> <5c49b0ed0607311650j4b86d0c3h853578f58db16140@mail.gmail.com> <Pine.LNX.4.63.0607311651410.14674@qynat.qvtvafvgr.pbz> <5c49b0ed0607311705t1eb8fc6bs9a68a43059bfa91a@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29356-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <5c49b0ed0607311705t1eb8fc6bs9a68a43059bfa91a@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nate Diller <nate.diller@gmail.com>
Cc: David Lang <dlang@digitalinsight.com>, Matthias Andree <matthias.andree@gmx.de>, Adrian Ulrich <reiser4@blinkenlights.ch>, "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Mon, 31 Jul 2006, Nate Diller wrote:

> this is only a limitation for filesystems which do in-place data and
> metadata updates.  this is why i mentioned the similarities to log
> file systems (see rosenblum and ousterhout, 1991).  they observed an
> order-of-magnitude increase in performance for such workloads on their
> system.

It's well known that transactions that would thrash on UFS or ext2fs may
have quieter access patterns with shorter strokes can benefit from
logging, data journaling, whatever else turns seeks into serial writes.
And then, the other question with wandering logs (to avoid double
writes) and such, you start wondering how much fragmentation you get as
the price to pay for avoiding seeks and double writes at the same time.
TANSTAAFL, or how long the system can sustain such access patterns,
particularly if it gets under memory pressure and must move. Even with
lazy allocation and other optimizations, I question the validity of
3000/s or faster transaction frequencies. Even the 500 on ext3 are
suspect, particularly with 7200/min (s)ATA crap. This sounds pretty much
like the drive doing its best to shuffle blocks around in its 8 MB cache
and lazily writing back.

sdparm --clear=WCE /dev/sda   # please.

-- 
Matthias Andree
