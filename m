From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Conversion from v3.6 to v4 of Reiserfs...
Date: Wed, 25 Feb 2004 13:02:51 +0300
Message-ID: <16444.29387.14114.362859@laputa.namesys.com>
References: <no.id>
	<200402250154.i1P1s0h3028547@sirius.cs.pdx.edu>
	<16444.26645.677420.622216@laputa.namesys.com>
	<403C6A7E.4010407@futuretg.com>
	<16444.27812.94242.98221@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16927-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16444.27812.94242.98221@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>
Cc: reiserfs-list@namesys.com, "The Amazing Dragon (Elliott Mitchell)" <ehem@cs.pdx.edu>

Nikita Danilov writes:
 > Dr. Giovanni A. Orlando writes:
 >  > Nikita Danilov wrote:
 >  > 
 >  > >The Amazing Dragon (Elliott Mitchell) writes:
 >  > > > > From: "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>
 >  > > > >     Actually, there are no a way. You need to backup and re-write it 
 >  > > > > your data.
 >  > > > > 
 >  > > > >     However, I speak with Hans and probably we will release a 
 >  > > > > tool/utility for that purpose.
 >  > > > 
 >  > > > Something like dump?
 >  > >
 >  > >Cf. "Universal file system convertor":
 >  > >http://tzukanov.narod.ru/convertfs/
 >  > >
 >  > >no warranty, especially given that loop-back support required for
 >  > >convertfs was added into reiser4 only recently.
 >  > >  
 >  > >
 >  > Hi,
 >  > 
 >  >        We plan to support in our distro ReiserFS 3.x and 4.0 at the same 
 >  > time.
 >  > 
 >  >        About to port OLD data to ReiserFS 4, a simple 'tar cvfz' will be 
 >  > usefull to backup and replace.
 >  > 
 >  >        I don't think, this tool
 >  > 
 >  > http://tzukanov.narod.ru/convertfs/
 >  > 
 >  >     support reiserFS 4.0, because it is dated March 2002.
 > 
 > convertfs does _not_ need special support for new file system type. It
 > can convert arbitrary file system foo to arbitrary file system bar, on
 > the condition that bar supports loop back files.

Sorry, I got it backward. Loop back support on foo is required. So, to
convert reiserfs to reiser4 one needs loop back on reiserfs, which is
not a problem.

 > 
 >  > 
 >  >     If someone knows some other link, for this tool I can take a look.
 > 

Nikita.

 > 
