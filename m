From: Chris Mason <mason@suse.com>
Subject: Re: 2.4.20 and data logging
Date: 03 Dec 2002 11:21:11 -0500
Message-ID: <1038932472.1508.4.camel@tiny>
References: <200212031238.32403.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12092-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200212031238.32403.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Russell Coker <russell@coker.com.au>
Cc: reiserfs-list@namesys.com

On Tue, 2002-12-03 at 06:38, Russell Coker wrote:
> How is data logging work going?  Is there a patch for 2.4.20?

I'm trying to sort out a complete fix for the transaction overflow bug
Philippe hit, but other than that the patches are considered stable.

You can find 2.4.20 patches in
ftp.suse.com/pub/people/mason/patches/data-logging/2.4.20

-chris

