From: Oleg Drokin <green@namesys.com>
Subject: Re: Reiserfs labels/uuid in 2.5.X
Date: Thu, 16 May 2002 09:51:44 +0400
Message-ID: <20020516095144.A7116@namesys.com>
References: <3CE34780.603@attbi.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10322-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <3CE34780.603@attbi.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jordan Breeding <jordan.breeding@attbi.com>
Cc: reiserfs-list@namesys.com, adilger@turbolabs.com

Hello!

On Thu, May 16, 2002 at 12:45:36AM -0500, Jordan Breeding wrote:

>   I noticed that reiserfstune can now generate uuids and place labels 
> in the superblock.  When will the reiserfs code in 2.5.X be able to use 
> those fields to do things like `mount -L "/usr" /usr`?  Right now that 

AFAIK, this have nothing to do with kernel at all.
Label decoding is done by mount itself.
Andreas Dilger can shed moer light on this topic,

> command simply states that it can not find a suitable partition.  Thanks 
> for any information.

Perhaps your mount is not recent enough (or support for reiserfs was not coded
yet).

Bye,
    Oleg
