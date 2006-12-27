From: Quinn Harris <quinn@quinnh.org>
Subject: Re: Hans selling Namesys
Date: Tue, 26 Dec 2006 17:25:46 -0700
Message-ID: <200612261725.47451.quinn@quinnh.org>
References: <45902CC4.1090002@feise.com> <45903FE3.7090603@t-online.de> <2411.201.52.131.187.1167088942.squirrel@webmail2.ludwig.org.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-30344-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2411.201.52.131.187.1167088942.squirrel@webmail2.ludwig.org.br>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

All of the Reiser4 code as it exists today will always be available under G=
PL=20
no matter who buys the copyright.  The only reason I can see to buy Namesys=
=20
is either to offer or use a re-licensed copy of the code or to take advanta=
ge=20
of the knowledge of the current Namesys employees.  There might be some val=
ue=20
in existing contracts with DARPA or whoever but I am not sure.

The re-license thing could be very difficult if there are many people who=20
decide on if it will be re-licensed.  This is why Hans has always retained=
=20
exclusive copyright to all the code.  I would question if re-licensing woul=
d=20
be feasible with any structure that could be called community ownership.

In the short term I believe the current employees of Namesys (how many are=
=20
there now?) are the most valuable asset.  It takes time to become acclimate=
d=20
to such a complex piece of code.  Having to rehire a new set of people woul=
d=20
easily set the work back by a few months to a year.

On the other hand, I also believe that exclusive rights to the code could b=
e=20
very valuable to companies like Apple or even everybodies favorite,=20
Microsoft.

Even with knowledge of the mechanisms Reiser4 uses, I expect it could cost=
=20
another company over a million dollars more to completely re-implement a=20
similar file system compared to having uninhibited use of the existing code.

I could see a company like Apple using a file system like Reiser4 to improv=
e=20
the performance of the existing file system and more importantly to enable=
=20
acceptable performance for a namespace the unifies the file system and XML=
=20
(chosen because of its widespread use) allowing for the elimination of=20
the "save file" paradigm.  Basically, applications could store data in an i=
n=20
memory XML DOM (as I expect Open Office does today) which would be seamless=
ly=20
written to disk after each transaction on that DOM.  (Reiser4 can do this=20
much better than any other FS because of efficient storage of small items a=
nd=20
the reiser syscall if ever finished).  Such a system could claim, "Never=20
loose data, Ever."  (This is what databases have been doing for decades.) =
=20
Actually you could probably loose a few seconds of data as I expect flushin=
g=20
to disk after each character typed wouldn't be acceptable.  Though even thi=
s=20
problem could be eliminated with an small NVRAM, Flash and HD hybrid. =20

Wrap the NVRAM and flash in hard casing, mix in a good real time internet=20
backup scheme (plugins and efficient extensible metadata would help here),=
=20
and it would become possible to insure against data loss at a reasonable=20
cost.  Something like, "with this laptop and OS, if you loose any data, eve=
n=20
if you drop it off a 20 story building 1 second after typing that last word=
,=20
we will cut you a check for $100,000.  Some limitations apply."  I think ma=
ny=20
would pay an extra few hundred dollars for something like that.

Of course, getting to that place would require alot of further work but=20
Reiser4 would be a good start.

I would rather see this under GPL in Linux but this verbage was to elaborat=
e=20
on one reason that the existing code would be worth a substantial chunk of=
=20
change.  This could also be a reason why it would be in the interest of=20
existing Linux companies to ensure development continues.

Bottom line, Han's best hope at making any significant amount on this sale=
=20
would rest in a company seeing the value in Reiser4 wishing to re-license t=
he=20
code.


On Monday 25 December 2006 4:22 pm, azaiats@ludwig.org.br wrote:
> I'm an offer to buy some or little part of the legal properties of
> Namesys, still compromised with open source community.
>
> How much it costs at all?
>
> I work with reiser4 in my own enterprise private distribution and want
> this project lasting for a long time.
>
> Andr=E9 Zaiats.
> Codix - S=E3o Paulo - Brazil
>
> > Hello,
> > from reading all this stuff it seems to look like a competitors
> > intrigue. But we don't have any evidences upon this neither do
> > we have a sentence, yet...
> >
> > Can we build up a ReiserFS-community based fund to buy or save
> > Namesys over time to help continue the current development? Just
> > an idea.
> >
> >  From my point of view the there are three general alternatives:
> > * let/help someone really interested to buy Namesys
> > * increase Hans' financial input directly to help him&&ReiserFS
> > * ReiserFS3&4 get bought by someone and become commercial or
> >    will vanish at once
> >
> > As I followed ReiserFS since 1997(?+-) but really don't know
> > enough about the current case I'm not sure with my priorities in
> > the list above.
> >
> > Best wishes to all contributors,
> > my best wishes for your Xmas!
> >
> > Manuel
> >
> > Joe Feise wrote on '06-12-25 20:55:
> >> http://www.wired.com/news/technology/0,72342-0.html
