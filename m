From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: BUG IN REISERFS
Date: Fri, 30 Jun 2006 17:36:25 +0400
Message-ID: <1151674585.6499.56.camel@tribesman.namesys.com>
References: <4EEB5A4713E61F49A759A504BECCBC0A028D1CCB@bgeexc01.asiapacific.cpqcorp.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28876-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4EEB5A4713E61F49A759A504BECCBC0A028D1CCB@bgeexc01.asiapacific.cpqcorp.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Masthan, Dudekula (STSD)" <dudekula.masthan@hp.com>
Cc: reiserfs-list@namesys.com

hello

On Fri, 2006-06-30 at 17:51 +0530, Masthan, Dudekula (STSD) wrote:
>  
> Hi Folks,
> 
> Mkreiserfs command is failing by showing " There are no enoguh blocks on
> this device" , What is the minimum size of a disk to create reiserfs
> file system
> 

Please let us see whole mkreiserfs output and the command line itself.

In case of standard journal minimal reiserfs size is 8212 blocks.

> Regards,
> Masthan
> 
> 

