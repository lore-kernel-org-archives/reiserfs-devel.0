From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH] various allocator optimizations
Date: Mon, 18 Aug 2003 20:15:47 +0400
Message-ID: <3F40FBB3.2000002@namesys.com>
References: <1047400482.8215.312.camel@tiny.suse.com> <20030311194205.A4493@namesys.com> <1047499021.8219.604.camel@tiny.suse.com> <3E6F9DE3.2070902@namesys.com> <53331891906.20030316172514@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15365-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <53331891906.20030316172514@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Anders Widman <andewid@tnonline.net>
Cc: reiserfs-list@namesys.com

Anders Widman wrote:

>...
>  
>
>>defragmenting tools are nice and all, but before we can write one we
>>actually have to pick a disk layout for the tool to create ;-)
>>    
>>
>
>   Yes  and no :). A simple packer that defragments files, and perhaps
>   move  files  that  are  in the same directory together. This can be
>   done   without  knowing  usage  statistics  or  need  any  special
>   algorithms?
>
>   //Anders
>
>
>--------
>PGP public key: https://tnonline.net/secure/pgp_key.txt
>
>
>
>  
>
for reiser4 we simply put nodes in tree order

-- 
Hans


