From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: Performance improvements to key comparison functions
Date: Sun, 11 Jul 2004 03:23:14 +0400
Message-ID: <16624.31330.201367.508700@gargle.gargle.HOWL>
References: <16626.61112.905268.684688@laputa.namesys.com>
	<20040712204952.C0C3A1617F@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19587-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040712204952.C0C3A1617F@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Dabbs <david@dabbs.net>
Cc: reiserfs-list@namesys.com

David Dabbs writes:
 > 
 > 
 > > Nikita Danilov wrote
 > > That said, I think that proper way to test your functions is to plug
 > > them into kernel reiser4 version and run some CPU intensive tests.
 > 
 > Is bonnie++ the recommended stress tool, or is there a reiser4 stress
 > utility?
 > 

Standard Namesys benchmarking utility is "mongo"
(http://www.namesys.com/benchmarks/mongo_readme.html).

 > 
 > David

Nikita.
