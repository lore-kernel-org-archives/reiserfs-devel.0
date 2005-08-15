From: Marc Perkel <marc@perkel.com>
Subject: Re: Reiser4 and ACLs
Date: Mon, 15 Aug 2005 16:30:32 -0700
Message-ID: <43012598.7080207@perkel.com>
References: <42FEC9F1.9040709@perkel.com>	<20050814080812.GA22983@king.bitgnome.net>	<42FF388F.3010506@perkel.com>	<b14e81f005081405316a06995c@mail.gmail.com>	<17151.17921.996376.693013@gargle.gargle.HOWL>	<87k6in5dri.fsf@evinrude.uhoreg.ca>	<17152.63727.435377.223362@thebsh.namesys.com>	<1124138041.11626.4.camel@localhost> <17152.65201.525419.283987@gargle.gargle.HOWL> <43010157.1030107@perkel.com> <43012440.8020804@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25507-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43012440.8020804@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com



David Masover wrote:

>
> Well, I'll let him speak for himself, but I think it's basically this:
>
> xattrs suck, for reasons which are varied and irrelevant.
>
> When it's done, the sys_reiser4 api (and file-as-dir/metas/whatever) 
> will be able to do everything xattrs did, only much better, faster, 
> and more powerfully.
>
> So, it's more worth their time to work on other things, like:
> - kernel acceptance
> - repacker
> - crypto/compression
> - security ("views" or ACLs)
>
> Of course, if someone wanted to pay them for xattrs, and they didn't 
> have another contract going, they'd probably support xattrs.  But for 
> now, it's probably up to us to add xattr support.
>
> Once it's added, these should do the same thing:
>
> openat ("some_attribute")
> open ("metas/some_attribute")
> // or maybe
> open ("metas/xattrs/some_attribute")
>
> Well, there's more to it than that, but the most important thing is, 
> the xattrs should be a subset of the metas namespace.
>
It seems to me that getting in the Kernel is the most important thing. 
Then getting it compatible with existing standards. Then you build up 
the user based (addicts) and then you add the innovative stuff. 
Otherwise people are going to use Ext3 because it has ACLs and Reiser4 
doesn't. That's where I'm at. If it doesn't do ACLs it doesn't work. I 
need acls.

The way I see it - and I may well be missing something - s that the 
current API is just a way of talking to the security layer. So why not 
support multiple ways to talk to it?
