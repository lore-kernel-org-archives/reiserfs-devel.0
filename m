From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: EACCESS vs ENOENT for nonexistent files-within-files
Date: Tue, 14 Sep 2004 00:58:13 +0400
Message-ID: <20040913205812.GD2252@backtop.namesys.com>
References: <20040913140637.GB29591@redhat.com> <20040913161326.GB2252@backtop.namesys.com> <20040913185255.GA1920@redhat.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21724-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040913185255.GA1920@redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Orton <jorton@redhat.com>
Cc: reiserfs-list@namesys.com

On Mon, Sep 13, 2004 at 07:52:55PM +0100, Joe Orton wrote:
> On Mon, Sep 13, 2004 at 08:13:26PM +0400, Alex Zarochentsev wrote:
> > On Mon, Sep 13, 2004 at 03:06:37PM +0100, Joe Orton wrote:
> > > Hi, we had a bug report that Apache httpd logs a spurious error for
> > > every file served from a reiser4 filesystem, because httpd assumes that
> > > /path/to/file/.htaccess (where /path/to/file is a normal file) returns
> > > ENOENT or ENOTDIR, but reiser4 returns EACCES in this case.

what does the user get in the browser? 

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
> 
> $ touch newfile.txt
> $ cat newfile.txt/.htaccess
> cat: newfile.txt/.htaccess: Permission denied

But what is the reason why apache2 looks at <regular file>/.htaccess ?

can you ask the user to add execute permitions (just for test) to the file
and see would apache2 work with the file.


> this is the behaviour I'm trying to find the justification for.
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

it requires Linux VFS changes, the changes are being discussed
in LKML still.

> 
> Regards,
> 
> joe

-- 
Alex.
