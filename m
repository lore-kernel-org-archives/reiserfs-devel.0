From: Oleg Drokin <green@namesys.com>
Subject: Re: Write-once file system
Date: Fri, 27 Jun 2003 21:42:52 +0400
Message-ID: <20030627174252.GA14469@namesys.com>
References: <12C7D768CC8ED4118A9200508BEEC6FB033776CD@zanexch.zantaz.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14752-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <12C7D768CC8ED4118A9200508BEEC6FB033776CD@zanexch.zantaz.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fong Vang <FVang@Zantaz.com>
Cc: 'Andreas Dilger' <adilger@clusterfs.com>, 'Hans Reiser' <reiser@namesys.com>, "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

Hello!

On Fri, Jun 27, 2003 at 10:07:05AM -0700, Fong Vang wrote:
> this doesn't seem to work on kernel 2.4.20.  I did a chattr +i on file but
> rm -rf (as root) on the file deletes it.

You need to mount with -o attrs mount option for extended attributes to work.

Bye,
    Oleg
