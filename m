From: "David Dabbs" <david@dabbs.net>
Subject: RE: Performance improvements to key comparison functions
Date: Mon, 12 Jul 2004 17:03:31 -0500
Message-ID: <20040712220400.7273415F22@mail03.powweb.com>
References: <16624.33598.532028.839701@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19591-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16624.33598.532028.839701@gargle.gargle.HOWL>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Nikita Danilov' <nikita@clusterfs.com>
Cc: reiserfs-list@namesys.com




>  I'm curious about testing znode->version before and then after the call
>  to 
>  > znode_contains_strict (when it returns true). Is there a reason this is
> not
>  > done e.g. extra call to znode_contains is a small price to pay vs.
>  > speculative, protected read of each cached node's version member?
> 
> I don't quite follow, can you elaborate? What znode_contains_strict()'s
> call site are you talking about?
> 
> Nikita.

[David Dabbs] 

The function that scans cached znodes before embarking on a full tree search
is the site I had in mind. It locks the cache, then calls
znode_contains_key_strict if the h->level == cached_node->level (or
something similar). All search key/cached node comparisons are done without
locking each cached node. If a cached node is found, the code then locks the
node, rechecks znode->level, recalls znode_contains_key_strict and, I think,
checks for ZNODE_HEARD_BANSHEE, etc. 

Assuming the search key is an invariant, it seems as though one could grab a
copy of cached_node->version _before_ calling znode_contains. If z_c_k_s
finds a match and the version member is unchanged, then one need not recall
z_c_k_s. If it is different, then recheck z_c_k_s as is done now.

David


