From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiserfsck --rebuild-tree failed
Date: Sat, 10 Mar 2007 22:56:02 +0300
Message-ID: <200703102256.03079.vs@namesys.com>
References: <1979353763.20070310180023@sitv.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30597-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1979353763.20070310180023@sitv.ru>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, Sergey Matviyenko <stealth@sitv.ru>

Hello

On Saturday 10 March 2007 16:00, Sergey Matviyenko wrote:
> I run reiserfsck --yes --rebuild-tree --scan-whole-partition.
> 
> With reiserfsprogs-3.6.19 i have error on Pass 3a:
> "lost+found.c 348 pass_3a_look_for_lost
> look_for_lost: The entry 'lost+found' could not be found in the root directory."
> 
there was a patch for this. I will try to find it.

> With reiserfsprogs-3.6.19.5 i have error on Pass 2:
> reiserfsck: ustree.c:51: free_unformatted_nodes: Assertion `to_be_forgotten->b_count > 0' failed.
> 
> 
> 
> 
> 
> 
> 
> 
