From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 non-free?
Date: Thu, 06 May 2004 23:47:09 -0700
Message-ID: <409B30ED.5000009@namesys.com>
References: <4097CCA4.4060707@namesys.com> <87fzag139k.fsf@aule.evenmere.org>	<4099A868.9030406@slaphack.com>	<20040506.083242.41632888.wlandry@ucsd.edu>	<87k6zpy8ke.fsf@aule.evenmere.org>	<20040506143643.GB25505@raptus.homelinux.org>	<877jvpy08v.fsf@aule.evenmere.org> <409A7F98.7040609@namesys.com> <87d65hw4hb.fsf@aule.evenmere.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18529-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87d65hw4hb.fsf@aule.evenmere.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Brian Thomas Sniffen <bts@alum.mit.edu>
Cc: debian-legal@lists.debian.org, reiserfs-list@namesys.com

Brian Thomas Sniffen wrote:

>Hans Reiser <reiser@namesys.com> writes:
>
>  
>
>>I just modified the Reiser4 license to be the following:
>>
>>The License: The Anti-plagiarism license is the Gnu Public License
>>Version 2 with the following modification: you may not modify,
>>remove, or obscure any credits in the software unless your
>>modification causes those credits to remain equally prominent and to
>>retain their wording. You are not required to display the credits if
>>the computer has no effective display mechanism, or if you do not
>>distribute the software to others.
>>    
>>
>
>You do realize that this is not GPL compatible, and so works
>derivative of the Linux kernel cannot be meaningfully licensed
>under it, and works licensed under it cannot be shipped linked to any
>GPL'd works, right?
>  
>
It is the license for reiser4progs and not reiser4 in the kernel.

>That's not the end of the world, but it's worth making clear. 
>There are a couple of other problems with this license.  For example,
>what if there is a display mechanism but I must pay an exorbitant
>amount to use it?  Say, I'm doing mkreiserfs on the London Stock
>Exchange ticker's main display.  Sure, that's a ridiculous case, but
>a teletype where the user pays by the byte is not.  Can you restrict
>this to works used interactively?  That's an intentionally different
>phrasing than the GPLv2's -- and intentionally captures programs like
>mkfs, which are not themselves interactive, but which are used in an
>interactive way.
>  
>
Don't use the license for every piece of software, or contact the author 
for that case.  What makes you guys think one license should bind them all?

>Also, as written the license prohibits me from stripping the credits
>out of my own copy if I also, separately, distribute the unmodified
>code.  I don't think that's what you meant -- is it?
>  
>
Seems an obscure point, but I welcome suggestions on fixing obscure 
points of that kind.

>Also, I may not, as written, translate the credits into another
>language, since that changes their wording.
>  
>
Interesting point.

>With those serious questions about the license out of the way, I
>descend to the Faq, which obscures more than it clarifies:
>
>  
>
>>FAQ:
>>
>>Q: Will this license lead to ads?
>>
>>A: No, credits describe the contribution made to a project. Ads describe a
>>product someone wants you to buy. Ads are not the same as credits, and their
>>preservation is not protected by this license.
>>    
>>
>
>Debian's going to have to look really, really closely at every release
>of every piece of software under this license, then, and risk an
>argument -- in a courtroom -- with a copyright holder who considers
>some line to be a credit, or insufficiently prominent in its modified
>form.
>
>For example, moving a credit from mkfs to an installer reduces its
>frequency, as at least one fs is made per install, but other
>filesystems may be made.
>  
>
Talking to the author when you change the crediting is not such a bad 
thing.  It avoids situations like ReiserFS and debian/suse, or KDE and 
Redhat.

>  
>
>>Q: Can we the distro preserve the credits but send the credits to /dev/null.
>>
>>A: No. How can you even ask such a question?
>>    
>>
>
>How about e-mailing them to root?
>
? 

That sound awful.  Why would you want to do that?

>  How about providing a --no-credits switch?
>How about making it on by default?
>
>I expect the answers to be Yes, Yes, No, but I certainly can't read
>your mind.  This license is very, very vague about what is allowed and
>what is not -- normally not so bad, since there's a big clear zone of
>what's allowed, but the line of what's Free and what's not is right
>through the middle of the murky zone.  Whether this is a Free license,
>then, depends very heavily on the licensor.  That's awfully
>inconvenient, from a distributor's point of view.
>  
>
Yeah, governments hate art/porn/nudity for the same reason.  I like art, 
and consider Maplethorpe to be artistically educational and his show was 
a good use of my time.  That he inconvenienced the US government does 
not make me upset with him.

Let me make it simple for you.  When mkreiserfs  is run, let it print 
its credits and let them reach the screen.  That works, and should make 
everyone happy.

All this other stuff, like sending email to root instead of printing the 
credits to the screen, you don't really need to do it, so don't worry 
about whether you can.  Whether you can do stuff you don't need to do is 
not as important as the license ensuring that the people who contributed 
get credited for it. 

Hans

