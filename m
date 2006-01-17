From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Re: vs-4080
Date: Tue, 17 Jan 2006 17:11:38 +0200
Message-ID: <200601171711.38508.rmeijer@internet.gr>
References: <200601111109.09437.rmeijer@internet.gr> <1137533541.6375.76.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27767-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1137533541.6375.76.camel@tribesman.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Tue 17 Jan 2006 23:32, Vladimir V. Saveliev wrote:

Hi Vladimir,

> > ReiserFS: dm-8: warning: vs-4080: reiserfs_free_block: free_block
> > (dm-8:46707368)[dev:blocknr]: bit already cleared

> This indicated a corruption in disk space allocation bitmap: used block
> was marked as free.

I see..

> Am I correct that you got only one such message?

Yes, only one.

> Do you run reiserfsck regularly on that filesystem?

I hadn't run it for several months indeed...

Should I run it more often?


Ray
