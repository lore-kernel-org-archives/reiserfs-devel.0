From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Disk placement options
Date: Thu, 07 Oct 2004 14:19:33 +0400
Message-ID: <1097144372.1367.13.camel@tribesman.namesys.com>
References: <e96ff1200410062230890dccc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22013-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e96ff1200410062230890dccc@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ash <ashrat@gmail.com>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2004-10-07 at 09:30, Ash wrote:
> Hi
> 
> Does ReiserFS V3 provide any control for the placement of files on
> disk; something like policy modules for disk placement ?  clustering
> of files for example ?
> 

No. The only thing to control file placement is hash selection. But it
is rather about ordering names in a directory.

> Thanks,
> Ash
> 

