From: Ric Wheeler <ric@emc.com>
Subject: Re: fs_mark benchmark - update
Date: Mon, 29 Aug 2005 17:15:42 -0400
Message-ID: <43137AFE.1070706@emc.com>
References: <3257ddd0050825050117ead2ba@mail.gmail.com>	 <430DC64D.9010205@namesys.com> <4313006C.9040502@emc.com>	 <Pine.LNX.4.63.0508291436100.29195@alpha.polcom.net>	 <1125319246.5544.19.camel@localhost.localdomain>  <43130DC1.20105@emc.com>	 <1125322484.5544.23.camel@localhost.localdomain> <431311A1.8030906@emc.com> <1125323863.5544.34.camel@localhost.localdomain> <43131684.5040708@emc.com> <43137081.6070304@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25713-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43137081.6070304@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: mingz@ele.uri.edu, Grzegorz Kulewski <kangur@polcom.net>, "Vladimir V. Saveliev" <vs@namesys.com>, Sandeep Tyagi <sandeepktyagi@gmail.com>, okuyamak@dd.iij4u.or.jp, reiserfs <reiserfs-list@namesys.com>


Since you still are in the thinking stage, there are some neat tricks 
that you might be able to do in this space ;-)

One thing that I think might be very interesting is to export some of 
the transaction like semantics explicitely to applications to allow a 
type of bulk async fsync. For example, I am untarring a 10,000 file set 
into a directory - you want a hard promise that it is all on disk, but 
you really don't need that promise until the end of the application.  If 
the application could flag the start of this kind of batch and then wait 
or kick off a group fsync at the end, you could really boost your 
performance.

The benchmark has some kludgy support for testing this kind of sync 
performance through the "-S X" flag.  When X==0, you don't sync, when it 
is 1 you do the file at a time fsync, and then it does some other 
combinations that work well on reiserfs.  By simply delaying the fsync() 
stage into a separate iteration over the file set, you can approach the 
non-fsynced behavior ;-)

ric


Hans Reiser wrote:

>reiser4 will suck at fsync performance, I guarantee it.  fsync is
>completely unoptimized.  It works reliably, but it will be slow. 
>
>The suckage is all eminently fixable,  but not before vanilla inclusion
>is resolved will we address it.
>  
>
