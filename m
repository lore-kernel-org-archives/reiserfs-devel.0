From: "Bostjan Skufca (at) domenca.si" <bostjan.skufca@domenca.si>
Subject: Re: quota support
Date: Wed, 10 Dec 2003 15:03:39 +0100
Message-ID: <200312101503.39050.bostjan.skufca@domenca.si>
References: <1070553889.27611.147.camel@tiny.suse.com> <200312091214.13325.bostjan.skufca@domenca.si> <200312091759.59923.bernd-schubert@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16318-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200312091759.59923.bernd-schubert@web.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello Bernd,

i've been asking the same questions and got myself an answer: RTFF (the last F 
stands for FAQ on namesys' webpage)

FAQ should answer your 1 and 2.2 questions. As for the 2.1 i think everyone at 
Namesys is concerned about Reiser4 and Linux 2.6.0 - thus patches for 2.4.xx 
are no longer amongst their top priorities. They do not bother hosting it on 
their ftp because are hosted on suse's and FAQ clearly directs it's readers 
to correct ftp site. 
Besides all that we should thank Chris for his patience and good will which, I 
believe, brings us THE patches.

Regards,
Bostjan


On Tuesday 09 of December 2003 17:59, Bernd Schubert wrote:
> On Tuesday 09 December 2003 12:14, Bostjan Skufca (at) domenca.si wrote:
> > Hello,
> >
> > Below you will find patches for kernels 2.4.20-23
> > ftp://ftp.suse.com/pub/people/mason/patches/data-logging/
>
> Hello Bostjan,
>
> yeah I know about those patches, but actually I want to know about general
> quota support status:
>
> 1.)  So is there vanilla-kernel quota support for reiserfs since 2.4.21?
>
> 2.1.)If not, why are there no quota patches on ftp.namesys.com for
> 2.4.{21-23}?
>
> 2.2) If there is quota support for these versions, what does the patch from
> Chris improve?
>
> Thanks,
> 	Bernd

