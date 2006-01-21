From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Small magic files
Date: Fri, 20 Jan 2006 18:45:05 -0700
Message-ID: <1137807905.6573.175.camel@tribesman.namesys.com>
References: <dprvuk$l4l$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27812-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <dprvuk$l4l$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: JEMF <jemf@gabcmt.eb.mil.br>
Cc: reiserfs-list@namesys.com

Hello

On Sun, 2006-01-08 at 19:24 -0200, JEMF wrote:
> Hello,
> 
> How the ReiserFS store the small files? Why the small files uses little
> space on ReiserFS? 

This is because reiserfs can store data of more than one file in one
block.

> The B Tree uses blocks with various sizes?
> 
No, reiserfs tree is built of nodes of the same size.

> Thanks!
> 
> 

