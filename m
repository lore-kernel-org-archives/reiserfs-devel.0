From: "David Dabbs" <david@dabbs.net>
Subject: RE: Performance improvements to key comparison functions
Date: Tue, 22 Jun 2004 05:53:05 -0500
Message-ID: <20040714105110.9A52415CE7@mail03.powweb.com>
References: <40F4D9D4.8050306@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19610-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40F4D9D4.8050306@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Hans Reiser' <reiser@namesys.com>
Cc: reiserfs-list@namesys.com


> David Dabbs wrote:
>
>Level-Segregated znode Cache
>The cache scanning walks the cache and calls znode_contains_key_strict if
>cached_node->level == search_key->level. If the scan tests some nodes not
>at the same level as the in-cache node it will ultimately find, does it 
>make sense to segregate the cache by level?
>
>> ...and later...
>>Scratch the per-level caching idea. What was I thinking? A cached 
>>node's level is not invariant.
>>

> Hans wrote:
> Yes it is, for balanced trees at least.
>
> Please forgive me for not having read this code in a year, can you say 
> this in more detail?

>
>I don't quite understand you.  Any given key will have at least one node
>(more than one only if there are multiple items with the same key, which
>happens for directory items if hashing is not perfect) into which it falls
>at each level of the tree.

Let me see if I can be more accurate in my description. reiser4_keys do not
have levels. When I wrote "search_key->level" I meant the h->level passed
into cbk_scan_cache_slots along with the search key. In search.c, 

cbk_cache_search() calls cbk_cache_scan_slots()
for the inclusive level range h->stop_level to h->lock_level
read from the cbk_handle passed in by cbk_cache_search (see below).

Now, after re-reading the code and taking into account your responses, I
wonder why cbk_cache_scan_slots cannot simply check whether a particular
cached node's level is between stop_level and lock_level inclusive instead
of scanning the slots with one level value, and then another, etc.? Is this
done so that the cache is not locked for the entire duration of the scan
even though it is locked/unlocked with every scan using a new level value?

> Hans:
> Is your point that a list structure is inferior to an array, when it is 
> used for a fixed size cache?

No, not at all. I was proposing a linked-list node cache _per_tree_level_.
The array came in with my sloppy suggestion that the pointers to these cache
structures should be stored in a static array of size MAX_TREE_LEVEL (256)
to make starting at the list head (for a particular level) as immediate as
it is with one cache today. A conditional would be removed from the slot
scan loop (testing the level of each cached node) and separate threads could
lock the various caches. Unfortunately, if cache activity ends up centering
on one level, then there would be no benefit. In addition, the number of
nodes to search could at worse double, yes? If there is no reason to scan
this level range in order, would it hurt to pick one of the levels at
random? 

Anyway, the sun is coming up, and I should do something about sleep. I think
I should not chew up bandwidth with any more speculations until after I
finish my work in progress and after more experience with the system.


David




/* look for item with given key in the coord cache

   This function, called by coord_by_key(), scans "coord cache" (&cbk_cache)
   which is a small LRU list of znodes accessed lately. For each znode in
   this list, it checks whether key we are looking for fits into
   key range covered by this node. If so, and in addition, node lies at 
   allowed level (this is to handle extents on a twig level), node is
   locked, and lookup inside it is performed.

   we need a measurement of the cost of this cache search compared to 
   the cost of coord_by_key.

*/
cbk_cache_search()
{
	int result = 0;
	tree_level level;

	/* add CBK_IN_CACHE to the handle flags. This means that
	 * cbk_node_lookup() assumes that cbk_cache is scanned and would add
	 * found node to the cache. */
	h->flags |= CBK_IN_CACHE;
	for (level = h->stop_level; level <= h->lock_level; ++level) {
		h->level = level;
		result = cbk_cache_scan_slots(h);
		if (result != 0) {
			done_lh(h->active_lh);
			done_lh(h->parent_lh);
			reiser4_stat_inc(tree.cbk_cache_miss);
		} else {
			assert("nikita-1319", !IS_CBKERR(h->result));
			reiser4_stat_inc(tree.cbk_cache_hit);
			write_tree_log(h->tree, tree_cached);
			break;
		}
	}
	h->flags &= ~CBK_IN_CACHE;
	return result;
}

