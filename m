From: Chris Mason <mason@suse.com>
Subject: Re: Re: [PATCH CFT] tons of logging patches
Date: 02 Aug 2002 08:34:45 -0400
Message-ID: <1028291685.19330.215.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11111-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1028291287.12934.207.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

On Fri, 2002-08-02 at 08:28, Chris Mason wrote:
> Hello everyone,
> 
> I've uploaded 03-data-logging-24.diff, which fixes a tail packing oops
> in data=journal mode, and fixes the data=ordered slow down (5-10%)
> introduced in -23.  

Whoops, I neglected to mention that data=ordered is now the default in
the patch.  You can mount with -o data=writeback if you don't want
ordered data writes.

-chris


