From: Mat <jackdachef@gmail.com>
Subject: Re: reiser4 inclusion?
Date: Sat, 25 Apr 2009 23:52:27 +0000 (UTC)
Message-ID: <loom.20090425T232902-807@post.gmane.org>
References: <alpine.DEB.2.01.0904181302440.6162@bogon.housecafe.de>	 <542E227E-E31D-496C-93FB-19393133297F@MailNewsRSS.com>	 <200904250153.33258.volkerarmin@googlemail.com>	 <2E9381E6-A09A-4330-9A61-C4B7D7CE0E71@MailNewsRSS.com>	 <49F2CF9A.1060202@inn.nl> <49F2D43F.90105@ontolab.com>	 <8c113a260904250416n28fbdacs682ef8e6859b7dbf@mail.gmail.com>	 <49F339A2.9080705@ontolab.com>	 <8c113a260904251204u41f90028n975006634ed99e59@mail.gmail.com>	 <49F36F4E.3000906@ontolab.com> <8c113a260904251404m51bb4f1fo9267fe72ddad2c54@mail.gmail.com> <49F39A39.6040401@ontolab.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Christian Stroetmann OntoLab <stroetmann <at> ontolab.com> writes:

> 
> Dear Alli;
> > On Sat, Apr 25, 2009 at 10:15 PM, Christian Stroetmann OntoLab
> > <stroetmann <at> ontolab.com> wrote:
> >  
> >> Dear Alli,
> >>    
> >>> Well, as you noted at the end of your reply, it is polite to reply to
> >>> answers. Maybe you can be the one to start.
> >>>
> >>>       
> >> What am I doing since months?
> >>     

Hi guys,

as an outsider let me try to explain what "OntoFS" is all about (from what I
understood):

what Christian with OntoLab and other companies or organizations are doing here
is basic research and putting that research to practice:

"OntoFS" shall become a kind of versioning file system
(http://en.wikipedia.org/wiki/Versioning_file_system) based on reiser4 (or
another filesystem if it's not possible to use it). This in some way follows
Hans' vision of developing a filesystem in which everything is a file and whose
life can be tracked (to simplify it really roughly). 

On the other hand it shall also become an "ontological" filesystem
(http://en.wikipedia.org/wiki/Ontology_%28information_science%29) with which
files can be managed directly on the filesystem level. If I recall correctly
another of Hans' visions was to use reiser4 as kind of database-filesystem which
more and more today could become reality in association with ontology and the
so-called semantic Web or (on a simpler level) semantic desktop (?) (see kde 4).
In this regard reiser4' plugin architecture should be really helpful in order to
add more and more functionality.

DISCLAIMER:
I'm not affiliated with ontolab and as an outsider my description doesn't
necessarily have to describe the status or intentions of "OntoFS" accurately 

for more information have a look at:
* https://picoforge.int-evry.fr/cgi-bin/twiki/view/Ontofs/Web/OntofsIntro
(you can use translate.google.com to translate it into english from vietnamese)
* http://www.eecs.harvard.edu/~syrah/pass/
* and the corresponding wikipedia entries about ontology, semantic web, etc.

Greetings

Mat




