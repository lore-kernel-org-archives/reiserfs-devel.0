From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Re: write barrier patches for 2.4.21
Date: Thu, 28 Aug 2003 10:07:25 -0700
Message-ID: <20030828170725.GB21352@matchmail.com>
References: <20030825170849.GA14811@mfa.kfki.hu> <20030826214624.GA410@zero> <20030827064103.GA29131@namesys.com> <20030827220337.GB4886@zero> <1062031059.5324.111.camel@tiny.suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15475-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1062031059.5324.111.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: Tom Vier <tmv@comcast.net>, Reiserfs List <reiserfs-list@namesys.com>

On Wed, Aug 27, 2003 at 08:37:40PM -0400, Chris Mason wrote:
> scsi drives don't really need them because most scsi drives don't have
> write back caching on by default, and most actually listen when you turn
> the cache off.  The scsi tag queuing makes good performance possible
> even without writeback caching.

So, in essence, TCQ is exposing what is happening in the cache, and allowing
control/showing state compared to IDE's non-TCQ write cache.  Do I have that
right?
