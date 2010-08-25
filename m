From: David Rientjes <rientjes@google.com>
Subject: Re: [patch 1/5] mm: add nofail variants of kmalloc kcalloc and
 kzalloc
Date: Wed, 25 Aug 2010 13:59:55 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1008251359290.16484__5588.18374197489$1282770034$gmane$org@chino.kir.corp.google.com>
References: <alpine.DEB.2.00.1008240340010.18908@chino.kir.corp.google.com> <1282656558.2605.2742.camel@laptop> <4C73CA24.3060707@fusionio.com> <alpine.DEB.2.00.1008241309170.21242@chino.kir.corp.google.com> <20100825112433.GB4453@thunk.org>
 <1282736132.2605.3563.camel@laptop> <20100825115709.GD4453@thunk.org> <1282740516.2605.3644.camel@laptop> <20100825132417.GQ31488@dastard> <1282743342.2605.3707.camel@laptop> <20100825205342.GG4453@thunk.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=google.com; s=beta;
	t=1282770001; bh=vDjut2TNujr3n/T2uPItgv92jn8=;
	h=Date:From:To:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type;
	b=LNeDJPh7V1lTU7YqE8y31g84WJ8TB4miDl6oQSJMQVt+w0s53YiJRg/XXKxc67opU
	 sSoxhrfqqepl+YK1iUCLA==
In-Reply-To: <20100825205342.GG4453@thunk.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ted Ts'o <tytso@mit.edu>, Peter Zijlstra <peterz@infradead.org>, Dave Chinner <david@fromorbit.com>, Jens Axboe <jaxboe@fusionio.com>, Andrew Morton <akpm@linux-foundation.org>, Ne

On Wed, 25 Aug 2010, Ted Ts'o wrote:

> A pool of free pages which is reserved for routines that are doing
> page cleaning would probably also be a good idea.  Maybe that's just
> retrying with GFP_ATOMIC if a normal allocation fails, or maybe we
> need our own special pool, or maybe we need to dynamically resize the
> GFP_ATOMIC pool based on how many subsystems might need to use it....
> 

PF_MEMALLOC is used for those tasks, not GFP_ATOMIC.
