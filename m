From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Reiser4 status: benchmarked vs. V3 (and ext3)
Date: Fri, 25 Jul 2003 17:02:39 +0400
Message-ID: <16161.10863.793737.229170@laputa.namesys.com>
References: <3F1EF7DB.2010805@namesys.com>
	<1059062380.29238.260.camel@sonja>
	<16160.4704.102110.352311@laputa.namesys.com>
	<1059093594.29239.314.camel@sonja>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15044-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1059093594.29239.314.camel@sonja>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Egger <degger@fhm.edu>
Cc: Hans Reiser <reiser@namesys.com>, linux-kernel@vger.kernel.org, reiserfs mailing list <reiserfs-list@namesys.com>

Daniel Egger writes:
 > Am Don, 2003-07-24 um 19.07 schrieb Nikita Danilov:
 > 
 > > I don't know enough about jffs2, but you can read about reiser4's
 > > "wandering logs" and transaction manager design at the
 > > http://www.namesys.com/txn-doc.html.
 > 
 > I've read it by now, thanks for the reference.
 > 
 > > Briefly speaking, in usual WAL (write-ahead logging) transaction system,
 > > whenever block is modified, journal record, describing changes to this
 > > block is forced to the on-disk journal before modified block is allowed
 > > to be written. In the worst case this means that data are written twice.
 > 
 > Is there way to influence what is considered free space for the
 > wandering blocks or is it a fixed algorithm? If the latter, what is the
 > access pattern on the free space (like pseudorandom, cyclic linear,
 > hashed)?

No special measures are taken to level block allocation. Wandered blocks
are allocated to improve packing i.e., place blocks of the same file
close to each other. Actually, it tries to place tree nodes in the
parent-first order.

 > 
 > > I should warn everybody that reiser4 is _highly_ _experimental_ at this
 > > moment. Don't use it for production.
 > 
 > That certainly doesn't stop me from trying... :)
 > Have you ran any tests to test the durabilty of your "transcrash" system
 > for instance against sudden power dropouts?
 > Is the filesystem selfhealing or does one need fsck.reiserfs for it? If
 > the latter: will it do the right thing (i.e. automatically bring the
 > system into consistent shape not like ext3) when invoked with "-y"?

It should automatically replay journal on the mount. fsck.reiser4 is
still needed owing to the bugs in the implementation, but, I am afraid,
it cannot do much at the moment.

 > 
 > -- 
 > Servus,
 >        Daniel

Nikita.
