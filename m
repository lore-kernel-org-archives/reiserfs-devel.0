From: "David Dabbs" <david@dabbs.net>
Subject: RE: Performance improvements to key comparison functions
Date: Mon, 12 Jul 2004 16:27:39 -0500
Message-ID: <20040712212807.A7F6215E85@mail03.powweb.com>
References: <16624.31019.650162.819466@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19588-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16624.31019.650162.819466@gargle.gargle.HOWL>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Nikita Danilov' <nikita@clusterfs.com>
Cc: reiserfs-list@namesys.com



> Nikita Danilov wrote
> 
> Arrggh, I shouldn't post that late in night :)
> 
> ISO C 6.5.8  Relational operators
> 
>        [#6]  Each of the operators < (less than), > (greater than),
>        <= (less than or equal to), and >= (greater  than  or  equal
>        to) shall yield 1 if the specified relation is true and 0 if
>        it is false.80)  The result has type int.
> 
> Of course you are right.
> 
> Nikita. 

I'm curious about testing znode->version before and then after the call to
znode_contains_strict (when it returns true). Is there a reason this is not
done e.g. extra call to znode_contains is a small price to pay vs.
speculative, protected read of each cached node's version member? 

David

