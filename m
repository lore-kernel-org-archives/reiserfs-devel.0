From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Can compression at filesystem level improve overall
	performance?
Date: Fri, 19 Mar 2004 19:53:33 +0300
Message-ID: <16475.9613.375262.677576@laputa.namesys.com>
References: <405B02ED.4010602@solidcode.net>
	<1079713790.9729.1.camel@redeeman.linux.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17327-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1079713790.9729.1.camel@redeeman.linux.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Redeeman <redeeman@redeeman.linux.dk>
Cc: Reiserfs Mailinglist <reiserfs-list@namesys.com>

Redeeman writes:
 > On Fri, 2004-03-19 at 15:25, Erik Terpstra wrote:
 > > Hello everyone,
 > > 
 > > For the last couple of years I noticed that the performance of most of 
 > > my systems has it's bottleneck in data throughput rather than CPU 
 > > performance.
 > > 
 > > Is it fair to say that today compression at the filesystem level would 
 > > improve overall performance?
 > > 
 > > If this is the case, it probably wouldn't be too hard to implement as a 
 > > module in Reiser4?
 > > 
 > > Any thoughts?
 > the more agressive you compress it the more cpu it takes, and that will
 > make it slower, but i think a small compression algorithm for filesystem
 > purpose could be written... however, i doubt it will be worth it,
 > harddrives are really cheap nowadays.. but maybe some algortihm to
 > compress cleartext only, or something..

That's common misconception. :)

The goal of compression is to conserve disk bandwidth rather than space.

By compressing it is possible to transfer data (== uncompressed data
user works with), at a rate higher than raw device bandwidth.

 > 
 > 
 > > 
 > > --Erik.
 > -- 
 > Regards, Redeeman
 > redeeman@metanurb.dk
 > 

Nikita.
