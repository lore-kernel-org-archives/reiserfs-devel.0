From: Edward Shishkin <edward@namesys.com>
Subject: Re: Recursive mtime implementation questions
Date: Tue, 11 Jan 2005 17:41:17 +0300
Message-ID: <41E3E58D.5060503@namesys.com>
References: <200501111307.56368.namesys.sch@ttgen.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23113-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200501111307.56368.namesys.sch@ttgen.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Fred Schaettgen <namesys.sch@ttgen.net>
Cc: reiserfs-list@namesys.com

Fred Schaettgen wrote:

>Hi,
>
>I'm trying to get started with my idea of recursive mtimes, which where 
>discussed a few days ago, but I'm stuck a little. Maybe someone with some 
>more knowlege about reiser4 could give me some hints?
>
>The idea was to register each file for change monitoring and reset a special 
>mtime-attribute for the file and all parent directories (recursively) if the 
>watched file changes. Before this will happen the next time, a userspace 
>program has to reenable mtime for each of these files again.
>  
>

Are you sure you need kernel support of such monitoring?

>It's hard to discuss the problems and advantages of code that exists only in 
>someone's brain, so I'm trying to implement it. I'm still quite clueless 
>about the details of reiser4, but if noone else does it, I'll have no 
>choice ;)
>
>-- I have to attach a list of parent directories to each watched file, since a 
>file can be hardlinked in several directories. 
>This list is usually very short, but sometimes it might be quite long. How 
>would I store such a list? Directly in the stat data?
>

Note that reiser4 stat-data can not occupy more then one node on leaf level

> Or put it in a file and 
>link to it from the stat data? Or is there another efficient way in reiser4 
>to the all the parent directories?
>It would also help to know how ACLs will be stored on disk by reiser4. Does 
>reiser4 implement some sort of ACLs at all? If yes, where in the code is 
>that?
>
>-- I have to monitor the file for changes. 
>The only solution I could think of was to create a new file plugin 
>(watched_file), which wraps another file plugin and delegates all method 
>calls to that plugin. Now where do it store the pointer to the wrapped file 
>plugin in memory? 
>

Currently reiser4 supports static object plugins listed in plugin/object.c
so you can add your own one and get access to it by various macro 
(file_plugin_by_id, etc..
defined in plugin.h, plugin_header.h)

>If I add a new field to the reiser4_inode struct, this 
>would mean that every reiser4_inode grows in size, even if it is not the 
>inode of a watched file.
>

There is a union (file_plugin_data) in struct reiser4_inode to keep 
features specific
for file plugins.

> 
>In http://www.namesys.com/v4/v4.html#audit, there are some lines about an 
>auditing plugin, which is not yet written. How will this work? With a 
>file-plugin wrapper too or as another plugin type?
>

The idea is that such files should be written by chaining cipher modes 
so when we
read the file, the appropriate plugin should check its integrity. This 
should be useful
for various (system) logfiles, but imho it is not the same that the 
monitoring you want.

> Is there some code for 
>that in the meantime?
>  
>

Nop, only comments ;)

Edward.

>-- When a file is changed, the new mtime has to be reset recursively and 
>atomically at the same time.
>Is it possible for reiser4 to do a number of - rarley, but still - deeply 
>nested transactions?
>
>regards
>Fred
>
>  
>

