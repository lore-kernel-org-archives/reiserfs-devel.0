From: Fred Schaettgen <namesys.sch@ttgen.net>
Subject: Recursive mtime implementation questions
Date: Tue, 11 Jan 2005 13:07:56 +0100
Message-ID: <200501111307.56368.namesys.sch@ttgen.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23110-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I'm trying to get started with my idea of recursive mtimes, which where 
discussed a few days ago, but I'm stuck a little. Maybe someone with some 
more knowlege about reiser4 could give me some hints?

The idea was to register each file for change monitoring and reset a special 
mtime-attribute for the file and all parent directories (recursively) if the 
watched file changes. Before this will happen the next time, a userspace 
program has to reenable mtime for each of these files again.

It's hard to discuss the problems and advantages of code that exists only in 
someone's brain, so I'm trying to implement it. I'm still quite clueless 
about the details of reiser4, but if noone else does it, I'll have no 
choice ;)

-- I have to attach a list of parent directories to each watched file, since a 
file can be hardlinked in several directories. 
This list is usually very short, but sometimes it might be quite long. How 
would I store such a list? Directly in the stat data? Or put it in a file and 
link to it from the stat data? Or is there another efficient way in reiser4 
to the all the parent directories?
It would also help to know how ACLs will be stored on disk by reiser4. Does 
reiser4 implement some sort of ACLs at all? If yes, where in the code is 
that?

-- I have to monitor the file for changes. 
The only solution I could think of was to create a new file plugin 
(watched_file), which wraps another file plugin and delegates all method 
calls to that plugin. Now where do it store the pointer to the wrapped file 
plugin in memory? If I add a new field to the reiser4_inode struct, this 
would mean that every reiser4_inode grows in size, even if it is not the 
inode of a watched file. 
In http://www.namesys.com/v4/v4.html#audit, there are some lines about an 
auditing plugin, which is not yet written. How will this work? With a 
file-plugin wrapper too or as another plugin type? Is there some code for 
that in the meantime?

-- When a file is changed, the new mtime has to be reset recursively and 
atomically at the same time.
Is it possible for reiser4 to do a number of - rarley, but still - deeply 
nested transactions?

regards
Fred

-- 
Fred Schaettgen
sch@ttgen.net
