From: Ross Vandegrift <ross@willow.seitz.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Wed, 12 Feb 2003 00:12:13 -0500
Message-ID: <20030212051213.GA21039@willow.seitz.com>
References: <NDBBJPAGKLCMDEIEKOPBAEIMKFAA.mailinglists@websitemanagers.com.au> <3452483515.20030212001747@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12695-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3452483515.20030212001747@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anders Widman <andewid@tnonline.net>
Cc: reiserfs-list@namesys.com

On Wed, Feb 12, 2003 at 12:17:47AM +0100, Anders Widman wrote:
> Sure,  a  disk  with physical errors should be replaced, but until you
> find out about the error on the drive the FS HAS TO HANDLE these kinds
> of problems.

No, this is *ridiculous*.  A filesystem should tolerate a failed disk when
the VM system can handle bad memory, or the scheduler can handle an
overheated CPU.  In all three cases, hard failure of a machine is
certain, unless hardware is replaced before the failure occurs.

You have to start your software on some kind of foundation.  Working
hardware sounds like a great place to me.

-- 
Ross Vandegrift
ross@willow.seitz.com

A Pope has a Water Cannon.                               It is a Water Cannon.
He fires Holy-Water from it.                        It is a Holy-Water Cannon.
He Blesses it.                                 It is a Holy Holy-Water Cannon.
He Blesses the Hell out of it.          It is a Wholly Holy Holy-Water Cannon.
He has it pierced.                It is a Holey Wholly Holy Holy-Water Cannon.
He makes it official.       It is a Canon Holey Wholly Holy Holy-Water Cannon.
Batman and Robin arrive.                                       He shoots them.
