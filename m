From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2004@gmx.net>
Subject: Re: REISER4 corruptions errors
Date: Mon, 26 Jan 2004 17:36:10 +0100
Message-ID: <401541FA.5060309@gmx.net>
References: <16405.7504.491020.659611@laputa.namesys.com> <20040126142528.22476.qmail@web21509.mail.yahoo.com> <20040126152607.GB21337@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16626-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040126152607.GB21337@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Zarochentsev <zam@namesys.com>
Cc: Paolo Correnti <paolunix@yahoo.com>, Nikita Danilov <Nikita@Namesys.COM>, REISER LIST <reiserfs-list@namesys.com>

Alex Zarochentsev wrote:

> this patch should help (! not tested):
> 
> ===== tree.c 1.562 vs edited =====
> --- 1.562/tree.c        Wed Jan 14 11:46:20 2004
> +++ edited/tree.c       Mon Jan 26 18:24:39 2004
> @@ -1468,7 +1468,7 @@
>                 if ((result != 0) && (result != -E_NO_NEIGHBOR))
>                         break;
>                 /* Check can we delete the node as a whole. */
> -               if (iterations && znode_get_level(node) == LEAF_LEVEL &&
> +               if (0 && iterations && znode_get_level(node) == LEAF_LEVEL &&
>                     UNDER_RW(dk, current_tree, read,
>                              keyle(from_key, znode_get_ld_key(node)))) {
>                         result = delete_node(next_node_lock.node,

Was it your intention to disable the above code path?


Carl-Daniel
-- 
http://www.hailfinger.org/

