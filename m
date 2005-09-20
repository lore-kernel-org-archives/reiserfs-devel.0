From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Tue, 20 Sep 2005 22:27:00 +0400
Message-ID: <17200.21620.684685.966054@gargle.gargle.HOWL>
References: <200509201542.j8KFgh2q011730@laptop11.inf.utfsm.cl>
	<43304AF2.8080404@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26146-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43304AF2.8080404@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Nick Piggin <nickpiggin@yahoo.com.au>, Alan Cox <alan@lxorguk.ukuu.org.uk>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, Nate Diller <ndiller@namesys.com>

Hans Reiser writes:
 > Horst von Brand wrote:
 > 
 > >
 > >
 > >Funny that the "texbook algorithms" aren't used in real life. Wonder why...
 > >  
 > >
 > Try BSD.  If the BSD book can be believed, they use"texbook algorithms".

The "textbook" one-way elevator (as indeed exemplified by FreeBSD's
src/sys/kern/subr_disk.c:bioq_disksort()) has well-known weaknesses. For
example,

    dd if=/dev/zero of=FILE

can easily monopolize device queue and starve accesses to the blocks
with low block numbers.

 > 
 > ;-)

Nikita.
