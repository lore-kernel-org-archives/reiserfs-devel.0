From: Oleg Drokin <green@namesys.com>
Subject: Re: Write-once file system
Date: Fri, 27 Jun 2003 19:46:15 +0400
Message-ID: <20030627154615.GA13742@namesys.com>
References: <12C7D768CC8ED4118A9200508BEEC6FB033776C7@zanexch.zantaz.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14734-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <12C7D768CC8ED4118A9200508BEEC6FB033776C7@zanexch.zantaz.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fong Vang <FVang@Zantaz.com>
Cc: "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

Hello!

On Fri, Jun 27, 2003 at 08:43:06AM -0700, Fong Vang wrote:
> We rely heavily on reiserfs for some of our critical file systems.  I'm just
> wondering what work would be involved and how difficult it would be to add
> an option (perhaps at mount time) to reiserfs that will allow a file to be
> written only once, i.e. once a file is created it should not be allowed to
> be modified or deleted (including the inode).  We may consider paying for
> this modification.

Is the extended attributes support (man chattr) does what you want by any chance?

Bye,
    Oleg
