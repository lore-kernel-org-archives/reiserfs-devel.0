From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: recovering deleted files from a dd image
Date: Thu, 27 Oct 2005 12:04:37 +0400
Message-ID: <43608A15.5000701@namesys.com>
References: <200510271739.51334.Michael.James@csiro.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26679-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200510271739.51334.Michael.James@csiro.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael James <Michael.James@csiro.au>
Cc: reiserfs-list@namesys.com

Hello

Michael James wrote:
> What tools or options are there for recovering files,
>  deleted and current from a dd partition image?
> 

Please describe the problem in more details.
Am I correct that you mistakenly rm-ed something from a filesystem and then
umounted it and dd-ed it into dd-file-image and would like to know whether there
is a way to recover mistakenly removed files?

> ls -l  dd-file-image
> -rw-r--r--  1 root   root 11745699840 2005-10-27 16:46
> 		 dd-file-image
> 
> It was a SuSE 9.0 system running on reiser 3.6
> 
> /mnt/sbin/mkfs.reiserfs -V
> mkfs.reiserfs 3.6.9 (2003 www.namesys.com)
> 
> michaelj
> 

