From: Konstantin Besch <forward@zagon.com>
Subject: Re: reiser4 plugins
Date: Sat, 28 Aug 2004 10:10:44 -0400
Message-ID: <200408281010.44785.forward@zagon.com>
References: <20040825152805.45a1ce64.akpm@osdl.org> <41305619.9030401@namesys.com> <16688.36091.861155.985990@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20987-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16688.36091.861155.985990@gargle.gargle.HOWL>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> I wish you well in your new job, and thank you for the hard work you did 
> for me.

>  Hans

Oh yeah , Nikita , had to say this : BUT thank you for that hard work you did
for us all. 
It seems it is 'bout time to move out of the company, producing public 
software, where leader of the project thanks participants for the work done 
with words "for me" at the end.

Always had my doubts that I should thanks Hans Reiser for the FS :)
And the facts are that my servers for now get ext3. 
Good Day in New York !

                --Sincerely.


On Saturday 28 August 2004 9:47 am, Nikita Danilov wrote:
> Hans Reiser writes:
>  > Nikita Danilov wrote:
>  > > > >Whoever sponsors the benchmark usually wins. Had you forgotten that
>  > > > >mongo setup used by http://www.namesys.com/benchmarks.html was
>  > > > > specially `tuned' to reach peak reiser4 performance? Remember why
>  > > > > you decided to turn OVERWRITE and MODIFY phases off?
>  >
>  > What I should have done was what I did with fsync performance.  With
>  > fsync performance I told people that we had not yet tuned for it, please
>  > wait a bit and we will tune for it, for now it sucks.
>
> Right, and instead of this you are now claiming that these `benchmarks'
> show superior reiser4 performance. Moreover, you are doing this
> aggressively and proposing other people to `eat the dust' over what
> happened to only exist due to your failing to remember something. As
> some other notable LKML poster put it `inform yourself before
> posting'. :-)
>
>  > Instead what I did was discuss with Zam at the time how it could be
>  > fixed, leave it off the website until Zam was given a chance to fix it,
>
> It wasn't Zam. It was me to begin with. OVERWRITE and MODIFY phases were
> turned off after switching to large keys.
>
>  > and then I managed to forget about it.   After release one remembers
>  > what all the things that should have been fixed before release were,
>  > sigh.
>
> [...]
>
>  > I think your characterization of my reasons was unkind and also unfair.
>
> What fairness and kindness one expects after styling others as `puppies'
> in public, and commenting on their hair style in purportedly technical
> argument?
>
> [...]
>
>  > Hans
>
> Nikita.
