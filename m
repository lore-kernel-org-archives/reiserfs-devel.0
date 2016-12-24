From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Question on readahead of znodes under low RAM
Date: Sat, 24 Dec 2016 21:39:51 +0100
Message-ID: <CADW=+3kuVwKOmx1nhUWz_ShDCCGg98WW-C61wd38mYuALEc6xg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=FiVayOcttLODdD4YbC+/Pn5jEGn1BCWn7F6IjJGDMSg=;
        b=oboipNXi5IADv+WS6p28gymDwoeRgr/V32NZ+P+gk2ml7Mfy4v/CG7Y8RiWDfMQqll
         EBEyOAGSLwnPP+aMkUwk63sqmntOu7MLngsSbmGHHSLadwB5EpDDWLxHCFwi8d1Cfc3L
         u+E1TpikEvnnEpLPSjQIQFJYFo8YC6grqDobTtEegMjbw0Z9TKbsrhn3eZIC/4qwEXqZ
         6m4OTzwhymsiwmzBfQi/8IIc3s9PnMDzNSjGjhLlEY8dV5M8fuLDXapL/aqDxtCQR4ty
         paXI4ceh/vOt24jHV0zmWeSkiIgScKjCcYJBau1FyyTIPiCDSHzQsuXJXtxwxxwHaoDH
         6Kbw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

znode.c line 618:

/* zload with readahead */
int zload_ra(znode * node /* znode to load */ , ra_info_t * info)
{
int result;
assert("nikita-484", node != NULL);
assert("nikita-1377", znode_invariant(node));
assert("jmacd-7771", !znode_above_root(node));
assert("nikita-2125", atomic_read(&ZJNODE(node)->x_count) > 0);
assert("nikita-3016", reiser4_schedulable());
if (info)
formatted_readahead(node, info);
result = jload(ZJNODE(node));
assert("nikita-1378", znode_invariant(node));
return result;
}
/* load content of node into memory */
int zload(znode *node)
{
return zload_ra(node, NULL);
}


readahead.c line 39:

#define LOW_MEM_PERCENTAGE (5)
static int low_on_memory(void)
{
unsigned int freepages;
freepages = nr_free_pages();
return freepages < (totalram_pages * LOW_MEM_PERCENTAGE / 100);
}
/* start read for @node and for a few of its right neighbors */
void formatted_readahead(znode * node, ra_info_t *info)
{
struct formatted_ra_params *ra_params;
znode *cur;
int i;
int grn_flags;
lock_handle next_lh;
/* do nothing if node block number has not been assigned to node (which
* means it is still in cache). */
if (reiser4_blocknr_is_fake(znode_get_block(node)))
return;
ra_params = get_current_super_ra_params();
if (znode_page(node) == NULL)
jstartio(ZJNODE(node));
if (znode_get_level(node) != LEAF_LEVEL)
return;
/* don't waste memory for read-ahead when low on memory */
if (low_on_memory())
return;


So how is znode loaded when free RAM is < 5%?

Dushan
