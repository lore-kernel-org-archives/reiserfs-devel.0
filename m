From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: Performance improvements to key comparison functions
Date: Sun, 11 Jul 2004 03:18:03 +0400
Message-ID: <16624.31019.650162.819466@gargle.gargle.HOWL>
References: <16626.61112.905268.684688@laputa.namesys.com>
	<20040712202654.C757F16096@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19586-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040712202654.C757F16096@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Dabbs <david@dabbs.net>
Cc: reiserfs-list@namesys.com

David Dabbs writes:
 > 
 > Thanks for looking over the code and for your responses.
 > 
 > > Nikita wrote
 > > Note that comparisons in C (like (v1 > v2)) are not guaranteed to return 0
 > > or _1_ as a result, but simply zero, or _non-zero_.
 > 
 > Is the information here (http://www.lysator.liu.se/c/c-faq/c-8.html)
 > incorrect then? Specifically,
 > 
 > ---8<  snip

Arrggh, I shouldn't post that late in night :)

ISO C 6.5.8  Relational operators

       [#6]  Each of the operators < (less than), > (greater than),
       <= (less than or equal to), and >= (greater  than  or  equal
       to) shall yield 1 if the specified relation is true and 0 if
       it is false.80)  The result has type int.

Of course you are right.

Nikita.
