From: Bernd Schubert <bernd-schubert@gmx.de>
Subject: Re: 2.6.15 Bug? New security model?
Date: Mon, 13 Feb 2006 00:10:40 +0100
Message-ID: <200602130010.41027.bernd-schubert@gmx.de>
References: <200602080212.27896.bernd-schubert@gmx.de> <20060212005541.107f7011.vsu@altlinux.ru> <20060212175740.GB8805@locomotive.unixthugs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751067AbWBLXKs@vger.kernel.org>
In-Reply-To: <20060212175740.GB8805@locomotive.unixthugs.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Sergey Vlasov <vsu@altlinux.ru>, Chris Wright <chrisw@sous-sol.org>, John M Flinchbaugh <john@hjsoft.com>, reiserfs-list@namesys.com, Sam Vilain <sam@vilain.net>, linux-kernel@vger.kernel.org

> This is essentially code-introduced corruption. The patch to fix it in
> future versions is easy enough, but you'll need to run reiserfsck
> --clean-attributes <device> on any affected file systems.
>
> Bernd - If you haven't already run reiserfsck --clean-attributes on the fs,
> can you please test the attached patch? It adds a check to make sure the
> file system has always been v3.6 before enabling the attributes by default.

With attrs defaulting to on I don't think 'reiserfsck --clean-attributes' can 
be the solution. There are just too many filesystems that are affected. So 
for now I also won't clean up the attributes ;)
Since Sergey already proved that directories always have the old format, I 
didn't test your patch, but tried Sergeys patch.

Thanks for all of your help,
	Bernd

