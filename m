From: "Bostjan Skufca (at) domenca.si" <bostjan.skufca@domenca.si>
Subject: Re: quota support
Date: Tue, 9 Dec 2003 12:14:13 +0100
Message-ID: <200312091214.13325.bostjan.skufca@domenca.si>
References: <1070553889.27611.147.camel@tiny.suse.com> <200312081524.45112.bernd-schubert@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16296-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200312081524.45112.bernd-schubert@web.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

Below you will find patches for kernels 2.4.20-23
ftp://ftp.suse.com/pub/people/mason/patches/data-logging/

I have already sent a post about kernel not compilig with quota patches 
applied if you dont' have modules enabled...

Regards,
Bostjan

On Monday 08 of December 2003 15:24, Bernd Schubert wrote:
> On Thursday 04 December 2003 17:04, Chris Mason wrote:
> > Hello everyone,
> >
> > ftp.suse.com/pub/people/mason/patches/data-logging/2.4.23
> >
> > Will have a new version of the data logging and quota code as soon as
> > the suse mirror system copies it over.
>
> Hello,
>
> 'official' Namesys quota-patches are only available up to 2.4.20 and
> actually I thought that a new quota layer has been integrated in 2.4.21 and
> that quota for reiserfs is naturally supported since that version.
> However when I briefly looked through the quota-patch, it seems it adds
> basic quota stuff to the reiserfs-code.
>
> Please, can someone here enlight me about current quota+reiserfs status?
>
>
> Thanks,
> 	Bernd
>
> PS: We are currently not using quota on reiserfs, but will need to use it
> within the next 6 weeks.


