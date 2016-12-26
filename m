From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Question on readahead of znodes under low RAM
Date: Mon, 26 Dec 2016 20:31:09 +0200
Message-ID: <586161ED.1040609@gmail.com>
References: <CADW=+3kuVwKOmx1nhUWz_ShDCCGg98WW-C61wd38mYuALEc6xg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-transfer-encoding;
        bh=oNrQLXDFtkWJa8nrx8PNsrUE88s5m0jxEr2JuYeHZKs=;
        b=J1UuxOEPWBNQBMUyTLUXOpHCcUfDUHOJW8C1/m3yW3OcfY28R0G1RWZhSwUTvKhlTB
         PYAJbBmXA15973EAbgMxcKQlVicRkPMWfuGEpWUleJ9LotmxKQHqvQOxljWvBJFSvDXm
         5W5+zrqc8eXUhUKlljaTeziyVlRsu+LCZYFs1KXPSzk+uG18MmfvAWaQV8D8XYzrgDkU
         D++aSCy4uC7C1h10ITlbDPjuvAgdwpLulewyAWW7glDqoxXO2XZoqmOUgZgNxOgVYXth
         d+A7L/X+LLsMhERZjauitg2lrg7UDI9wO2rMKcuOjyHiwslwDRGoM+QGJMYv423KgA6h
         KD9g==
In-Reply-To: <CADW=+3kuVwKOmx1nhUWz_ShDCCGg98WW-C61wd38mYuALEc6xg@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

On 12/24/2016 10:39 PM, Dušan Čolić wrote:
> znode.c line 618:
>
> /* zload with readahead */
> int zload_ra(znode * node /* znode to load */ , ra_info_t * info)
> {
> int result;
> assert("nikita-484", node != NULL);
> assert("nikita-1377", znode_invariant(node));
> assert("jmacd-7771", !znode_above_root(node));
> assert("nikita-2125", atomic_read(&ZJNODE(node)->x_count) > 0);
> assert("nikita-3016", reiser4_schedulable());
> if (info)
> formatted_readahead(node, info);
> result = jload(ZJNODE(node));
> assert("nikita-1378", znode_invariant(node));
> return result;
> }
> /* load content of node into memory */
> int zload(znode *node)
> {
> return zload_ra(node, NULL);
> }
>
>
> readahead.c line 39:
>
> #define LOW_MEM_PERCENTAGE (5)
> static int low_on_memory(void)
> {
> unsigned int freepages;
> freepages = nr_free_pages();
> return freepages < (totalram_pages * LOW_MEM_PERCENTAGE / 100);
> }
> /* start read for @node and for a few of its right neighbors */
> void formatted_readahead(znode * node, ra_info_t *info)
> {
> struct formatted_ra_params *ra_params;
> znode *cur;
> int i;
> int grn_flags;
> lock_handle next_lh;
> /* do nothing if node block number has not been assigned to node (which
> * means it is still in cache). */
> if (reiser4_blocknr_is_fake(znode_get_block(node)))
> return;
> ra_params = get_current_super_ra_params();
> if (znode_page(node) == NULL)
> jstartio(ZJNODE(node));
> if (znode_get_level(node) != LEAF_LEVEL)
> return;
> /* don't waste memory for read-ahead when low on memory */
> if (low_on_memory())
> return;
>
>
> So how is znode loaded when free RAM is < 5%?


According to this function when free RAM < 5%
actual read-ahead is not triggered, so zload() issues
a read IO request per znode.

Edward.
