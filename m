From: Redeeman <redeeman@metanurb.dk>
Subject: Re: I've done a very bad mistake
Date: Thu, 01 Jul 2004 19:33:39 +0200
Message-ID: <1088703219.15328.6.camel@localhost>
References: <200407011523.48481.aotto1968@onlinehome.de>
Reply-To: redeeman@metanurb.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19483-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407011523.48481.aotto1968@onlinehome.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs Mailinglist <reiserfs-list@namesys.com>

afaik, this only overwrites the device node. recreate it, and you should
be fine

On Thu, 2004-07-01 at 15:23 +0200, Andreas Otto wrote:
> Hi,
> 
>   I've done as root: 
>    >> cp some_file /dev/hdb7
> 
>   /dev/hdb7 is "was :-(" a reiserfs partition.
> 
>   Question?
> 
>   I need a tool with partition as input (dev/hdb7) and all not damaged files
>   as output
> 
>   for me it is very important to get a solution ... help welcome :-)
> 
> 
> mfg
> 
>   aotto
> 
> 
-- 
Redeeman <redeeman@metanurb.dk>

