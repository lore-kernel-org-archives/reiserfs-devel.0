From: David Masover <ninja@slaphack.com>
Subject: Re: Reiser4 and ACLs
Date: Mon, 15 Aug 2005 18:25:17 -0500
Message-ID: <4301245D.30807@slaphack.com>
References: <42FEC9F1.9040709@perkel.com>	<20050814080812.GA22983@king.bitgnome.net>	<42FF388F.3010506@perkel.com>	<b14e81f005081405316a06995c@mail.gmail.com>	<17151.17921.996376.693013@gargle.gargle.HOWL>	<87k6in5dri.fsf@evinrude.uhoreg.ca> <17152.63727.435377.223362@thebsh.namesys.com> <4301009B.3080808@perkel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25505-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4301009B.3080808@perkel.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marc Perkel <marc@perkel.com>
Cc: reiserfs-list@namesys.com

Marc Perkel wrote:
> 
> 
> Nikita Danilov wrote:
> 
>> Sorry, it seems I was too vague. It's exactly the opposite: standard
>> xattr API was abandoned in favour of accessing EAs and ACLs through
>> pseudo files. The latter method is not implemented yet, and I don't know
>> how stable sys_reiser4() API is currently. Hans is the proper person to
>> ask.
>>
>>
>>
> Why not have more than one interface if you need that? Is there any 
> reason for not supporting the standard that is in the kernel now? Reiser 
> 3 supports it.

With third-party patches, yes.  And because there was no reiser4 and no 
metas.
