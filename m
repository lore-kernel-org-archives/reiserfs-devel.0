From: Jeff Davis <reiser-list@empires.org>
Subject: Re: reiser4 non-free? (I throw in the towel)
Date: Tue, 11 May 2004 02:59:15 -0700
Message-ID: <1084269555.22047.138.camel@jeff>
References: <1084025633.28080.196082736@webmail.messagingengine.com>
	 <200405110004.05704.reiser@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18600-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200405110004.05704.reiser@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


> Debian's efforts to make licensing into inflexible dogma are bad, based on a 
> lack of understanding of the tradeoffs inherent in licensing, and deserve 
> opposition.  However, in all teams there is a need to give ground even when 
> one is right, and fighting Microsoft is my priority much more than fighting 
> Debian.  If Debian offers to provide credits in practice but not theory, and 
> there is some possibility of getting into a debian installer in the near 
> future, then I can probably lose a little and risk a little and put both 
> progs and kernel code into GPL V2 for now despite it being a license with  
> flaws that beg for fixing.
> 

I have read most of this discussion in the mail archives. I support your
position no matter whether you chooses plagarizable or not. Even if the
license allows potential to create non-free software, the fact is that,
to me as a user, software from Namesys (and contributors) is free. Until
Namesys (and contributors) uses the license to prevent me from using,
modifying (by myself or hiring someone else), or distributing the
software how I want to, it always will be free.

The freedom of software is the combination of the license, the software
itself, and the developers.

People can even abuse the GPL to a degree, and much GPL software is less
free than reiserfs. Some code is constructed in a very convoluted way
that only the initial developers understand. Some projects have made
architectural choices that, for all practical purposes, eliminate the
ability to make a certain kind of change (a common example is software
for which porting is virtually impossible). Some groups make it
difficult for outsiders to contribute. Some people put their modified
GPL software on their own servers, never distribute the changes, and
then just allow people network access to those servers.

The GPL is a powerful and valuable tool, but if the developers don't
want it to be free, it won't be, even if it's GPL.

I suppose experimentation is required, since people did raise some
interesting questions (such as language translation of credits). You are
in the rare position in which you can change licenses as you wish; most
projects don't have the ability to experiment with licenses.

As far as Debian is concerned, I don't think you give them quite enough
credit. Those people just want a base of freedoms which a normal person
can understand that covers all the software. It's very helpful to have
an OS where you don't have to turn a development project into a legal
investigation, tracking down hundreds of licenses. Now, that "base of
freedoms" may not be agreeable to everyone, but we can't ignore the
value of consistant licensing in an OS. And many of the problems with
DFSG are mitigated by having a well-integrated non-free section
(unfortunately that doesn't solve the problems for reiserfs, which needs
to be in the OS install).

Regards,
	Jeff


