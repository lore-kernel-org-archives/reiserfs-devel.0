From: Oliver Hunt <oliverhunt@gmail.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 2 Sep 2004 11:22:41 +1200
Message-ID: <4699bb7b04090116227ad1e7c0@mail.gmail.com>
References: <Pine.LNX.4.44.0408261011410.27909-100000@chimarrao.boston.redhat.com> <200408261819.59328.vda@port.imtp.ilyichevsk.odessa.ua> <1093789802.27932.41.camel@localhost.localdomain> <1093804864.8723.15.camel@lade.trondhjem.org> <20040829193851.GB21873@jeremy1> <20040901201945.GE31934@mail.shareable.org> <20040901202641.GJ4455@legion.cup.hp.com> <20040901203101.GG31934@mail.shareable.org> <20040901203543.GK4455@legion.cup.hp.com> <20040901204746.GI31934@mail.shareable.org> <20040901205140.GL4455@legion.cup.hp.com>
Reply-To: Oliver Hunt <oliverhunt@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21238-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040901205140.GL4455@legion.cup.hp.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeremy Allison <jra@samba.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, reiserfs-list@namesys.com

The loss of forks in the file is exxactly the problem you used to have
when transferring native Mac files to a PC...

This meant in order to transfer files to different filesystem you
often needed to tar/zip/whatever them first.

Bare in mind this would let us do the whole MacOS thing of putting an
entire application(plus plugins, etc) inside one "file"...

--Oliver

On Wed, 1 Sep 2004 13:51:40 -0700, Jeremy Allison <jra@samba.org> wrote:
> On Wed, Sep 01, 2004 at 09:47:46PM +0100, Jamie Lokier wrote:
> > Jeremy Allison wrote:
> > > > I meant when I copy not using Samba.  For example, I copy the .doc
> > > > file in Windows NT to an FTP server.
> > > >
> > > > Does the FTP operation magically linearise the .doc streams on demand?
> > > > Or does FTP lose part of the Word document?
> > >
> > > Good question. It depends if the Microsoft ftp client is streams-aware,
> > > and understands the Microsoft OLE structured storage format and will do
> > > the linearisation on demand or not. I must confess I haven't tested this,
> > > as I don't ever run Windows other than on vmware sessions for Samba testing
> > > these days :-).
> > >
> > > Probably a non-Microsoft ftp client would lose part of the word doc.
> > 
> > So you're saying SCP, CVS, Subversion, Bitkeeper, Apache and rsyncd
> > will _all_ lose part of a Word document when they handle it on a
> > Window box?
> >
> > Ouch!
> 
> Yep. It's the meta data that Word stores in streams that will get lost.
> 
> 
> 
> Jeremy.
> -
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>
