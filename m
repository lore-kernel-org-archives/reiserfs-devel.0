From: Hans Reiser <reiser@namesys.com>
Subject: Re: newbie how to
Date: Thu, 12 Sep 2002 18:37:06 +0400
Message-ID: <3D80A692.6090107@namesys.com>
References: <001401c25a60$3fc96a40$0101a8c0@bummer>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11433-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: darren <teodarren@myrealbox.com>
Cc: 'reiserfs-list' <reiserfs-list@namesys.com>

darren wrote:

>Hi all,
>
>I have a brand new RedHat computer just setup. It currently have two
>partitions...both EXT3.
>
>How do I make one of my drives reiserfs?
>
>
>
>
>  
>
use tar.  tar does a good job, and nfs to a file server (or some 
borrowed hard drive) plus tar will work well.

Remember to run lilo after untarring.


