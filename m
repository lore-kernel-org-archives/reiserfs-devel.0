From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: EACCESS vs ENOENT for nonexistent files-within-files
Date: Mon, 13 Sep 2004 23:44:08 +0400
Message-ID: <16709.63624.953839.299199@thebsh.namesys.com>
References: <20040913140637.GB29591@redhat.com>
	<20040913161326.GB2252@backtop.namesys.com>
	<20040913185255.GA1920@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21723-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040913185255.GA1920@redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joe Orton <jorton@redhat.com>
Cc: Alex Zarochentsev <zam@namesys.com>, reiserfs-list@namesys.com

Joe Orton writes:
 > On Mon, Sep 13, 2004 at 08:13:26PM +0400, Alex Zarochentsev wrote:
 > > On Mon, Sep 13, 2004 at 03:06:37PM +0100, Joe Orton wrote:
 > > > Hi, we had a bug report that Apache httpd logs a spurious error for
 > > > every file served from a reiser4 filesystem, because httpd assumes that
 > > > /path/to/file/.htaccess (where /path/to/file is a normal file) returns
 > > > ENOENT or ENOTDIR, but reiser4 returns EACCES in this case.
 > > > 
 > > > Can someone explain the justification behind reiser4's behaviour? 
 > > > httpd's assumption does not seem unreasonable, and EACCES seems to make
 > > > little sense for this error case.
 > > 
 > > It is because open(name, O_DIRECTORY) is successful for regular files in
 > > reiser4.  Once it succedes, Apache2 thinks that is a directory and tries to
 > > open .htaccess under it.
 > 
 > I don't think that has anything to do with it.  It's a simple open()
 > without O_DIRECTORY which is failing with EACCES.  The reporter
 > confirmed this with the simplest of tests:

The only reason Apache is trying to access "regular/.htaccess" is because
previous open("regular", O_DIRECTORY) returned success.

 > 
 > $ touch newfile.txt
 > $ cat newfile.txt/.htaccess
 > cat: newfile.txt/.htaccess: Permission denied
 > 
 > this is the behaviour I'm trying to find the justification for.

If newfile.txt has no +x bit set, then justification is obvious: UNIX
requires +x bit for lookup, and EACCES is returned when trying to lookup
anything in a directory (or, in this case, a regular file) without +x
bit:

$ mkdir zzz
$ chmod a-x zzz
$ cat zzz/.htaccess
cat: zzz/.htaccess: Permission denied

This is how things worked for almost 30 years.

If you observe EACCES on the file with +x bit---this is unknown bug and
test-case is most welcome.

 > 
 > > There are two solutions:
 > > 
 > > 1) mount reiser4 partition with "nopseudo" mount option.  it makes /metas/* files
 > > unaccessible.
 > 
 > If this is broken by default, our users will continue to complain, so 
 > that doesn't really help.
 > 
 > > 2) apply the patch:
 > 
 > OK, does this mean you do consider this a bug in reiser4 which will be
 > fixed in future releases, then?
 > 
 > Regards,
 > 
 > joe

Nikita.
