From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: Problem - reiser4(2004.08.13), apache(2.0.50) and "AllowOverride All"
Date: Wed, 25 Aug 2004 19:54:10 +0400
Message-ID: <16684.46626.197582.409595@gargle.gargle.HOWL>
References: <412B71F6.6020603@zappa.cx>
	<1093373015.9503.3.camel@leto.cs.pocnet.net>
	<20040825074246.GO5154@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20503-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040825074246.GO5154@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Zarochentsev <zam@namesys.com>
Cc: Christophe Saout <christophe@saout.de>, Andreas Sundstrom <sunkan@zappa.cx>, reiserfs-list@namesys.com

Alex Zarochentsev writes:
 > On Tue, Aug 24, 2004 at 08:43:35PM +0200, Christophe Saout wrote:
 > > Am Dienstag, den 24.08.2004, 18:51 +0200 schrieb Andreas Sundstrom:
 > > 
 > > > If I enable "AllowOverride All" in apache it can no longer serve files
 > > > from reiser4 filesystems.
 > > > 
 > > > Here's an error from apache:
 > > > 
 > > > (13)Permission denied: /var/www/htdocs/valid-xhtml11.png/.htaccess pcfg_openfile: unable to check htaccess file, ensure it is 
 > > > readable, referer: http://zappa.cx/
 > > 
 > > Well, this as a ENOTDIR vs. EPERM problem.
 > > 
 > > Apache2 expects the filesystem to return ENOTDIR when it tries to access
 > > some_file/.htaccess. reiser4 returns EPERM and apache2 thinks that
 > > some_file is actually a directory but doesn't have permissions to access
 > > that directory.
 > 
 > yes. exactly.  It is strange that reiser4 passes -ENOTDIR to upper levels
 > in that case. 

Actual problem is that open(path, O_DIRECTORY) always succeeds in
reiser4, see fs/namei.c:

		if (lookup_flags & LOOKUP_DIRECTORY) {
			err = -ENOTDIR; 
			if (!inode->i_op || !inode->i_op->lookup)
				break;
		}

so all applications using this flag to check whether file is directory
or not are bound to fail.

In this case, apache calls

    open("/var/www/htdocs/valid-xhtml11.png", O_DIRECTORY)

it returns without error, so apache thinks that valid-xhtml11.png is a
directory and proceeds with accessing .htaccess file in it.

 > 
 > -- 
 > Alex.

Nikita.
