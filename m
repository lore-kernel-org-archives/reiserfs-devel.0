From: Oleg Drokin <green@namesys.com>
Subject: Re: Write-once file system
Date: Fri, 27 Jun 2003 21:43:53 +0400
Message-ID: <20030627174353.GB14469@namesys.com>
References: <12C7D768CC8ED4118A9200508BEEC6FB033776CD@zanexch.zantaz.com> <20030627112720.F7414@schatzie.adilger.int>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14753-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030627112720.F7414@schatzie.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fong Vang <FVang@Zantaz.com>, 'Hans Reiser' <reiser@namesys.com>, "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

Hello!

On Fri, Jun 27, 2003 at 11:27:22AM -0600, 'Andreas Dilger' wrote:

> > this doesn't seem to work on kernel 2.4.20.  I did a chattr +i on file but
> > rm -rf (as root) on the file deletes it.
> That is a reiserfs bug then...  I just tested it with ext3 and it worked as
> expected.

No, it is documented reiserfs feature. You must enable extended attributes 
support at mount time.

Bye,
    Oleg
