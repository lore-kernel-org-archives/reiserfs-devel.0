From: Lee Revell <rlrevell@joe-job.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 16:35:15 -0400
Message-ID: <1093552515.5678.93.camel@krustophenia.net>
References: <Pine.LNX.4.44.0408260736080.23532-100000@chimarrao.boston.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20790-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0408260736080.23532-100000@chimarrao.boston.redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rik van Riel <riel@redhat.com>
Cc: Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Matt Mackall <mpm@selenic.com>, Nicholas Miell <nmiell@gmail.com>, Wichert Akkerman <wichert@wiggy.net>, Jeremy Allison <jra@samba.org>, Andrew Morton <akpm@osdl.org>, Spam <spam@tnonline.net>, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, flx@namesys.com, reiserfs-list@namesys.com

On Thu, 2004-08-26 at 07:42, Rik van Riel wrote:
> On Thu, 26 Aug 2004, Denis Vlasenko wrote:
> 
> > > I like cat < a > b. You can keep your progress.
> > 
> > cat <a >b does not preserve following file properties even on standard
> > UNIX filesystems: name,owner,group,permissions.
> 
> Losing permissions is one thing.  Annoying, mostly.
> 

cat <a >b does preserve permissions - the permissions of b.  I always
considered this a feature.

Lee

