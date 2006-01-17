From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: vs-4080
Date: Tue, 17 Jan 2006 14:32:21 -0700
Message-ID: <1137533541.6375.76.camel@tribesman.namesys.com>
References: <200601111109.09437.rmeijer@internet.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27758-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200601111109.09437.rmeijer@internet.gr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Raymond A. Meijer" <rmeijer@internet.gr>
Cc: reiserfs-list@namesys.com

Hello

On Wed, 2006-01-11 at 11:09 +0200, Raymond A. Meijer wrote:
> Hello,
> 
> This morning I found the following warning on my Debian server holding a 253
> GB Debian archive mirror:
> 
> ReiserFS: dm-8: warning: vs-4080: reiserfs_free_block: free_block (dm-8:46707368)[dev:blocknr]: bit already cleared
> 
> If fixed it with --fix-fixable, but what was it and what does it mean?
> 

This indicated a corruption in disk space allocation bitmap: used block
was marked as free.
Am I correct that you got only one such message?
Do you run reiserfsck regularly on that filesystem?

> 
> Thanks,
> 
> Ray
> 

