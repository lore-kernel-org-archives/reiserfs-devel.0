From: Daniel Phillips <phillips@arcor.de>
Subject: Re: precise characterization of ext3 atomicity
Date: Thu, 4 Sep 2003 23:59:11 +0200
Message-ID: <200309042359.11754.phillips@arcor.de>
References: <3F574A49.7040900@namesys.com> <200309042308.54002.phillips@arcor.de> <3F57B0FD.1060708@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15569-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F57B0FD.1060708@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Andrew Morton <akpm@osdl.org>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

On Thursday 04 September 2003 23:39, Hans Reiser wrote:
> Daniel Phillips wrote:
> >I have always thought that some higher level synchronization is
> >required for simultaneous writes.  So Hans might as well tell his fans
> >that Ext3 makes no official guarantee, and neither does Linux.
>
> Not sure what you mean.

Nothing bad.  More power to you for adding a transaction interface to Reiser4, 
and blazing that trail.  It's totally missing as a generic api at the moment, 
and needs a push.

Regards,

Daniel

