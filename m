From: Andi Kleen <ak@muc.de>
Subject: Re: viewprinting processes and process oriented permissions got funded by DARPA
Date: 14 Apr 2004 04:22:48 +0200
Message-ID: <20040414022248.GA92870@colin2.muc.de>
References: <407C304F.4080804@namesys.com> <m31xmrefug.fsf@averell.firstfloor.org> <407C930D.5010407@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17916-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Date: Wed, 14 Apr 2004 04:22:48 +0200
Content-Disposition: inline
In-Reply-To: <407C930D.5010407@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Andi Kleen <ak@muc.de>, reiserfs-list@namesys.com

On Tue, Apr 13, 2004 at 06:25:33PM -0700, Hans Reiser wrote:
> Andi Kleen wrote:
> 
> >Amazing. You managed to write all this without ever mentioning
> >that linux 2.6 already has per process name spaces (=views) in
> >form of CLONE_NS.
> >
> >-Andi
> Can you specify exclude *.c in them?  I think that your =views is a 
> simplistic statement.

You can add any files/directories you want (mount --bind). Excluding
is not directly supported. 
 
Doing it by directories is more natural though as it works with mount 
points. Basically it mirrors the plan9 implementation and in
plan9 it is extensively used. I don't know of any uses in Linux
so far, but the infrastructure is there in the kernel.

I don't doubt that your proposal is more powerful (and more complicated
and vapour right now), but I think you should mention prior work
in linux and plan9 before discussing clearcase at least.

-Andi

