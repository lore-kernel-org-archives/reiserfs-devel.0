From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: Performance improvements to key comparison functions
Date: Mon, 12 Jul 2004 16:00:22 +0400
Message-ID: <16626.32086.481761.496932@gargle.gargle.HOWL>
References: <16624.33598.532028.839701@gargle.gargle.HOWL>
	<20040712220400.7273415F22@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19596-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040712220400.7273415F22@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Dabbs <david@dabbs.net>
Cc: 'Nikita Danilov' <nikita@clusterfs.com>, reiserfs-list@namesys.com

David Dabbs writes:
 > 
 > 
 > 
 > >  I'm curious about testing znode->version before and then after the call
 > >  to 
 > >  > znode_contains_strict (when it returns true). Is there a reason this is
 > > not
 > >  > done e.g. extra call to znode_contains is a small price to pay vs.
 > >  > speculative, protected read of each cached node's version member?
 > > 
 > > I don't quite follow, can you elaborate? What znode_contains_strict()'s
 > > call site are you talking about?
 > > 
 > > Nikita.
 > 
 > [David Dabbs] 
 > 
 > The function that scans cached znodes before embarking on a full tree search
 > is the site I had in mind. It locks the cache, then calls
 > znode_contains_key_strict if the h->level == cached_node->level (or
 > something similar). All search key/cached node comparisons are done without
 > locking each cached node. If a cached node is found, the code then locks the
 > node, rechecks znode->level, recalls znode_contains_key_strict and, I think,
 > checks for ZNODE_HEARD_BANSHEE, etc. 
 > 
 > Assuming the search key is an invariant, it seems as though one could grab a
 > copy of cached_node->version _before_ calling znode_contains. If z_c_k_s
 > finds a match and the version member is unchanged, then one need not recall
 > z_c_k_s. If it is different, then recheck z_c_k_s as is done now.

I see now. Problem is that znode->version is protected by long-term lock
itself. That is, invariant

    "znode content change implies znode->version bump"

is maintained under long-term lock on znode. In particular, following
sequence of actions is valid:

(1) obtain long term lock on znode Z

(2) modify Z's content

(3) bump Z->version

(4) modify Z's content again

(5) release long-term lock (without increasing Z->version for the second
    time)

If first call to z_c_k_s() happens between (3) and (4), re-checking
->version is not enough.

 > 
 > David

Nikita.
