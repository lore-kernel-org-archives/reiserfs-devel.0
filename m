From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Quicker alternative to "find /"?
Date: Mon, 16 Aug 2004 14:29:26 +0200
Message-ID: <200408161429.27131.christian.mayrhuber@gmx.net>
References: <20040815231640.3c926886.felix.klee.reiserfs@gmx.net> <411FF929.7040405@slaphack.com> <20040816140420.11dc210c.felix.klee.reiserfs@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20323-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040816140420.11dc210c.felix.klee.reiserfs@gmx.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, "Felix E. Klee" <felix.klee.reiserfs@gmx.net>

On Monday 16 August 2004 14:04, Felix E. Klee wrote:
> On Sun, 15 Aug 2004 19:00:41 -0500 <didn't post to the list> wrote:
> > In that case, you may want to try a recursive "ls".  But for the same
> > format as "find", try using "locate" with "updatedb" on a cron job.
>
> Thanks for the hints. I did some benchmarks:
>
> find / >/tmp/find.dirtree:
>     3:44 (1st run)
>     3:47 (repeated run)
> updatedb -u --output=/tmp/updatedb.dirtree:
>     8:51
>     8:47
> ls -R / >/tmp/ls.dirtree:
>     6:16
>     6:55
>
> With less than 4 minutes find is by far the fastest of these
> methods.
>
> Why am I not using updatedb in a cron job? Because
> 1. the data is needed for a backup and thus needs to be current.
> 2. updatedb is annoying when it runs in the background and I have some
>    actual work to do (the system is not running at night, so a nightly
>    cron job is not an option).
> 3. I usually don't need locate. If I need to quickly find something
>    that's not in my home directory, then often I can find it by greping
>    the package database (Slackware).
>
> So, I guess I'll stick with find. I was hoping for a tool, though, that
> is optimized for ReiserFS.
>
> Felix
>
> PS: To contact me off list don't reply but send mail to "felix.klee" at
> the domain "inka.de". Otherwise your email to me might get automatically
> deleted!

For a backup?
If you use tar, you can list it's contents after the backup.

I use star to backup file system meta data (rights, acl's, attributes), 
because our stupid commercial backup software looses the directory rights 
(that's what you have a backup software for).
http://freshmeat.net/projects/star/

for backup:
"/usr/bin/star -c -M -z -meta artype=exustar f=meta-backup.star.gz /"

for restore:
/usr/bin/star -x -z -U -meta f=meta-backup.star.gz

You may want to try it, I doubt that it's faster than find, though.

-- 
lg, Chris

