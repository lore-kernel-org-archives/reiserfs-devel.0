From: David Masover <ninja@slaphack.com>
Subject: Re: Reiser4 and ACLs
Date: Sun, 14 Aug 2005 14:52:37 -0500
Message-ID: <42FFA105.1070408@slaphack.com>
References: <42FEC9F1.9040709@perkel.com>	<20050814080812.GA22983@king.bitgnome.net>	<42FF388F.3010506@perkel.com>	<b14e81f005081405316a06995c@mail.gmail.com> <17151.17921.996376.693013@gargle.gargle.HOWL> <42FF4A1C.9030406@perkel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25464-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42FF4A1C.9030406@perkel.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marc Perkel <marc@perkel.com>
Cc: reiserfs-list@namesys.com

Marc Perkel wrote:
> 
> 
> Nikita Danilov wrote:
> 
>> Not exactly. As a matter of fact, ACL and EA support was already
>> implemented in reiser4. But it used standard xattrs API to interface to
>> the user-land, and it was decided that reiser4 should go sys_reiser4()
>> route instead. So, it was reaped.
>>
>> Nikita.
>>  
>>
> 
> OK - now I'm confused. Why not the standard?

Why aren't you using ext3?  Or Windows?  In your own words:
> After all - it is standard. 

> And - when is this going to be included?

Your guess is as good as mine.

> ACLs finally restored some of this power although the implementation in 
> Linux is crude at best.

That's why the "standard" way isn't happening.  Although I wish they'd 
left it in, and the standard xattrs interface, and created the "better" 
interface later.

> I thought there is a glimmer of hope that some 
> day Linux will catch up to where Novell was 15 years ago. It is so 
> frustrating dealing with Linux culture and VI mentality trying to get 
> people to think outside the box.

Speak for yourself.  After all, you wanted us to do the "standard".

Better yet, go read the whitepaper.  It's on the homepage at 
namesys.com, and it's very human-readable.
