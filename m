From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCHv2 1/3] reiser4: remove last traces of JNODE_NEW in the
 debugging code.
Date: Mon, 9 Nov 2015 12:49:57 +0100
Message-ID: <56408865.30608@gmail.com>
References: <1445727740-12361-1-git-send-email-intelfx100@gmail.com>
 <1445727740-12361-2-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-type:content-transfer-encoding;
        bh=PLyqX6d0l7yY6SUkoikNai99CZKM0BrVI1ZV3aWCbsY=;
        b=zLca/thhrDhjfucvo2cs2Kw9Qsj6J5IZIe5GdDB3fkwDaNS11usHRTN3VLijJxWzzJ
         tpfsyjV7Bsz4iTIWFCwIzTWvHsCvgFjcNs4ANswi9IHGrh9kv8txgbyOvzn2TdVv9MqI
         ZpeyeCgGRLpv4AT7vemMXo3m/rYztQmWhuZNUBzN6ZusNbJ3m2SJleLGVf9WmEOCFQLJ
         lnGYIMxCX3RpP/ijTtP4s/z9X8RrW69rn3hAGoujFcHKajy5ejHMT+UQ5LbVX4jAL/6/
         F5CfTharoaz3Gui56PaLBeeVYZW1H+K8PFCQ67is+Ha+axQ+e+illFmEnzdRqmQqP199
         sgTw==
In-Reply-To: <1445727740-12361-2-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org

OK

On 10/25/2015 01:02 AM, Ivan Shapovalov wrote:
> Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> ---
>   fs/reiser4/jnode.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/fs/reiser4/jnode.c b/fs/reiser4/jnode.c
> index e0c9e0c..43af7e9 100644
> --- a/fs/reiser4/jnode.c
> +++ b/fs/reiser4/jnode.c
> @@ -1846,7 +1846,7 @@ static void info_jnode(const char *prefix /* prefix to print */ ,
>   	}
>   
>   	printk
> -	    ("%s: %p: state: %lx: [%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s], level: %i,"
> +	    ("%s: %p: state: %lx: [%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s], level: %i,"
>   	     " block: %s, d_count: %d, x_count: %d, "
>   	     "pg: %p, atom: %p, lock: %i:%i, type: %s, ", prefix, node,
>   	     node->state,
> @@ -1863,7 +1863,6 @@ static void info_jnode(const char *prefix /* prefix to print */ ,
>   	     jnode_state_name(node, JNODE_RIP),
>   	     jnode_state_name(node, JNODE_MISSED_IN_CAPTURE),
>   	     jnode_state_name(node, JNODE_WRITEBACK),
> -	     jnode_state_name(node, JNODE_NEW),
>   	     jnode_state_name(node, JNODE_DKSET),
>   	     jnode_state_name(node, JNODE_REPACK),
>   	     jnode_state_name(node, JNODE_CLUSTER_PAGE),

