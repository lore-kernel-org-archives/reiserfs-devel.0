From: Chris Wright <chrisw@sous-sol.org>
Subject: Re: 2.6.15 Bug? New security model?
Date: Wed, 8 Feb 2006 14:11:24 -0800
Message-ID: <20060208221124.GN30803@sorel.sous-sol.org>
References: <200602080212.27896.bernd-schubert@gmx.de> <200602081314.59639.bernd-schubert@gmx.de> <20060208205033.GB22771@shell0.pdx.osdl.net> <200602082246.15613.bernd-schubert@gmx.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28052-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200602082246.15613.bernd-schubert@gmx.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernd Schubert <bernd-schubert@gmx.de>
Cc: Chris Wright <chrisw@sous-sol.org>, John M Flinchbaugh <john@hjsoft.com>, reiserfs-list@namesys.com, Sam Vilain <sam@vilain.net>, linux-kernel@vger.kernel.org

* Bernd Schubert (bernd-schubert@gmx.de) wrote:
> Er, you mean /proc/fs/reiserfs/{partition}/on-disk-super?

Yup.

> bernd@bathl ~>grep attrs_cleared /proc/fs/reiserfs/hda6/on-disk-super
> flags:  1[attrs_cleared]

> > 2) does mount -o attrs ... make a difference?
> 
> Yes, 2.6.13 now makes the same trouble. No difference with 2.6.15.3. 
> I played with mount -o noattrs, this makes no difference with 2.6.13, but has 
> some effects to 2.6.15.3. Creating files in /var/run is possible again, 
> lsattr gives "lsattr: Inappropriate ioctl for device While reading flags 
> on /var/run", but deleting files in /var/run is still impossible (still 
> rather bad for the init-scripts).

Yes, that's what I thought.  There's still some backward logic in there.
noattrs vs. attrs triggers whether the code path that's patched in
2.6.15.3 is taken.  I'll dig a bit more, but hopefully the reiserfs folks 
can fix this for us.

thanks,
-chris
