From: Chris Mason <mason@suse.com>
Subject: Re: new v3 2.6.4  logging/xattr patches
Date: Sat, 20 Mar 2004 14:18:01 -0500
Message-ID: <1079810281.11062.317.camel@watt.suse.com>
References: <1079679539.11055.101.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17347-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1079679539.11055.101.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Fri, 2004-03-19 at 01:58, Chris Mason wrote:
> Hello everyone,
> 
> I've just uploaded all the reiserfs patches from the suse 2.6 kernel to:
> 
> ftp.suse.com/pub/people/mason/patches/data-logging/experimental/2.6.4

There's a new patch there, reiserfs-ordered-lat.  It has two latency
fixes from Takashi Iwai, that also improve data=ordered throughput in
some cases.

If you want to apply to -mm or to 2.6.5-rc2, use the series.mm for the
list of patches.  

-chris


