From: Toby Dickenson <tdickenson@geminidataloggers.com>
Subject: Re: Advangates (A file-based interface for mount)
Date: Fri, 11 Jul 2003 07:59:52 +0100
Message-ID: <200307110759.52384.tdickenson@geminidataloggers.com>
References: <3F078EF1.6090908@mrs.umn.edu> <3F0C89FC.8060604@mrs.umn.edu> <20030710025545.GB1160@vestdata.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14878-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030710025545.GB1160@vestdata.no>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ragnar =?iso-8859-15?q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>, reiserfs-list@namesys.com

On Thursday 10 July 2003 03:55, Ragnar Kj=F8rstad wrote:

> The last problem, which I don't see an easy solution for, is that the
> filesystem-code in the kernel dosn't do sufficient data-checking that
> it's safe to run it on user-controlled data. I'm sure that for most if
> not all filesystems it will be possible to corrupt the metadata in a way
> that will make the kernel crash or lock up - in some cases it may even
> be possible to corrupt the data in such a way that it becomes a
> security-problem? How could this be solved?

I would hope that the filesystems commonly used on removable media would tr=
y=20
to defend against this. Is this hoping too much?

=2D-=20
Toby Dickenson
http://www.geminidataloggers.com/people/tdickenson
