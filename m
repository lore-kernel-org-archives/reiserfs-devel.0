From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Bugs?
Date: Mon, 18 Aug 2003 11:47:02 +0400
Message-ID: <16192.33910.66770.917603@laputa.namesys.com>
References: <01KZKIROVK1W90R3WK@EMAIL1.BYU.EDU>
	<3F3FD89B.7000107@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15357-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F3FD89B.7000107@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: lkthomas@sml.dyndns.org
Cc: William Jared Roberts <wjr6@email.byu.edu>, reiserfs-list@namesys.com

Hans Reiser writes:
 > William Jared Roberts wrote:
 > 
 > >>are you meaning that remount it manually ?
 > >>also, I know the problem will happen during startup and shutdown, sigh...
 > >>
 > >>    
 > >>
 > >
 > >No.  You can have the kernel initially mount the partition read-write.  IIRC,
 > >you can use rdev and/or kernel command-line options to acheive this effect. 
 > >It's just a band-aid for the real problem though, if you really need to get into
 > >your box.
 > >
 > >
 > >
 > >  
 > >
 > He shouldn't be using reiser4 for anything other than bug finding and 
 > stress testing.  Given how extensively we warn people that, I assume 

Yes, this is right. Moreover, read-only mode is yet unsupported.

 > this is just a toy installation without any real data on it for the 
 > purpose of seeing how fast he can crash it.....
 > 
 > -- 
 > Hans
 > 

Nikita.

 > 
