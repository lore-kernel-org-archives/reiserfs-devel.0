From: Jeremy West <jkwest@gmail.com>
Subject: Re: reiser4 and reiserfs co-existence?
Date: Tue, 9 Nov 2004 13:11:04 -0500
Message-ID: <b28a8861041109101135b1cd88@mail.gmail.com>
References: <b28a886104110808555d3f59dc@mail.gmail.com>
	 <1099933755.13138.4.camel@localhost>
	 <b28a886104110823161fe3a30d@mail.gmail.com>
	 <1099997754.1373.72.camel@tribesman.namesys.com>
	 <b28a886104110907416476fb50@mail.gmail.com>
	 <662c77ee04110909473d0f6dd3@mail.gmail.com>
	 <41911544.5020208@futuretg.com>
Reply-To: Jeremy West <jkwest@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22331-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41911544.5020208@futuretg.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>
Cc: Reiserfs Mailinglist <reiserfs-list@namesys.com>

Well the subject line is rather pointless now.  When I started the
thread, my assumption was that my system was freezing because I had
two partitions with reiser4 and reiserfs.  It's clearly obvious now
that this has never been the problem.  This is a problem with the php
build process.  Something in the build process causes an error in
reiser4 leading to a segmentation fault which renders the system
totally useless.


On Tue, 09 Nov 2004 19:06:44 +0000, Dr. Giovanni A. Orlando
<gorlando@futuretg.com> wrote:
> Michael Barry wrote:
> 
> Of course ReiserFS and Reiser4 will work on different partitions at the
> same time.
> 
> This is the object of these emails ?
> 
> Thanks,
> Giovanni
> 
> --
> 
> --
> --
> 
> Check FT Websites ... http://www.futuretg.com  - ftp://ftp.futuretg.com
> http://www.FTLinuxCourse.com
>     http://www.FTLinuxCourse.com/Certification
> http://www.rpmparadaise.org
> http://GNULinuxUtilities.com
> http://www.YourPersonalOperatingSystem.com
> 
> WorldWide Global Mobile: +39 393 665 4239
> 
> --
> 
> 


-- 
Jeremy West
//---------------------------
"I had a life once... now I have a computer and DSL"
