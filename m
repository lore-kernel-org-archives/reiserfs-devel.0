From: Russell Coker <bofh@coker.com.au>
Subject: Re: Fwd: Re: [reiserfs-list] Reiserfs with Samba vs  NetApp Filer
Date: Sat, 12 Oct 2002 15:53:23 +0200
Message-ID: <200210121553.23053.bofh@coker.com.au>
References: <200210112028.52316.bofh@coker.com.au> <3DA80F7A.B4E7D94D@amis.com>
Reply-To: Russell Coker <bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11660-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DA80F7A.B4E7D94D@amis.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric Whiting <ewhiting@amis.com>
Cc: reiserfs-list@namesys.com

On Sat, 12 Oct 2002 14:03, Eric Whiting wrote:
> > Also with a device such as a NetApp you have a limited choice of what
> >  hardware you can get.  You generally can't choose from all available
> > sizes of drives, and I have been told that there is no supported option
> > for upgrading a NetApp device to bigger drives (while doing so on Linux
> > software RAID is easy and I've done it many times with both ReiserFS and
> > Ext2/3).
>
> We run netapp boxes with mixed size drive -- 9,18,36,72 all in the same
> box. (even the same shelf) Maybe I didn't understand what you are
> saying...

OK, having tiny 9G drives in the same shelf as newer and faster 72G drives 
makes no sense.  So what you want to do is move the data off the 9G drives 
and onto 72G drives.

I take it from the fact that you still have 9G drives in operation that this 
is not possible.

Running mixed disk sizes is not desirable.  You want to have the newest drives 
possible for best performance and reliability.

-- 
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page

