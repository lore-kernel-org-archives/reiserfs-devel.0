From: "David Dabbs" <david@dabbs.net>
Subject: RE: Performance improvements to key comparison functions
Date: Tue, 13 Jul 2004 12:58:06 -0500
Message-ID: <20040713175848.6998215E19@mail03.powweb.com>
References: <16626.32086.481761.496932@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19600-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16626.32086.481761.496932@gargle.gargle.HOWL>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Nikita Danilov' <nikita@clusterfs.com>
Cc: reiserfs-list@namesys.com

> Nikita wrote
> 
> I see now. Problem is that znode->version is protected by long-term lock
> itself. That is, invariant
> 
>     "znode content change implies znode->version bump"
> 
> is maintained under long-term lock on znode. In particular, following
> sequence of actions is valid:
> 
> (1) obtain long term lock on znode Z
> 
> (2) modify Z's content
> 
> (3) bump Z->version
> 
> (4) modify Z's content again
> 
> (5) release long-term lock (without increasing Z->version for the second
>     time)
> 
> If first call to z_c_k_s() happens between (3) and (4), re-checking
> ->version is not enough.
> 
[David Dabbs] 

Thanks. I figured there was a concurrency issue.

Another question. Is it an invariant that all key values, whether persisted
to disk or in-memory only, are stored in little-endian order? Specifically
I'm thinking of key values used when searching the (a) tree. Seems like they
must be, as the key comparison functions call d64tocpu() when operating on
all key parameters.

If this is the case, one can test for equivalence using each datum (on both
big- and little-endian machines) and only call __swab64 (d64tocpu) when one
needs to evaluate the difference between two architecture-native values.
Something like

	if(k1->el[0].datum != k1->el[0].datum)
		return (d64tocpu(k1, 0) < (d64tocpu(k2, 0);

Bits are bits, right - at least when testing equivalence? This would have no
effect on little-endian architectures, but for big-endian shouldn't this
'deferred swabbing' improve things?

David


