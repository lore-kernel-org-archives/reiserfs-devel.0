From: Fred Schaettgen <namesys.sch@ttgen.net>
Subject: Re: Recursive mtime implementation questions
Date: Tue, 11 Jan 2005 18:54:49 +0100
Message-ID: <200501111854.49379.namesys.sch@ttgen.net>
References: <200501111307.56368.namesys.sch@ttgen.net> <41E3E58D.5060503@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23115-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41E3E58D.5060503@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Tuesday 11 January 2005 15:41, Edward Shishkin wrote:
> Fred Schaettgen wrote:
> >I'm trying to get started with my idea of recursive mtimes, which where
> >discussed a few days ago, but I'm stuck a little. Maybe someone with some
> >more knowlege about reiser4 could give me some hints?
> >
> >The idea was to register each file for change monitoring and reset a
> > special mtime-attribute for the file and all parent directories
> > (recursively) if the watched file changes. Before this will happen the
> > next time, a userspace program has to reenable mtime for each of these
> > files again.
>
> Are you sure you need kernel support of such monitoring?

I'm never sure, but all I know is dnotify and inotify and I don't see how I 
can reliably find changed files all over my complete harddisk with it. With 
[d|i]notify there are lots of chances where I can miss a change, be it before 
the startup of the deaemon that would be necessary, be it because the system 
is under haeay load and the change buffer runs over. And when this happens, 
all that can be done is to walk the whole file system again.
Maybe I missed another way how to do it. Do you know one?

VxFS and even NTFS seem to have file change logs to support userspace indexers 
etc. The file change log approach might be more efficient, but the recursive 
mtimes look like a simpler interface to userspace to me, with less 
security/quota related things to consider, so this feature could be easily 
accessible to any user who wishes to use it.

..
> Note that reiser4 stat-data can not occupy more then one node on leaf level

So what is the recommended way to attach some smaller piece of data to a file? 
If I write that data into a separate file or something, how do I associate 
that with the file it belongs to? By putting a key into the stat data?

> > Or put it in a file and
> >link to it from the stat data? Or is there another efficient way in
> > reiser4 to the all the parent directories?
> >It would also help to know how ACLs will be stored on disk by reiser4.
> > Does reiser4 implement some sort of ACLs at all? If yes, where in the
> > code is that?
> >
> >-- I have to monitor the file for changes.
> >The only solution I could think of was to create a new file plugin
> >(watched_file), which wraps another file plugin and delegates all method
> >calls to that plugin. Now where do it store the pointer to the wrapped
> > file plugin in memory?
..
> >If I add a new field to the reiser4_inode struct, this
> >would mean that every reiser4_inode grows in size, even if it is not the
> >inode of a watched file.
>
> There is a union (file_plugin_data) in struct reiser4_inode to keep
> features specific
> for file plugins.

I can't use that union, since my plugin would call the methods of the original 
file plugin of a file, so file_plugin_data is occupied already. I'm not sure 
if adding another field outside that union would make reiser4 perform any 
worse, but I was just hoping that this plugin can be implemented without any 
overhead at all as long as it is not used. A new feature is much more easily 
accepted if it doesn't affect you if you don't use it.

> >In http://www.namesys.com/v4/v4.html#audit, there are some lines about an
> >auditing plugin, which is not yet written. How will this work? With a
> >file-plugin wrapper too or as another plugin type?
>
> The idea is that such files should be written by chaining cipher modes
> so when we
> read the file, the appropriate plugin should check its integrity. This
> should be useful
> for various (system) logfiles, but imho it is not the same that the
> monitoring you want.

But maybe it can use the same interface as such a audit plugin. Such an audit 
plugin would have to intercept reads and writes etc. This seems to be just 
what I need. I only wonder what kind of plugin this would be - a file plugin, 
security plugin or a new type of plugin?
The file plugin wrapper-approach might work, but it is ugly to change the file 
plugin, just to be informed of changes. And I'm also not sure if this can't 
interfere with anything, like code that expects a file to be a unix_file.
Btw. if the audit plugin has to keep it's own state in memory for each file, 
where would that data go?

> > Is there some code for
> >that in the meantime?
>
> Nop, only comments ;)

Any comments are welcome ;)

regards
Fred

-- 
Fred Schaettgen
sch@ttgen.net
