From: Jake Maciejewski <maciejej@msoe.edu>
Subject: Re: status of reiser4
Date: Fri, 17 Dec 2004 12:54:08 -0600
Message-ID: <1103309648.8570.28.camel@localhost>
References: <41C322ED.4000807@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22824-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41C322ED.4000807@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Have there been any reports other than Isaac's of reiser4 working on
AMD64? It still doesn't work for me, and I'd like to know if I'm the
only one having problems.

On Fri, 2004-12-17 at 10:18 -0800, Hans Reiser wrote:
> Vladimir is working on one last bug that occurs if copy from user page 
> faults on the user space process's buffer, and then we are going to 
> bundle a set of patches together, send them to andrew morton, and then 
> start a discussion on the changes to core kernel code that Hellweg and 
> company object to that currently prevent our inclusion.
> 
> hans
-- 
Jake Maciejewski <maciejej@msoe.edu>

