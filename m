From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] reiserfs v3 patches for 2.6.6-rc2
Date: Tue, 11 May 2004 17:08:25 -0400
Message-ID: <1084309705.2583.191.camel@watt.suse.com>
References: <1082750045.12989.199.camel@watt.suse.com>
	 <1084305650.5439.4.camel@ipso.snappymail.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18619-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1084305650.5439.4.camel@ipso.snappymail.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Benoit <ipso@snappymail.ca>
Cc: reiserfs-list@namesys.com

On Tue, 2004-05-11 at 16:00, Mike Benoit wrote:
> Hi Chris,
> 
> 	Thanks for your work on ReiserFS. I'm curious though, did these changes
> (specifically the block allocator improvements) make it in to Kernel
> 2.6.6? 
> 
> If so, do I need to mkfs again, or use mount options to make use of new
> block allocator? Or is it enabled by default? 

They didn't make it into 2.6.6, I'll be feeding them in during 2.6.7-pre

The patches are in -mm now, the new mount options are enabled by
default.

-chris

