From: Avi Kivity <avi@argo.co.il>
Subject: Re: Solaris ZFS on Linux [Was: Re: the " 'official' point of view"expressed
 by kernelnewbies.org regarding reiser4 inclusion]
Date: Tue, 01 Aug 2006 10:24:49 +0300
Message-ID: <44CF01C1.9070802@argo.co.il>
References: <20060801064837.GB1987@thunk.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29373-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060801064837.GB1987@thunk.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Theodore Tso <tytso@mit.edu>
Cc: David Lang <dlang@digitalinsight.com>, David Masover <ninja@slaphack.com>, tdwebste2@yahoo.com, Nate Diller <nate.diller@gmail.com>, Adrian Ulrich <reiser4@blinkenlights.ch>, "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Theodore Tso wrote:
>
> Ah, but as soon as the repacker thread runs continuously, then you
> lose all or most of the claimed advantage of "wandering logs".
> Specifically, the claim of the "wandering log" is that you don't have
> to write your data twice --- once to the log, and once to the final
> location on disk (whereas with ext3 you end up having to do double
> writes).  But if the repacker is running continuously, you end up
> doing double writes anyway, as the repacker moves things from a
> location that is convenient for the log, to a location which is
> efficient for reading.  Worse yet, if the repacker is moving disk
> blocks or objects which are no longer in cache, it may end up having
> to read objects in before writing them to a final location on disk.
> So instead of a write-write overhead, you end up with a
> write-read-write overhead.
>

There's no reason to repack *all* of the data.  Many workloads write and 
delete whole files, so file data should be contiguous.  The repacker 
would only need to move metadata and small files.

-- 
Do not meddle in the internals of kernels, for they are subtle and quick to panic.

