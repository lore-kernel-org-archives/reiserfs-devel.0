From: Anders Widman <andewid@tnonline.net>
Subject: Re: [PATCH] various allocator optimizations
Date: Sun, 16 Mar 2003 17:25:14 +0100
Message-ID: <53331891906.20030316172514@tnonline.net>
References: <1047400482.8215.312.camel@tiny.suse.com>
 <20030311194205.A4493@namesys.com> <1047499021.8219.604.camel@tiny.suse.com>
 <3E6F9DE3.2070902@namesys.com>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13285-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E6F9DE3.2070902@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

...
>defragmenting tools are nice and all, but before we can write one we
>actually have to pick a disk layout for the tool to create ;-)

   Yes  and no :). A simple packer that defragments files, and perhaps
   move  files  that  are  in the same directory together. This can be
   done   without  knowing  usage  statistics  or  need  any  special
   algorithms?

   //Anders


--------
PGP public key: https://tnonline.net/secure/pgp_key.txt

