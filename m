From: Yury Umanets <umka@namesys.com>
Subject: Re: EVMS Reiser FSIM
Date: Wed, 29 May 2002 18:17:43 +0400
Message-ID: <3CF4E307.1010805@namesys.com>
References: <OFB49DCA39.27F715F1-ON85256BC8.004B436D@pok.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10434-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Steve Pratt <slpratt@us.ibm.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>, Andrew Clausen <clausen@gnu.org>

Steve Pratt wrote:

>Thanks for all the help answering questions about the reiser utilities.  I
>have released the  ReiserFS FSIM into the EVMS CVS tree to be included in
>our upcoming 1.1 release.   Check it out if you get a chance and feel free
>to give me comments.  Also let me know if you think more options are
>required on mkfs and fsck.  I only did the basics and avoided non-standard
>journals since the kernel file system code is not readily available yet.
>When it is, I can go back and add that support.
>  
>
I thing you have released an incorrect reiserfs FSIM in theory. On my 
own you should add extra parameters
support into GNU Parted (quite simple task). And then you might be using 
it as central component of FSIM
for *ALL* filesystems. Not just for reiserfs.

Or you might be using some library (from reiserfsprogs package or from 
progsreiserfs package).

The way you have selected, might be used by an propriatary software, 
that wanted to use GPL project, not other GPL project.

BTW, I have almost done smart resizing (from partition start) in 
libreiserfs. But you can't using the libraries of third pesons, so you 
will haven't smart resizing and other features in your FSIM :))

Yet another issue. One man almost done JFS support for GNU Parted. Are 
you going to add it to EVMS too? I think yes. And probably you will do 
it in maner like ReiserFS (forking and piping).

Yury Umanets


