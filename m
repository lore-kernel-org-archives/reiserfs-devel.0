From: Avi Kivity <avi@argo.co.il>
Subject: Re: Solaris ZFS on Linux [Was: Re: the " 'official' point of view"expressed
 by kernelnewbies.org regarding reiser4 inclusion]
Date: Tue, 01 Aug 2006 12:38:26 +0300
Message-ID: <44CF2112.8040202@argo.co.il>
References: <20060801092514.GB2974@merlin.emma.line.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29381-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060801092514.GB2974@merlin.emma.line.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matthias Andree <matthias.andree@gmx.de>
Cc: Theodore Tso <tytso@mit.edu>, David Lang <dlang@digitalinsight.com>, David Masover <ninja@slaphack.com>, tdwebste2@yahoo.com, Nate Diller <nate.diller@gmail.com>, Adrian Ulrich <reiser4@blinkenlights.ch>, "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Matthias Andree wrote:
>
> On Tue, 01 Aug 2006, Avi Kivity wrote:
>
> > There's no reason to repack *all* of the data.  Many workloads write 
> and
> > delete whole files, so file data should be contiguous.  The repacker
> > would only need to move metadata and small files.
>
> Move small files? What for?
>

WAFL-style filesystems like contiguous space,  so if small files are 
scattered in otherwise free space, the repacker should free them.

> Even if it is "only" moving metadata, it is not different from what ext3
> or xfs are doing today (rewriting metadata from the intent log or block
> journal to the final location).
>

There is no need to repack all metadata; only that which helps in 
creating free space.

For example: if you untar a source tree you'd get mixed metadata and 
small file data packed together, but there's no need to repack that data.


-- 
error compiling committee.c: too many arguments to function

