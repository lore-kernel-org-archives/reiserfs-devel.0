From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Errors vs-500
Date: Mon, 29 Mar 2004 16:26:36 +0400
Message-ID: <1080563196.16245.26.camel@tribesman.namesys.com>
References: <200403291244.14157.michael@corp.mercuryin.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17558-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403291244.14157.michael@corp.mercuryin.es>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Schwietering <michael@corp.mercuryin.es>
Cc: reiserfs-list@namesys.com

Hello

On Mon, 2004-03-29 at 14:44, Michael Schwietering wrote:
> Hi!
> 
> I get a bunch of this errors on a reiserfs
> on a scsi disk.
> vs-500: unknown uniqueness 1048576
> vs-500: unknown uniqueness 1048576
> vs-500: unknown uniqueness 1048576
> 
> And I cannot delete some dirs and some give permission denied to root (it's 
> all in the mail-spool).
> I don't know how to debug the thing. Is there anything I should/can do?
> 
You should reiserfsck that filesystem

> Bye, Michael
> 
> 

