From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Tue, 20 Sep 2005 17:55:43 +0400
Message-ID: <17200.5343.908617.558388@gargle.gargle.HOWL>
References: <200509180934.50789.chriswhite@gentoo.org>
	<432FC150.9020807@namesys.com>
	<20050920114253.GL10845@suse.de>
	<200509201530.01808.l.allegrucci@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S965016AbVITNzn@vger.kernel.org>
In-Reply-To: <200509201530.01808.l.allegrucci@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lorenzo Allegrucci <l.allegrucci@gmail.com>
Cc: Hans Reiser <reiser@namesys.com>, Nick Piggin <nickpiggin@yahoo.com.au>, Alan Cox <alan@lxorguk.ukuu.org.uk>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, lkml <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, Nate Diller <ndiller@namesys.com>

Lorenzo Allegrucci <l.allegrucci@gmail.com> writes:

[...]

>
> Why not just rename the kernel option "elevator" to "iosched" ?

At least update Documentation/kernel-parameters.txt to be consistent,
but I think kernel boot options are considered to be a part of the "user
space API" and, as such, cannot be changed that easily.

Nikita.
