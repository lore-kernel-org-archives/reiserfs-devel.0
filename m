From: Robert Brockway <robert@timetraveller.org>
Subject: Re: PLEASE: take me out of this nightmare!!!
Date: Thu, 11 Jul 2002 14:53:47 +1000 (EST)
Message-ID: <Pine.LNX.4.44.0207111448120.12693-100000@avon.timetraveller.org>
References: <20020711033313.GA21061@willow.seitz.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10964-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020711033313.GA21061@willow.seitz.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Wed, 10 Jul 2002, Ross Vandegrift wrote:

> http://spamassassin.sf.net and get over it.
> 
> I haven't seen a single spam on this list since I started using it.

At the risk of saying "me too" I have to concur 100%.  I haven been using 
SpamAssassni for months and it is great.  The first I see of spam on most 
lists is when someone follows upand quotes tghe spam.  If they didn't do 
this I'd never see it.

I recomend using SpamAssassin in client/server mode (with spamc & spamd) 
as performance is orders of magnitude better and takes little more setup.  
Before I changed over to the client/server setup I floored my mail server 
by accidentally dumping 100 emails simultaneously to the box (it is a 
K6-233 with 192Mb ram, and yes it is running Reiserfs :)  I tested the 
client/server setup be sending 35000 emails to the box over a few hours 
(hundreds or thousands at a time) and it didn't break a sweat.

If anyone gets stuck I'm happy to mail the setup I use to people.

Cheers,
	-Rob

