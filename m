From: Anders Widman <andewid@tnonline.net>
Subject: Re: Sleeping harddrives?
Date: Sun, 2 Jun 2002 22:56:51 +0200
Message-ID: <5231869796.20020602225651@tnonline.net>
References: <19839880843.20020602023406@tnonline.net>
 <20020602214927.A17000@namesys.com>
Reply-To: reiserfs-list@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10482-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020602214927.A17000@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> Hello!

> On Sun, Jun 02, 2002 at 02:34:06AM +0200, Anders Widman wrote:

>>    How  would  ReiserFS  react  when  a user/program/anything tries to
>>    access a file on a harddrive that is spin down?

> Linux IDE/SCSI layer issupposed to spind the drive up.

It  is  supposed  to,  yes.  When I tried this before, it did spin the
drives up, but didn't wait enough before trying to access it, so I got
strange errors.

My question is simple. Is this something that still occur today?

>>    I  remember that I tested this about a year ago, and it didn't work
>>    very well. The filesystem timeout was shorter than the time to spin
>>    up the drive.

> Huh? What filesystem timeout?

Well, it might not even be the filesystem.


//Anders

> Bye,
>     Oleg

