From: Edward Shishkin <edward@namesys.com>
Subject: Re: Reiser4 compression under linux
Date: Thu, 15 Dec 2005 01:31:27 +0300
Message-ID: <43A09D3F.5090107@namesys.com>
References: <439A1D63.5080003@honsch.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27302-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <439A1D63.5080003@honsch.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: R <com@honsch.com>
Cc: reiserfs-list@namesys.com

R wrote:

> I know that trying to get into the linux kernel has been an uphill 
> battle thus far.  But I wonder if there is perhaps a way (other than 
> waiting for the kernel hackers to acquiesce) to get Reiser4 setup with 
> the compression plug-in under linux.
>

Hello,
currently it looks pretty stable, except some problems with responding to
memory pressure when mapped write of large files. Hope we will resolve this
quickly. Wait for beta-release.

Thanks,
Edward.

> Patches perhaps?
>
> Thank you in advance!
>
> Sincerely,
>
> Roland
>
>