cbk_cache_scan_slots() 
{
---8< --- snip
	/*
	 * this is time-critical function and dragons had, hence, been
settled
	 * here.
	 *
	 * Loop below scans cbk cache slots trying to find matching node
with
	 * suitable range of delimiting keys and located at the h->level.
	 *
	 * Scan is done under cbk cache spin lock that protects slot->node
	 * pointers. If suitable node is found we want to pin it in
	 * memory. But slot->node can point to the node with x_count 0
	 * (unreferenced). Such node can be recycled at any moment, or can
	 * already be in the process of being recycled (within jput()).
	 *
	 * As we found node in the cbk cache, it means that jput() hasn't
yet
	 * called cbk_cache_invalidate().
	 *
	 * We acquire reference to the node without holding tree lock, and
	 * later, check node's RIP bit. This avoids races with jput().
	 *
	 */

	rcu_read_lock();
	read_lock_cbk_cache(cache);
	slot = cbk_cache_list_prev(cbk_cache_list_front(&cache->lru));
	while (1) {

		slot = cbk_cache_list_next(slot);

		if (!cbk_cache_list_end(&cache->lru, slot))
			node = slot->node;
		else
			node = NULL;

		if (unlikely(node == NULL))
			break;

		/*
		 * this is (hopefully) the only place in the code where we
are
		 * working with delimiting keys without holding dk lock.
This
		 * is fine here, because this is only "guess" anyway---keys
		 * are rechecked under dk lock below.
		 */
		if (znode_get_level(node) == level &&
		    /* min_key < key < max_key */
		    znode_contains_key_strict(node, key, isunique)) {
			zref(node);
			result = 0;
			spin_lock_prefetch(&tree->tree_lock.lock);
			break;
		}
	}
	read_unlock_cbk_cache(cache);

	assert("nikita-2475", cbk_cache_invariant(cache));

	if (unlikely(result == 0 && ZF_ISSET(node, JNODE_RIP)))
		result = -ENOENT;

	rcu_read_unlock();

	if (result != 0) {
		h->result = CBK_COORD_NOTFOUND;
		return RETERR(-ENOENT);
	}

	result = longterm_lock_znode(h->active_lh, node,
cbk_lock_mode(level, h), ZNODE_LOCK_LOPRI);
	zput(node);
	if (result != 0)
		return result;
	result = zload(node);
	if (result != 0)
		return result;

	/* recheck keys */
	result =
		UNDER_RW(dk, tree, read,
			 znode_contains_key_strict(node, key, isunique)) &&
		!ZF_ISSET(node, JNODE_HEARD_BANSHEE);

	if (result) {
		/* do lookup inside node */

---8< --- snip

}



> David wrote:
>Lock-Free Data Structures
>I've recently been reading research regarding lock-, wait-, and
>obstruction-free concurrent data structures. Here are some relevant links:
>
>	http://www.cs.yorku.ca/~ruppert/papers/lfll.pdf
>	http://www.cl.cam.ac.uk/Research/SRG/netos/lock-free/
>	http://research.sun.com/scalable/pubs/index.html
>
>To the degree that these approaches do not require architecture-specific
>atomic primitives, their use could increase performance and possibly
>simplify things in some cases. Assuming they are portable, the place to
>apply them might be the cache linked-list(s).
>  

> Hans wrote:
Please let me know your thoughts on this once you have had a chance to 
pick a suggestion you like the most.  I will print these and put them in 
my queue, sigh.


Sorry for the somewhat mindless link propagation. Wanted to see whether
these approaches had been considered and rejected, were on the drawing
board, etc. I will make a recommendation when I finish the key stuff.




