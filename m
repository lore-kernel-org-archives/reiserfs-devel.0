From: Oleg Drokin <green@namesys.com>
Subject: Re: Sleeping harddrives?
Date: Sun, 2 Jun 2002 21:49:27 +0400
Message-ID: <20020602214927.A17000@namesys.com>
References: <19839880843.20020602023406@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10479-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <19839880843.20020602023406@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello!

On Sun, Jun 02, 2002 at 02:34:06AM +0200, Anders Widman wrote:

>    How  would  ReiserFS  react  when  a user/program/anything tries to
>    access a file on a harddrive that is spin down?

Linux IDE/SCSI layer issupposed to spind the drive up.

>    I  remember that I tested this about a year ago, and it didn't work
>    very well. The filesystem timeout was shorter than the time to spin
>    up the drive.

Huh? What filesystem timeout?

Bye,
    Oleg
