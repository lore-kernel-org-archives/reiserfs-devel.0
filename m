From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiserfs using too much space on my HD
Date: Thu, 27 Oct 2005 14:02:12 +0400
Message-ID: <4360A5A4.6030809@namesys.com>
References: <f18a8d980510261002w303b4180le69b63667cee31ce@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26682-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <f18a8d980510261002w303b4180le69b63667cee31ce@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bedros Hanounik <2bedros@gmail.com>
Cc: reiserfs-list@namesys.com

Hello

Bedros Hanounik wrote:
> Hi,
> 
> I've been using reiserfs for several years now and it's been choice
> number one for me; I'll probably switch to reiser4 once it's in the main
> kernel.
> 
> on my home file server machine, one hard drive (120GB) reports 80 GB
> used, but I have no idea how and where it's used.
> 
> df -h reports 80GB used
> 

what does du -s / report?

> but when I run kdirstat, I get about 10GB used for directory /.
> 
> I ran fsck.reiserfs from liveCD and it reported no errors.
> 

is it reiserfsck 3.6.19?
Please send output of reiserfsck 3.6.19.

> is there any better way to tell what's eating up my hard drive?
> 
> Regards,
> 
> -Bedros
> 
> 

