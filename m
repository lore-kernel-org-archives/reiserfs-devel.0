From: Yury Umanets <umka@namesys.com>
Subject: Re: libaal documentation: fact or fiction?
Date: Wed, 08 Oct 2003 10:52:20 +0400
Message-ID: <3F83B424.90107@namesys.com>
References: <3F82F657.8040605@mbl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15807-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F82F657.8040605@mbl.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: g@mbl.ca
Cc: reiserfs-list@namesys.com

Geoff Oakham wrote:

> Hello, 

Hello Geoff,

>
>
> I'm interested in documenting libaal for reiserfs4.  Is anyone 
> currently working on documenting the public API?  If not, I'd like to 
> take a stab at it.
>
> If someone could direct me to any existing documentation and/or test 
> cases and/or sample code and/or images of napkins used by the author.. 
> I would be most greatful.
>
> Thanks in advance,
>
> Geoff
>
>
>
>
>
First of all thanks for proposal.

Libaal has been developed as a try of standard interface between 
corresponding FS userspace library (currently libreiser4) and 
application that wants to use that library (currently reiser4progs).

Predecessor of libaal (mostly device abstraction) is used in libreiserfs 
(progsreiserfs package), parted, etc. And it showed, that it good to 
have an abstraction interface like it is.

And we have plans to use libaal for other filesystems too. For instance 
for ntfs (ntfstools project). So, we definitely  interested in 
documenting libaal. But unfortunatelly it is not documented yet. And if 
you want to help us, I don't see any barriers.

Take a look into soure first. Probably you'll propose something we have 
missed it, but useful for users. Ask questions, we will answer them.

BTW, why do you interested in documenting it?

-- 
umka


