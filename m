From: Chris Mason <mason@suse.com>
Subject: Re: mongo_copy: cp: cannot stat `/mnt/testfs/testdir0-0-0/f92':
	Input/output error
Date: Wed, 04 Aug 2004 13:46:41 -0400
Message-ID: <1091641601.4791.50.camel@watt.suse.com>
References: <20040804141752.E344D15D07@mail03.powweb.com>
	 <41111F2C.6090805@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19988-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41111F2C.6090805@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: David Dabbs <david@dabbs.net>, "'Vladimir V. Saveliev'" <vs@namesys.com>, reiserfs-list@namesys.com

On Wed, 2004-08-04 at 13:38, Hans Reiser wrote:
> Please do whatever you can to reproduce this.  We are going to delay 
> release by one day to see if it can be reproduced.  Vs thinks it might 
> be a hardware problem, I am not so optimistic, what are your thoughts?
> 

If it currently passes all of your internal tests, and the disk format
is fixed, I'd release it.  There are going to be bugs found, pretty much
everyone expects v4 to go through a churning period.

-chris


