From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Hard errors, trying to recover
Date: Wed, 30 Jun 2004 18:02:05 +0400
Message-ID: <200406301802.05840.vitaly@namesys.com>
References: <20040629193943.GA15481@p15104972.pureserver.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19458-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040629193943.GA15481@p15104972.pureserver.info>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kristian Koehntopp <kris@xn--khntopp-90a.de>, reiserfs-list@namesys.com

Hello,

On Tuesday 29 June 2004 23:39, Kristian Koehntopp wrote:
> I have a 160 GB disk that has at least one hard read-error.
>
> I tried reiserfsck'ing that disk, in order to salvage data on that disk by
> copying it to a safe location one last time. Unfortunately, reiserfsck
> --rebuild-tree runs into that read-error and stops, lecturing me on disk
> quality (I knew that!). Now I cannot even mount that disk, because
> reiserfsck zeroed root block 0 during the rebuild-tree.
>
> I am at the moment dd'ing that disk with conv=noerrors, hoping that I will
> get an image (which will be truncated by 4 GB, because my scratch disk is
> somewhat smaller than the source disk). I tried to reiserfsck
> --rebuild-tree the partial image, but I reiserfsck breaks down, because it
> is unable to read the last block of the images (it is a partial image).
>
> What can I do to salvage the data on my broken disk?

we deal with hardware problems only under www.namesys.com/support.html terms.

-- 
Thanks,
Vitaly Fertman

