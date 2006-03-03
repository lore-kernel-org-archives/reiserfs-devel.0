From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: mount fails
Date: Fri, 03 Mar 2006 15:23:05 +0300
Message-ID: <1141388585.6429.19.camel@tribesman.namesys.com>
References: <20060302204756.d3a27396.boricua@despiertapr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28197-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060302204756.d3a27396.boricua@despiertapr.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: boricua <boricua@despiertapr.com>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2006-03-02 at 20:47 -0500, boricua wrote:
> using suse 10.0 , strange this is like 2nd time suse fails or my hd fails using suse
> 
> 
> trying to mount /dev/hda4 fails with bad blocks and both
> 
> reiserfsck --rebuild-tree also fails.
> this happend to be my / partition 
> 
> any other way or what else ican do to be able to mount partition
> 

Please take a look at
http://namesys.com/bad-block-handling.html

