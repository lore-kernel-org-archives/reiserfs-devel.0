From: Fred Schaettgen <namesys.sch@ttgen.net>
Subject: Re: Recursive mtime implementation questions
Date: Thu, 13 Jan 2005 16:18:02 +0100
Message-ID: <200501131618.02318.namesys.sch@ttgen.net>
References: <200501111307.56368.namesys.sch@ttgen.net> <200501111854.49379.namesys.sch@ttgen.net> <41E67487.2030003@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23135-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41E67487.2030003@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward@namesys.com>
Cc: reiserfs-list@namesys.com

On Thursday 13 January 2005 14:15, you wrote:
> Fred Schaettgen wrote:
...
..
> >>There is a union (file_plugin_data) in struct reiser4_inode to keep
> >>features specific
> >>for file plugins.
> >
> >I can't use that union, since my plugin would call the methods of the
> > original file plugin of a file,
>
> Let's first specify the notification interface. Should it be kernel
> messages, or
> should the fs write something to /proc? (I don't have ideas)

Actually I didn't think about active notification at all. The idea is to set 
an timestamp for each monitored file, which is reset for the file itself and 
the whole path(s) upwards when the file is changed.
A userspace program which manages an index will find the newly changed files 
by looking at that timestamp in some base directory and descending into each 
subdirectory for which this timestamp is more recent than a saved timestamp 
or if the timestamp isn't set at all. On the way back, the missing timestamps 
will be updated.
So it's by design a single-shot "notification" and you would have to poll a 
single file to be able to update your stored data continously. This should be 
adequate for applications which index large parts of the file system. For 
other needs, inotify will be the better solution.

The pseudo-file interface could look like this:
file/..../watch/m_timestamp [r]
dir/..../watch/m_watch_file [w] 

m_timestamp is set for a file, when its name is written into the 
m_watch_file-attribute of one of it's parent directories.
This will also add a link to the file back to the directory, so that when the 
file is changed, the timestamp of both the file and the directory (and so on) 
are reset.
That's quite expensive, but it will happen only once per file, until the 
timestamp for a file was set again by a crawler. 

> >so file_plugin_data is occupied already. I'm not sure
> >if adding another field outside that union would make reiser4 perform any
> >worse, but I was just hoping that this plugin can be implemented without
> > any overhead at all as long as it is not used. A new feature is much more
> > easily accepted if it doesn't affect you if you don't use it.
>
> This is why you need a new object plugin with its own methods.

Ok, so creating a new file type called "watched_file" seems really the right 
way. 
This still leaves the problem where to save per-inode data for this plugin 
without having to increase the size of a reiser4_inode in general. I don't 
care much, so before anyone else complains, I'll stop thinking about it ;)

regards
Fred

-- 
Fred Schaettgen
sch@ttgen.net
