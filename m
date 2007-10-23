From: Edward Shishkin <edward@namesys.com>
Subject: Re: [PATCH 11/8] coord.c cleanup
Date: Tue, 23 Oct 2007 18:05:47 +0400
Message-ID: <471DFFBB.2050500@namesys.com>
References: <1193146289.6236.63.camel@krshina3.gekom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1193146289.6236.63.camel@krshina3.gekom>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: dusanc@absolutok.net
Cc: reiser4 <reiserfs-devel@vger.kernel.org>

olalala, your MUA wraps it at 70 chars..

Dushan Tcholich wrote:

>Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
>--- coord.c.orig	2007-10-23 15:07:41.000000000 +0200
>+++ coord.c	2007-10-23 15:29:26.000000000 +0200
>@@ -1,4 +1,5 @@
>-/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
>reiser4/README */
>+/* Copyright 2001, 2002, 2003 by Hans Reiser, licensing governed by
>+   reiser4/README */
> 
> #include "forward.h"
> #include "debug.h"
>@@ -10,7 +11,7 @@
> 
> /* Internal constructor. */
> static inline void
>-coord_init_values(coord_t * coord, const znode * node, pos_in_node_t
>item_pos,
>+coord_init_values(coord_t *coord, const znode * node, pos_in_node_t
>item_pos,
> 		  pos_in_node_t unit_pos, between_enum between)
> {
> 	coord->node = (znode *) node;
>@@ -20,12 +21,13 @@ coord_init_values(coord_t * coord, const
> 	ON_DEBUG(coord->plug_v = 0);
> 	ON_DEBUG(coord->body_v = 0);
> 
>-	/*ON_TRACE (TRACE_COORDS, "init coord %p node %p: %u %u %s\n", coord,
>node, item_pos, unit_pos, coord_tween_tostring (between)); */
>

