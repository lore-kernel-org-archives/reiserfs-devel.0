From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Problem - reiser4(2004.08.13), apache(2.0.50) and "AllowOverride All"
Date: Wed, 25 Aug 2004 11:42:47 +0400
Message-ID: <20040825074246.GO5154@backtop.namesys.com>
References: <412B71F6.6020603@zappa.cx> <1093373015.9503.3.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20495-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1093373015.9503.3.camel@leto.cs.pocnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Saout <christophe@saout.de>
Cc: Andreas Sundstrom <sunkan@zappa.cx>, reiserfs-list@namesys.com

On Tue, Aug 24, 2004 at 08:43:35PM +0200, Christophe Saout wrote:
> Am Dienstag, den 24.08.2004, 18:51 +0200 schrieb Andreas Sundstrom:
> 
> > If I enable "AllowOverride All" in apache it can no longer serve files
> > from reiser4 filesystems.
> > 
> > Here's an error from apache:
> > 
> > (13)Permission denied: /var/www/htdocs/valid-xhtml11.png/.htaccess pcfg_openfile: unable to check htaccess file, ensure it is 
> > readable, referer: http://zappa.cx/
> 
> Well, this as a ENOTDIR vs. EPERM problem.
> 
> Apache2 expects the filesystem to return ENOTDIR when it tries to access
> some_file/.htaccess. reiser4 returns EPERM and apache2 thinks that
> some_file is actually a directory but doesn't have permissions to access
> that directory.

yes. exactly.  It is strange that reiser4 passes -ENOTDIR to upper levels
in that case. 

-- 
Alex.
