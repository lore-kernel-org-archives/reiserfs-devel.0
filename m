From: Edward Shishkin <edward@namesys.com>
Subject: Re: how do plugins work?
Date: Thu, 24 Oct 2002 19:24:05 +0400
Sender: edward
Message-ID: <3DB81095.25F0C662@namesys.com>
References: <Pine.LNX.4.33.0210241624300.2792-100000@mitte.informatik.hu-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11755-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: gregor@zeitlinger.de
Cc: reiserfs mailing list <reiserfs-list@namesys.com>

Gregor Zeitlinger wrote:
> 
> Hi,
> 
> I'm new to this list. I'm wondering how the file plugins work. Are they
> just a means of accessing the file contents or are they also designed to
> save the file differently.
> 
> For example, could you create a plugin that automatically zips each
> text/plain file, which is totally transparent to the user?

Yeah, we could. Although transparentness means a bit worse compression..
Edward.  

> If so, can those plugins be hirachical. Like: when I save a .tex file its
> automatically zipped and encrypted before writtten to disk.

It means this file is controlled by primary plugin of compressed object,
and there is installed subordinate compression plugin in its stat-data,
which provides zip-compression.  
Edward.


> Or even better: When I save a file, its automatically zipped, encrypted
> and written over a ssh or ftp connection.
> 
> More precisely, I'm thinking about a plugin that stores xml files in an
> efficient manner. Somewhat like a btree. I'm not sure wheater you've
> already been through this issue, but I didn't find anything in the
> archives. The issue is somewhat difficult, because I'd love to be able to
> use xpath (possibly dom or xquery) to retreive/update xml data
> EFFICIENTY.
> 
> I've gotten some ideas from a university project I'm working on. There
> we're trying to do a whole xml database management system. Although
> progress is terribly slow there are some good algos that might be
> reusable.
> 
> --
> Gregor Zeitlinger
> gregor@zeitlinger.de
