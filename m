From: Christoph Hellwig <hch@lst.de>
Subject: Re: [patch 2/2] reiser4: new export ops
Date: Wed, 28 Nov 2007 10:43:01 +0100
Message-ID: <20071128094301.GA7760@lst.de>
References: <200710212348.l9LNm3Cq000694@imap1.linux-foundation.org> <474CBEEF.3060303@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <474CBEEF.3060303@namesys.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shishkin <edward@namesys.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Reiserfs-list <reiserfs-devel@vger.kernel.org>, bfields@citi.umich.edu, Neil Brown <neilb@suse.de>, Christoph Hellwig <hch@lst.de>, Linux kernel mailing list <linux-kernel@vger.kernel.org>

This code looks a little confusing to me..

>   */
>  static char *decode_inode(struct super_block *s, char *addr,
>  			  reiser4_object_on_wire * obj)
> @@ -41,7 +42,8 @@
>  	fplug = file_plugin_by_disk_id(reiser4_get_tree(s), (d16 *) addr);
>  	if (fplug != NULL) {
>  		addr += sizeof(d16);
> -		obj->plugin = fplug;
> +		if (obj)
> +			obj->plugin = fplug;

You are adding quite a few of those if (obj) clauses.  I can't see a
reason for that - care to explain?  The new aops should not disallow for
any functionality that has been there before.

> static struct dentry *reiser4_decode_fh(struct super_block *super, __u32 *fh,
> +					int len, int fhtype, int parent)
>  {
>  	reiser4_context *ctx;
>  	reiser4_object_on_wire object;
>  	char *addr;
>  
>  	ctx = reiser4_init_context(super);
>  	if (IS_ERR(ctx))
> @@ -80,25 +77,19 @@
>  	assert("vs-1482",
>  	       fhtype == FH_WITH_PARENT || fhtype == FH_WITHOUT_PARENT);
>  
> 	addr = (char *)fh;
> 
> 	object_on_wire_init(&object);
> +
> +	if (parent)
> +		/* skip first onwire object */
> +		addr = decode_inode(super, addr, NULL);
> 	if (!IS_ERR(addr)) {
> +		addr = decode_inode(super, addr, &object);
> 		if (!IS_ERR(addr)) {
> 			struct dentry *d;
> 
> +			d = reiser4_get_dentry(super, &object);

I'd suggest to directly poke into the place where the parent handle
is stored.  XFS used a similar construct to the decode_inode helper,
but with the new aops it's faster and easier to read if you just have
a helper on how many bytes to skip.  Did you take a look at how the
various other filesystem handle the export ops?

> --- linux-2.6.23-mm1/fs/reiser4/dscale.c.orig
> +++ linux-2.6.23-mm1/fs/reiser4/dscale.c
> @@ -126,6 +126,24 @@

How are the changes to all these other files related to the export
operations changes?

