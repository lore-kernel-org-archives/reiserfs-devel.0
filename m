From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: reiser4 debugging status info
Date: Fri, 15 Aug 2003 20:14:18 +0400
Message-ID: <16189.1754.116380.909774@laputa.namesys.com>
References: <3F3CFE6B.1010700@namesys.com>
	<16189.659.769102.828401@laputa.namesys.com>
	<3F3D0575.1020504@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15327-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F3D0575.1020504@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Reiserfs List <reiserfs-list@namesys.com>, Oleg Drokin <green@namesys.com>

Hans Reiser writes:
 > Nikita Danilov wrote:
 > 
 > >Hans Reiser writes:
 > > > Since some of you have started to play with reiser4, I think we should 
 > > > probably send a paragraph describing our debugging status every day or 
 > > > so until it becomes more stable.
 > > > 
 > > > So here is an excerpt from Oleg's timesheet that may interest those of you experimenting with reiser4.
 > > > 
 > > > +		 Experimenting with reiser4, found that tail conversion process
 > > > +		 changes modification time of a file converted which confuses
 > > > +		 bitkeeper and potenionally a lot more applications.
 > > > +		 Found one of the places and working with Nikita on fixing that
 > > > +		 one, but that did not help, looking for other code pieces that
 > > > +		 might lead to this, have not finished.
 > > > +		 Nikita committed some fixes that are supposedly important and
 > > > +		 should be enough to make new release (with 64 bit fixes and
 > > > +		 progs fixes), unfortunately new code crashes on fsx very
 > > > +		 quickly which makes it not suitable for release. Looking for
 > > > +		 cause, exchanging informations with Nikita.
 > > > 
 > >
 > >We used to have "News" section on our web site. Probably this is more
 > >relevant place than mailing list.
 > >
 > > > 
 > > > 
 > > > -- 
 > > > Hans
 > > > 
 > > > 
 > >
 > >Nikita.
 > >
 > >
 > >  
 > >
 > nobody ever read that, and I think the mailing list is much more 
 > appropriate than the website, because the website had problems with 
 > being obsolete when it had the News section.

I think best way to settle this is to ask list readers. :)

 > 
 > -- 
 > Hans
 > 

Nikita.

 > 
