From: Chris Dukes <pakrat@www.uk.linux.org>
Subject: Re: implementing reiserfs in C++ for a new OS
Date: Wed, 11 Aug 2004 18:16:19 +0100
Sender: <pakrat@www.linux.org.uk>
Message-ID: <20040811171619.GA22181@parcelfarce.linux.theplanet.co.uk>
References: <20040809172437.GP1284@nysv.org> <71d3364904080922267e8c14af@mail.gmail.com> <200408101312.48888.reiserfs-list@quinnh.org> <4119273E.1040104@namesys.com> <20040810211951.GU1284@nysv.org> <41194690.5050908@namesys.com> <1365645117.20040811065416@tnonline.net> <4119B7D1.7000705@namesys.com> <16665.61639.659924.562747@laputa.namesys.com> <411A4CA1.9090604@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20197-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <411A4CA1.9090604@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Nikita Danilov <Nikita@Clusterfs.COM>, Spam <spam@tnonline.net>, reiserfs-list@namesys.com

On Wed, Aug 11, 2004 at 09:43:13AM -0700, Hans Reiser wrote:
> Nikita Danilov wrote:
> 
> >
> >Copyright to result of translation belongs to the translator. At
> >least, according to Russian law.

Unless it was translated as a work for hire, then the contract is
generally that the copyright belongs to whoever hired the work.
> >
> > 
> >
> I may be completely wrong legally, esp. in Russia.  I personally think 
> it should belong to the original author if the original copyright is 
> still valid.

Hans,
Since you obviously have a stake in this intellectual property,
have you considered talking with your lawyer instead of giving us
your fantasies?
> 
> Otherwise harry potter can get translated and no need to pay rowling.

Not entirely.  Such a translation would be deemed a derivative work.
The copyright on the translated version belongs to the translator
(Unless the translator did it for pay).  However, distribution of that
derivative work may be controlled by copyright holder of the work
the translation was derived from (IE, rowling wouldn't be able to distribute
the translation, but may be able to prevent the distribution of the
translation).

Now, I've been deleting a lot of this crap but.
How do these folks intend to redo reiserfs in C++?  Is it a function by
function translation to C++, or do they intend to read it, develop a
language independent specification for reiserfs and implement from that 
(reverse engineer)?

If they intend to do direct translation it's a derivative work.
Copyright belongs to them, right to distribute is limited to the terms
of the license they were under when they did the translation.

If they intend to reverse engineer, you could go after them through
the aid of DMCAish legislation on the books, but you'll also do a good
job of convincing everyone that you're an asshole.

You might also want to consider taking this offline and
1) Determine the specific license these fools wish to use for their work.
2) Determine their jurisdiction.
3) Determine the compensation they can provide namesys.

-- 
Chris Dukes
Been there, done that, got the slightly-charred t-shirt. -- Crowder
