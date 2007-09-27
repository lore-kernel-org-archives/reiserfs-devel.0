From: Peter Zijlstra <a.p.zijlstra@chello.nl>
Subject: Re: [RFC][PATCH] make reiserfs stop using 'struct file' for
	internal xattr operations
Date: Fri, 28 Sep 2007 00:02:53 +0200
Message-ID: <1190930574.18147.60.camel@lappy>
References: <20070927022220.c76a7a6e.akpm@linux-foundation.org>
	 <46FC021F.8060109@free.fr>
	 <20070927124833.d2691813.akpm@linux-foundation.org>
	 <20070927202607.GA3812@infradead.org> <1190926419.7344.27.camel@localhost>
	 <20070927210423.GA6117@infradead.org> <1190928434.7344.31.camel@localhost>
	 <20070927145125.1346901f.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20070927145125.1346901f.akpm@linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Dave Hansen <haveblue@us.ibm.com>, hch@infradead.org, laurent.riffard@free.fr, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-devel@vger.kernel.org


On Thu, 2007-09-27 at 14:51 -0700, Andrew Morton wrote:

> So your stuff becomes dependent on Nick's stuff, and Nick's stuff is still
> failing on NFS, I think.

It worked today, it turned out to be a UML bug. Real hardware seemed to
work properly, but will test a bit more tomorrow.

